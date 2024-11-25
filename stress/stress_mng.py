from cql_access import CQLAccess
from cql_config import CQLConfig
from cql_output import CQLOutput
from stress_summary import StressSummary
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

def internal_command(line: str, params, simulation: bool = False, sleep = 5):

    cql = None
    cmd_params = line.split(",")
    command=cmd_params[0].strip()
    if command == "#REMOVE_KEYSPACE":
        try:
            if not simulation:
                cql = CQLAccess(params)
                cql.open()
                cql.remove_keyspace(cmd_params[1].strip())
        finally:
            if cql:
                cql.close()
        time.sleep(sleep)

def stress_test(output: CQLOutput, params: dict, perf_dir = ".", global_counter=0):

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

                global_counter+=1
                output.print_cmd(cmd, global_counter, 1, cmd_variable)
        else:
            # create command
            run_value_index=1
            for combination in range(len(run_variable_values)):

                cmd_variable = create_variables(params, run_variable_values[combination])
                #cmd_variable = create_variables(run_variables, run_variable_values[combination])
                cmd = template

                for variable in variables:
                    if cmd_variable.get(variable, None):
                        cmd = cmd.replace(f"%{variable}%", cmd_variable[variable])

                global_counter += 1
                output.print_cmd(cmd, global_counter, run_value_index, cmd_variable)
                run_value_index += 1
        output.print()
    return global_counter


def main_execute(env="_cass*.env", perf_dir = ".", log=""):
    unique_date= datetime.datetime.now().strftime("%Y-%m-%d %H_%M_%S")
    global_counter=0

    output = None
    try:
        output = CQLOutput(perf_dir, log)
        output.open()
        output.print_header()

        for file in glob(path.join(perf_dir, "config", env)):

            output.print(f"echo 'Based on: {file}'")
            global_params = CQLConfig(perf_dir).get_global_params(file)
            global_params["DATE"] = unique_date
            global_counter += stress_test(output, global_params, perf_dir, global_counter)

    except Exception as ex:
        output.print(f"SYSTEM ERROR in 'run_executor': {type(ex).__name__} - '{str(ex) if ex is not None else '!! Noname exception !!'}'")

    finally:
        if output:
            output.close()

@click.group()
def remove_group():
    pass

@remove_group.command()
@click.option("-e", "--env", help="name of ENV file (default '_cass.env')", default="_cass.env")
@click.option("-d", "--perf_dir", help="directory with perf_cql (default '.')", default=".")
@click.option("-k", "--keyspace", help="remove keyspace", default="")
@click.option("-s", "--sleep", help="sleep time in seconds", default="5")
def remove(env, perf_dir, keyspace, sleep):
    for file in glob(path.join(perf_dir, "config", env)):
        params = CQLConfig(perf_dir).get_global_params(file)
        internal_command(f"#REMOVE_KEYSPACE,{keyspace}", params, False, int(sleep))
        break

@click.group()
def version_group():
    pass

@version_group.command()
def version():
    """Versions of key components."""
    from cassandra import __version__ as cassandra_version
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
    table.add_row(["cassandra-driver", cassandra_version])
    table.add_row(["python", sys.version])
    print(table)

@click.group()
def summary_group():
    pass

@summary_group.command()
@click.option("-d", "--dir", help="directory with particular items (default './stress_output/')", default="./stress_output/")
def summary(dir):
    """Run performance tests based on ENV file(s)."""
    summary=StressSummary(dir)
    summary.parse()

@click.group()
def run_group():
    pass

@run_group.command()
@click.option("-e", "--env", help="name of ENV file (default '_cass.env')", default="_cass.env")
@click.option("-d", "--perf_dir", help="directory with perf_cql (default '.')", default=".")
@click.option("-l", "--log", help="output (default 'stress-run.sh')", default="stress-run.sh")
def run(env, perf_dir, log):
    """Run performance tests based on ENV file(s)."""
    main_execute(env, perf_dir, log)

cli = click.CommandCollection(sources=[run_group, remove_group, summary_group, version_group])

if __name__ == '__main__':
    cli()

# import subprocess
#
# import re

# # Otevřete log soubor
# with open('stress_output.log', 'r') as file:
#     log_data = file.read()
#
# # Regulární výraz pro zachycení relevantních metrik
# pattern = re.compile(r'total ops\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'partition rate\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'row rate\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'latency mean\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency median\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency 95th percentile\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency 99th percentile\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency 99.9th percentile\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency max\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'Total partitions\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'Total errors\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n')
#
# # Vyhledání metrik v log souboru
# match = pattern.search(log_data)
# if match:
#     results = match.groups()
#     print("Výsledky testu:")
#     print(f"Celkový počet operací: {results[0]}")
#     print(f"Počet operací za sekundu: {results[2]}")
#     print(f"Průměrná latence: {results[6]} ms")
#     print(f"95. percentil latence: {results[10]} ms")
#     print(f"Maximální latence: {results[16]} ms")
#     print(f"Celkový počet chyb: {results[20]}")
# else:
#     print("Nepodařilo se najít výsledky v log souboru.")
