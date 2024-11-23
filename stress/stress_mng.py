from stress.config import Config
import click
import datetime, time
from os import path
from colorama import Fore, Style
from glob import glob
import stress.helper as helper

def get_template(template_path, perf_dir = "."):

    template =""
    if not template_path.lower().endswith(".txt"):
        template_path += ".txt"
    template_list = helper.read_file_whole(path.join(perf_dir, "config", template_path))
    for itm in template_list:
        template += f"{itm.strip()} "
    template = template[:-1]
    return template

def get_arguments(params: dict, arguments):
    iterators=[]


    # define variables and iterators
    for index in range(1, len(arguments)):
        argument = arguments[index]
        values = argument.split("=")

        if len(values) == 2:  # create KEY=VALUE
            params[values[0].strip()] = values[1].strip()
        else:
            key = values[0].strip()
            iterators.append((key, params[key].split(",")))


    # define iterator list size
    count = 1
    for iter in iterators:
        key = iter[0]
        count = count * len(iter[1])
    iterator_list = [-1] * count

    # create combinations
    switch = True
    for iter in iterators:
        size = count / len(iter[1])
        iter_index = 0
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
    return iterator_list

def stress_test(params: dict, perf_dir = "."):

    for i in range(100):
        key=f"RUN{i}"
        if params.get(key, None):
            arguments=params[key].split(",")

            # get template from RUN
            template = get_template(arguments[0].strip(), perf_dir)

            # get list of iterator
            iterator_list=get_arguments(params, arguments)

            # create command based on template (replace variables)


            print(template)

            print("  ",params[key])


def main_execute(env="_cass*.env", perf_dir = "."):
    unigue_date= datetime.datetime.now().strftime("YYYY-%H%M%S")

    for file in glob(path.join(perf_dir, "config", env)):

        print("FILE >>", file)
        global_params = Config(perf_dir).get_global_params(file)
        global_params["DATE"]=unigue_date


        output = stress_test(global_params)


@click.group()
def version_group():
    pass

@version_group.command()
def version():
    """Versions of key components."""
    # from qgate_perf import __version__ as perf_version
    # from qgate_graph import __version__ as graph_version
    # from numpy import __version__ as numpy_version
    # from cassandra import __version__ as cassandra_version
    # from matplotlib import __version__ as matplotlibe_version
    # from prettytable import PrettyTable
    # from colorama import Fore, Style
    # import version
    # import sys
    #
    # table = PrettyTable()
    # table.border = True
    # table.header = True
    # table.padding_width = 1
    # table.max_table_width = 75
    #
    # table.field_names = ["Component", "Version"]
    # table.align = "l"
    #
    # table.add_row([Fore.LIGHTRED_EX + "perf_cql"+ Style.RESET_ALL, Fore.LIGHTRED_EX + version.__version__+Style.RESET_ALL])
    # table.add_row(["qgate_perf", perf_version])
    # table.add_row(["qgate_graph", graph_version])
    # table.add_row(["numpy", numpy_version])
    # table.add_row(["cassandra-driver", cassandra_version])
    # table.add_row(["matplotlib", matplotlibe_version])
    # table.add_row(["python", sys.version])
    # print(table)
    pass


@click.group()
def run_group():
    pass

@run_group.command()
@click.option("-e", "--env", help="name of ENV file (default '_cass.env')", default="_cass.env")
@click.option("-d", "--perf_dir", help="directory with perf_cql (default '.')", default=".")
def run(env, perf_dir):
    """Run performance tests based on ENV file(s)."""
    main_execute(env, perf_dir)

cli = click.CommandCollection(sources=[run_group, version_group])

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



#if __name__ == '__main__':
    # process = subprocess.run('notepad', shell=True)
    # process.wait()