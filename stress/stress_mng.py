from cql_access import CQLAccess
from cql_config import CQLConfig
from cql_output import CQLOutput
from extract_summary import ExtractSummary
from stress_compare import StressCompare
from colorama import Fore, Style
import cql_helper as helper
from glob import glob
import datetime, time
from os import path
import click
import re


def get_template(template_path, perf_dir = "."):

    template =""
    if not template_path.lower().endswith(".txt"):
        template_path += ".txt"
    template_list = helper.read_file_lines(path.join(perf_dir, "config", template_path))
    for itm in template_list:
        template += f"{itm.strip()} "
    template = template[:-1]
    return template

def get_variables(template, pattern=r"%([^%]+)%"):
    return re.findall(pattern, template)

def get_arguments(params: dict, arguments):

    variables={}
    iterators=[]
    iterator_list=[]

    # define variables and iterators
    for index in range(1, len(arguments)):
        argument = arguments[index]
        values = argument.split("=")

        if len(values) == 2:  # create KEY=VALUE
            params[values[0].strip()] = values[1].strip()
            #variables[values[0].strip()] = values[1].strip()
        else:
            key = values[0].strip()
            if params.get(key, None):
                itms = [itm.strip() for itm in params[key].split(",")]
            else:
                items = None
            iterators.append((key, itms))
            variables[key]=itms


    # define iterator list size
    count = 1
    for iter in iterators:
        key = iter[0]
        count = count * len(iter[1])
    if len(iterators)>0:
        iterator_list = [-1] * count

    # create combinations
    switch = True
    for iter in iterators:
        size = count / len(iter[1])
        key = iter[0]
        values = iter[1]

        if switch:
            # sequence 2,2,2 ... 4,4,4
            iter_index = 0
            for iter_value in values:
                for i in range(int(size)):
                    if iterator_list[iter_index + i] == -1:
                        item = {key: iter_value}
                        iterator_list[iter_index + i] = item
                    else:
                        item = iterator_list[iter_index + i]
                        item[key] = iter_value
                iter_index += int(size)
            switch = False
        else:
            # sequence 2,4,8 ... 2,4,8
            for i in range(int(size)):
                iter_index = i * len(iter[1])
                for iter_value in values:
                    if iterator_list[iter_index] == -1:
                        item = {key: iter_value}
                        iterator_list[iter_index] = item
                    else:
                        item = iterator_list[iter_index]
                        item[key] = iter_value
                    iter_index += 1
            switch = True
    return variables, iterator_list

def create_variables(params: dict, run_variable: dict):
    new_variables={}

    for key in params.keys():
        if run_variable:
            if run_variable.get(key, None):
                new_variables[key]=run_variable[key]
                continue
        new_variables[key]=params[key]

    # replace variables
    for key in new_variables.keys():
        itm=new_variables[key]
        variables=get_variables(itm)
        if variables:
            for variable in variables:
                if new_variables.get(variable, None):
                    itm = itm.replace(f"%{variable}%", new_variables[variable])
                else:
                    # TODO: propagate warning
                    print(f"Warning: missing variable {variable}")
            new_variables[key]=itm

    return new_variables

def remove_keyspace(keyspace: str, params, simulation: bool = False):

    cql = None
    try:
        if not simulation:
            cql = CQLAccess(params)
            cql.open()
            cql.remove_keyspace(keyspace)
    finally:
        if cql:
            cql.close()

def remove_table(keyspace: str, table: str, params, simulation: bool = False):

    cql = None
    try:
        if not simulation:
            cql = CQLAccess(params)
            cql.open()
            cql.remove_table(keyspace, table)
    finally:
        if cql:
            cql.close()

def stress_test(output: CQLOutput, params: dict, perf_dir = ".", counter=0):

    for i in range(100):
        ext_cmd=True
        key=f"RUN{i}"
        if params.get(key, None) is None:
            break

        arguments=params[key].split(",")

        # get template from RUN (parse first argument)
        template = get_template(arguments[0].strip(), perf_dir)

        # get list of variables for RUN (parse other arguments)
        run_variables, run_variable_values=get_arguments(params, arguments)

        # get variables from template
        variables=get_variables(template)

        if len(run_variable_values)==0:
            cmd_variable = create_variables(params, None)
            #cmd_variable = create_variables(run_variables, None)
            cmd = template

            for variable in variables:
                if cmd_variable.get(variable, None):
                    cmd = cmd.replace(f"%{variable}%", cmd_variable[variable])

            if cmd_variable["OPERATION"].lower()!="remove":
                counter+=1
            output.print_cmd(cmd, counter, 1, cmd_variable)
        else:
            # create command
            run_value_index=0
            for combination in range(len(run_variable_values)):

                cmd_variable = create_variables(params, run_variable_values[combination])
                #cmd_variable = create_variables(run_variables, run_variable_values[combination])
                cmd = template

                for variable in variables:
                    if cmd_variable.get(variable, None):
                        cmd = cmd.replace(f"%{variable}%", cmd_variable[variable])

                if cmd_variable["OPERATION"].lower() != "remove":
                    counter += 1
                    run_value_index += 1

                output.print_cmd(cmd, counter, run_value_index, cmd_variable)
        output.print()
    return counter


def main_execute(env="_cass*.env", perf_dir = ".", log=""):
    unique_date= datetime.datetime.now().strftime("%Y-%m-%d %H_%M_%S")
    global_counter=0

    output = None
    try:
        output = CQLOutput(perf_dir, log)
        output.open()
        output.print_header()

        filter=path.join(perf_dir, "config", env)
        for file in glob(filter):

            output.print(f"echo 'Based on: {file}'")
            global_params = CQLConfig(perf_dir).get_global_params(file)
            global_params["DATE"] = unique_date
            global_counter = stress_test(output, global_params, perf_dir, global_counter)

    except Exception as ex:
        output.print(f"SYSTEM ERROR in 'run_executor': {type(ex).__name__} - '{str(ex) if ex is not None else '!! Noname exception !!'}'")

    finally:
        if output:
            output.close()

@click.group()
def remove_group():
    pass

@remove_group.command()
@click.option("-e", "--env", help="name of ENV file in config subdirectory (default '_cass.env')", default="_cass.env")
@click.option("-d", "--perf_dir", help="directory with stress tool (default '.')", default=".")
@click.option("-k", "--keyspace", help="name of keyspace for remove", default="")
@click.option("-t", "--table", help="name of table in specific keyspace for remove (if table is empty, the whole keyspace will be removed)", default="")
@click.option("-s", "--sleep", help="sleep time in seconds after remove (default 5)", default="5")
def remove(env, perf_dir, keyspace, table, sleep):
    """Remove keyspace or table from CQL solution"""
    for file in glob(path.join(perf_dir, "config", env)):
        params = CQLConfig(perf_dir).get_global_params(file)

        if table and len(table)>0:
            remove_table(keyspace, table, params, False)
            print(f"Removed table: '{keyspace}.{table}' (ENV: '{file}')")
        else:
            remove_keyspace(keyspace, params, False)
            print(f"Removed keyspace: '{keyspace}' (ENV: '{file}')")
        print(f"Sleep {sleep} seconds ...")
        time.sleep(int(sleep))
        break

@click.group()
def version_group():
    pass

@version_group.command()
def version():
    """Print current version of key components"""
    from cassandra import __version__ as cassandra_version
    from polars import __version__ as polars_version
    from qgate_graph import __version__ as qgate_graph_version
    from prettytable import PrettyTable
    import version
    import sys

    table = PrettyTable()
    table.border = True
    table.header = True
    table.padding_width = 1
    table.max_table_width = 75

    table.field_names = ["Component", "Version"]
    table.align = "l"

    table.add_row([Fore.LIGHTRED_EX + "stress"+ Style.RESET_ALL, Fore.LIGHTRED_EX + version.__version__+Style.RESET_ALL])
    table.add_row(["polars", polars_version])
    table.add_row(["qgate_graph", qgate_graph_version])
    table.add_row(["cassandra-driver", cassandra_version])
    table.add_row(["python", sys.version])
    print(table)

@click.group()
def extract_group():
    pass

@extract_group.command()
@click.option("-d", "--dir", help="directory with particular items (default './stress_output/')", default="./stress_output/")
@click.option("-c", "--csv", help="generate output in CSV form (default 'True')", default="True")
@click.option("-t", "--txt", help="generate output in TXT form (default 'True')", default="True")
def extract(dir, csv, txt):
    """Extract data from 'cassandra-stress' output to the sub-dir 'extract' in CSV and TXT(JSON)"""
    summary = ExtractSummary(dir, path.join(dir, "extract"))
    summary.parse()
    if helper.str2bool(csv):
        summary.save_csv()
    if helper.str2bool(txt):
        summary.save_json()

@click.group()
def compare_group():
    pass

@compare_group.command()
@click.option("-d", "--dir", help="directory with particular items (default './stress_output/')", default="./stress_output/")
@click.option("-c", "--console", help="compare output to the console (default 'True')", default="True")
@click.option("-g", "--graph", help="compare output to the sub-directory 'graph'  form (default 'graph')", default="graph")
def compare(dir, console, graph):
    """Compare data from TXT(JSON) to the sub-dir 'graph'"""
    comp = StressCompare(path.join(dir, "extract"))

    compact_level = "LOCAL_ONE"
    print(f"==== {compact_level}===")
    comp.add_default(compact_level)
    if helper.str2bool(console):
        comp.text()
    if len(graph) > 0:
        comp.graph(path.join(dir, graph))

    compact_level = "LOCAL_QUORUM"
    print(f"==== {compact_level}===")
    comp.add_default(compact_level)
    comp.add_default(compact_level)
    if helper.str2bool(console):
        comp.text()
    if len(graph) > 0:
        comp.graph(path.join(dir, graph))


@click.group()
def generate_group():
    pass

@generate_group.command()
@click.option("-e", "--env", help="name of ENV file (default '_cass.env')", default="_cass.env")
@click.option("-d", "--perf_dir", help="directory with perf_cql (default '.')", default=".")
@click.option("-l", "--log", help="output (default 'stress-run.sh')", default="stress-run.sh")
def generate(env, perf_dir, log):
    """Generate performance tests as *.sh for 'cassandra-stress'"""
    main_execute(env, perf_dir, log)

cli = click.CommandCollection(sources=[generate_group, remove_group, extract_group, compare_group, version_group])

if __name__ == '__main__':
    cli()

