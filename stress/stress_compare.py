from polars import read_csv
from graph_output import GraphOutput
from glob import glob
from os import path
from cql_helper import load_json
from file_marker import FileMarker as const
from cql_output import CQLOutput
import datetime

class StressCompare:
    """ Generate compare stress tests (typically between cassandra v4/old and v5/new).
        The outputs are in json, txt format
    """

    COLUMNS_LOW = ["Performance", "Avrg"]
    COLUMNS_MEDIUM = ["Performance", "Avrg", "Latency 95th", "Latency 99th"]
    COLUMNS_HIGH = ["Performance", "Avrg", "Latency 95th", "Latency 99th", "Latency 999th", "Max"]

    #EXECUTORS_LOW = [4, 8, 16, 32, 64, 128]
    #EXECUTORS_HIGH = [4, 8, 16, 32, 64, 128, 256, 512]

    def __init__(self, input_path, columns: list[str]=COLUMNS_LOW):
        self._input_path = input_path
        self._items=[]
        #self._executors=executors
        self._columns=columns

    def add_file_set(self, join_label, old_label, old_file, new_label, new_file, optional = False):
        self._items.append((old_label, old_file, new_label, new_file, optional, join_label))

    def _run_item(self, old_label, old_file_name, new_label, new_file_name):
        new_file = None
        old_file = None

        for file in glob(path.join(self._input_path, new_file_name + ".csv")):
            new_file = file
        for file in glob(path.join(self._input_path, old_file_name + ".csv")):
            old_file = file

        if new_file is None or old_file is None:
            return None, None

        new = read_csv(new_file)
        old = read_csv(old_file)

        new_row=""
        new_executors=""
        old_executors=""

        # V5
        new_row += f"{new_label}\t"
        for index in range(len(new.columns)):

            if new.columns[index]=="Executors":
                for row in new.rows():
                    new_executors += f"{row[index]}\t"

            for column in self._columns:
                if new.columns[index] == column:
                    for row in new.rows():
                        new_row += f"{row[index]}\t"

        new_executors = new_executors[:-1]
        new_row = new_row[:-1]
        new_row += "\n"

        # V4
        new_row += f"{old_label}\t"
        for index in range(len(old.columns)):

            if old.columns[index]=="Executors":
                for row in old.rows():
                    old_executors+=f"{row[index]}\t"

            for column in self._columns:
                if old.columns[index] == column:
                    for row in old.rows():
                        new_row += f"{row[index]}\t"

        old_executors = old_executors[:-1]
        new_row = new_row[:-1]
        new_row += "\n"

        if old_executors != new_executors:
            print("!!! DIFFERENT EXECUTORS !!!!")
        return new_row.replace(".",",").replace(" ms",""), new_executors

    def text(self):

        executors=""
        output=""
        final_output = ""
        final_executors=""

        for item_set in self._items:
            optional = item_set[4]
            output, executors =self._run_item(item_set[0], item_set[1], item_set[2], item_set[3])

            if output:
                if len(final_executors)==0:
                    final_executors = executors

                final_output += output+"\r\n"

                if executors!=final_executors:
                    print("!!! DIFFERENT EXECUTORS !!!")
            else:
                if not optional:
                    print(f"!!! Missing '{item_set[0]}' & '{item_set[2]}' !!!")

        # create header
        header=f"Test case\t"
        for i in range(len(self._columns)):
            header += f"{executors}\t"
        header = header [:-1]

        print(header)
        print(final_output)

    def add_default(self, consistency_level="LOCAL_ONE"):
        self._items=[]
        # STCS - heavy write, LCS - read heavy
        # L - read heavy, T - write heavy

        # extra tests for WRITE (compare with STCS)
        self.add_file_set(f"v4 vs v5 write_{consistency_level}_STCS",
                          f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS",
                          f"v5 write_{consistency_level}_STCS", f"*v5 write_{consistency_level}_STCS")

        # optional compare
        self.add_file_set(f"v4 vs v5 write_{consistency_level}_STCS-UCS2",
                          f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS",
                          f"v5 write_{consistency_level}_UCS2", f"*v5 write_{consistency_level}_UCS2", True)

        self.add_file_set(f"v4 vs v5 write_{consistency_level}_STCS-UCS4",
                          f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS",
                        f"v5 write_{consistency_level}_UCS4", f"*v5 write_{consistency_level}_UCS4")

        self.add_file_set(f"v4 vs v5 write_{consistency_level}_STCS-UCS8",
                          f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS",
                        f"v5 write_{consistency_level}_UCS8", f"*v5 write_{consistency_level}_UCS8")

        self.add_file_set( f"v4 vs v5 write_{consistency_level}_STCS-UCS10",
                           f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS",
                        f"v5 write_{consistency_level}_UCS10", f"*v5 write_{consistency_level}_UCS10")

        # extra tests for READ (compare with LCS)
        self.add_file_set(f"v4 vs v5 read_{consistency_level}_LCS",
                          f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS",
                        f"v5 read_{consistency_level}_LCS", f"*v5 read_{consistency_level}_LCS")

        # optional compare
        self.add_file_set(f"v4 vs v5 read_{consistency_level}_LCS-UCS2",
                          f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS",
                        f"v5 read_{consistency_level}_UCS2", f"*v5 read_{consistency_level}_UCS2", True)

        self.add_file_set(f"v4 vs v5 read_{consistency_level}_LCS-UCS4",
                          f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS",
                        f"v5 read_{consistency_level}_UCS4", f"*v5 read_{consistency_level}_UCS4")

        self.add_file_set(f"v4 vs v5 read_{consistency_level}_LCS-UCS8",
                          f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS",
                        f"v5 read_{consistency_level}_UCS8", f"*v5 read_{consistency_level}_UCS8")

        self.add_file_set(f"v4 vs v5 read_{consistency_level}_LCS-UCS10",
                          f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS",
                        f"v5 read_{consistency_level}_UCS10", f"*v5 read_{consistency_level}_UCS10")


    def run_default(self, consistency_level="LOCAL_ONE"):
        self.add_default(consistency_level)
        self.run()

    def graph_all(self, output_dir="output"):
        """Generate all graphs"""

        graph = GraphPerformance()

        output_list=[]

        # generate all
        filter=path.join(self._input_path, "*.txt")
        for input_file in glob(filter):
            for file in graph.generate_from_file(input_file, output_dir):
                output_list.append(file)


    def _graph_item(self, old_label, old_file_name, new_label, new_file_name):
        new_file = None
        old_file = None

        for file in glob(path.join(self._input_path, new_file_name + ".txt")):
            new_file = file
        for file in glob(path.join(self._input_path, old_file_name + ".txt")):
            old_file = file

        if new_file is None or old_file is None:
            return None, None, None

        new_header, new_cores = self._parse_json(new_file)
        old_header, old_cores = self._parse_json(old_file)

        # compare
        compare_cores = []

        for core in new_cores:
            core['group']=new_label
            compare_cores.append(core)
        for core in old_cores:
            core['group'] = old_label
            compare_cores.append(core)

        return compare_cores, new_header['duration'], datetime.datetime.fromisoformat(new_header['now'])

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

    def graph(self, output_dir="output"):
        """Generate graph based on expected compare"""
        from qgate_graph.graph_performance import GraphPerformance

        for item_set in self._items:
            optional = item_set[4]
            join_title = item_set[5]
            compare_cores, duration, now = self._graph_item(item_set[0], item_set[1], item_set[2], item_set[3])

            if compare_cores:
                # build text output
                output = CQLOutput(output_screen=False, text=True)
                output.open()
                graph = GraphOutput(output)
                graph.print_header(now, join_title, duration)
                graph.print_details(compare_cores)
                graph.print_footer(True, duration)

                #print(output.text_buffer)
                # create graph based on text output

                generator = GraphPerformance()
                generator.generate_from_text(output.text_buffer, output_dir, suppress_error=True)
                output.close()

            else:
                if not optional:
                    print(f"!!! Missing '{item_set[0]}' & '{item_set[2]}' !!!")


        # executors=""
        # output=""
        # final_output = ""
        # final_executors=""
        #
        # for item_set in self._items:
        #     optional = item_set[4]
        #     output, executors =self._run_item(item_set[0], item_set[1], item_set[2], item_set[3])
        #
        #     if output:
        #         if len(final_executors)==0:
        #             final_executors = executors
        #
        #         final_output += output+"\r\n"
        #
        #         if executors!=final_executors:
        #             print("!!! DIFFERENT EXECUTORS !!!")
        #     else:
        #         if not optional:
        #             print(f"!!! Missing '{item_set[0]}' & '{item_set[2]}' !!!")
        #
        # # create header
        # header=f"Test case\t"
        # for i in range(len(self._columns)):
        #     header += f"{executors}\t"
        # header = header [:-1]
        #
        # print(header)
        # print(final_output)
