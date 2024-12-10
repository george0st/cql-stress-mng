from glob import glob
from os import path
from cql_helper import load_json
from file_marker import FileMarker as const
from graph_output import GraphOutput
from cql_output import CQLOutput
import datetime


class StressGraph:

    def __init__(self, input_path):
        self._input_path = input_path

    def _parse_json(self, input_file):

        header=""
        cores=[]
        with open(input_file, "r") as f:

            while True:
                line = f.readline()
                if not line:
                    break
                if line[0] == '#':
                    continue
                input_dict = load_json(line)
                if not input_dict:
                    continue
                if input_dict[const.PRF_TYPE] == const.PRF_HDR_TYPE:
                    # header items
                    header=input_dict
                elif (input_dict[const.PRF_TYPE] == const.PRF_CORE_TYPE):
                    cores.append(input_dict)
        return header, cores

    def join(self, file_names: list[str]):
        join_cores=[]
        for file_name in file_names:
            cores, header = self._get_data(file_name)
            if cores:
                if len(cores)>0:
                    for core in cores:
                        join_cores.append(core)

        if header and len(header)>0:
            return join_cores, header['duration'], datetime.datetime.fromisoformat(header['now'])
        return None, None, None

    def graph(self, output_dir, new_label, join_cores, duration, now):
        from qgate_graph.graph_performance import GraphPerformance

        if join_cores:
            # build text output
            output = CQLOutput(output_screen=False, text=True)
            output.open()
            graph = GraphOutput(output)
            graph.print_header(now, new_label, duration)
            graph.print_details(join_cores)
            graph.print_footer(True, duration)

            # create graph based on text output
            generator = GraphPerformance()
            generator.generate_from_text(output.text_buffer, output_dir, suppress_error=True)
            output.close()
        # else:
        #     if not optional:
        #         print(f"!!! Missing '{item_set[0]}' & '{item_set[2]}' !!!")

    def _get_data(self, file_name):

        real_file=None
        for file in glob(path.join(self._input_path, file_name + ".txt")):
            real_file = file

        if real_file is None:
            return None, None

        new_header, new_cores = self._parse_json(real_file)

        return new_cores,new_header


