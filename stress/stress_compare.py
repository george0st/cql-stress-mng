from polars import read_csv
from graph_output import GraphOutput
from glob import glob
from os import path
from cql_helper import load_json
from file_marker import FileMarker as const
from cql_output import CQLOutput
import datetime


class StressCompare:
    """ Generate compare stress tests (typically between e.g. cassandra v4/old and v5/new).
        The outputs are in json, txt format
    """

    COLUMNS_LOW = ["Performance", "Avrg"]
    COLUMNS_MEDIUM = ["Performance", "Avrg", "Latency 95th", "Latency 99th"]
    COLUMNS_HIGH = ["Performance", "Avrg", "Latency 95th", "Latency 99th", "Latency 999th", "Max"]

    #EXECUTORS_LOW = [4, 8, 16, 32, 64, 128]
    #EXECUTORS_HIGH = [4, 8, 16, 32, 64, 128, 256, 512]

    def __init__(self, input_path, columns: list[str]=COLUMNS_LOW, old_prefix="v4", new_prefix="v5"):
        """
        Compare requested outputs.

        :param input_path:      Input path for extracted files
        :param columns:         list of columns for compare
        :param old_prefix:      old prefix for files e.g. "v4"
        :param new_prefix:      new prefix for files e.g. "v5"
        """
        self._input_path = input_path
        self._items=[]
        self._columns=columns
        self._old_prefix=old_prefix
        self._new_prefix=new_prefix

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

        # new dataset
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

        # old dataset
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
        """
        Text compare, focus on CSV files as input source
        :return:
        """

        executors = ""
        output = ""
        final_output = ""
        final_executors=""

        for item_set in self._items:
            optional = item_set[4]
            output, executors = self._run_item(item_set[0], item_set[1], item_set[2], item_set[3])

            if output:
                if len(final_executors)==0:
                    final_executors = executors

                final_output += output+"\r\n"

                if executors != final_executors:
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

    def add_cmp_same_versions(self, consistency_level="LOCAL_ONE", read="simple1", write="insert"):
        self._items=[]

        # extra tests for WRITE (compare with 1_6B)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 1_6B {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 1_6B_{consistency_level}", f"*{self._old_prefix} 1_6B_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 1_6B_{consistency_level}", f"*{self._new_prefix} 1_6B_{write} *_{consistency_level}")

        # extra tests for WRITE (compare with 2_1KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 2_1KB {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 2_1KB_{consistency_level}", f"*{self._old_prefix} 2_1KB_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 2_1KB_{consistency_level}", f"*{self._new_prefix} 2_1KB_{write} *_{consistency_level}")

        # extra tests for WRITE (compare with 3_10KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 3_10KB {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 3_10KB_{consistency_level}", f"*{self._old_prefix} 3_10KB_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 3_10KB_{consistency_level}", f"*{self._new_prefix} 3_10KB_{write} *_{consistency_level}")

        # extra tests for WRITE (compare with 4_50KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 4_50KB {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 4_50KB_{consistency_level}", f"*{self._old_prefix} 4_50KB_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 4_50KB_{consistency_level}", f"*{self._new_prefix} 4_50KB_{write} *_{consistency_level}")

        # extra tests for WRITE (compare with 5_100KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 5_100KB {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 5_100KB_{consistency_level}", f"*{self._old_prefix} 5_100KB_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 5_100KB_{consistency_level}", f"*{self._new_prefix} 5_100KB_{write} *_{consistency_level}")

        # extra tests for WRITE (compare with 6_300KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 6_300KB {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 6_300KB_{consistency_level}", f"*{self._old_prefix} 6_300KB_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 6_300KB_{consistency_level}", f"*{self._new_prefix} 6_300KB_{write} *_{consistency_level}")

        # extra tests for WRITE (compare with 7_1MB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 7_1MB {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 7_1MB_{consistency_level}", f"*{self._old_prefix} 7_1MB_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 7_1MB_{consistency_level}", f"*{self._new_prefix} 7_1MB_{write} *_{consistency_level}")

        # extra tests for WRITE (compare with 8_4MB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 8_4MB {write}_{consistency_level}",
                          f"{self._old_prefix} {write} 8_4MB_{consistency_level}", f"*{self._old_prefix} 8_4MB_{write} *_{consistency_level}",
                          f"{self._new_prefix} {write} 8_4MB_{consistency_level}", f"*{self._new_prefix} 8_4MB_{write} *_{consistency_level}")

        # READ
        # extra tests for READ (compare with 1_6B)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 1_6B {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 1_6B_{consistency_level}", f"*{self._old_prefix} 1_6B_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 1_6B_{consistency_level}", f"*{self._new_prefix} 1_6B_{read} *_{consistency_level}")

        # extra tests for READ (compare with 2_1KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 2_1KB {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 2_1KB_{consistency_level}", f"*{self._old_prefix} 2_1KB_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 2_1KB_{consistency_level}", f"*{self._new_prefix} 2_1KB_{read} *_{consistency_level}")

        # extra tests for READ (compare with 3_10KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 3_10KB {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 3_10KB_{consistency_level}", f"*{self._old_prefix} 3_10KB_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 3_10KB_{consistency_level}", f"*{self._new_prefix} 3_10KB_{read} *_{consistency_level}")

        # extra tests for READ (compare with 4_50KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 4_50KB {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 4_50KB_{consistency_level}", f"*{self._old_prefix} 4_50KB_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 4_50KB_{consistency_level}", f"*{self._new_prefix} 4_50KB_{read} *_{consistency_level}")

        # extra tests for READ (compare with 5_100KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 5_100KB {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 5_100KB_{consistency_level}", f"*{self._old_prefix} 5_100KB_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 5_100KB_{consistency_level}", f"*{self._new_prefix} 5_100KB_{read} *_{consistency_level}")

        # extra tests for READ (compare with 6_300KB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 6_300KB {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 6_300KB_{consistency_level}", f"*{self._old_prefix} 6_300KB_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 6_300KB_{consistency_level}", f"*{self._new_prefix} 6_300KB_{read} *_{consistency_level}")

        # extra tests for READ (compare with 7_1MB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 7_1MB {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 7_1MB_{consistency_level}", f"*{self._old_prefix} 7_1MB_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 7_1MB_{consistency_level}", f"*{self._new_prefix} 7_1MB_{read} *_{consistency_level}")

        # extra tests for READ (compare with 8_4MB)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} 8_4MB {read}_{consistency_level}",
                          f"{self._old_prefix} {read} 8_4MB_{consistency_level}", f"*{self._old_prefix} 8_4MB_{read} *_{consistency_level}",
                          f"{self._new_prefix} {read} 8_4MB_{consistency_level}", f"*{self._new_prefix} 8_4MB_{read} *_{consistency_level}")



    def add_cmp_different_versions(self, consistency_level="LOCAL_ONE", read="read", write="write"):
        self._items=[]
        # STCS - heavy write, LCS - read heavy
        # L - read heavy, T - write heavy

        # WRITE
        # extra tests for WRITE (compare with STCS)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {write}_{consistency_level}_STCS",
                          f"{self._old_prefix} {write}_{consistency_level}_STCS", f"*{self._old_prefix} {write}_{consistency_level}_STCS",
                          f"{self._new_prefix} {write}_{consistency_level}_STCS", f"*{self._new_prefix} {write}_{consistency_level}_STCS")

        # optional compare
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {write}_{consistency_level}_STCS-UCS2",
                          f"{self._old_prefix} {write}_{consistency_level}_STCS", f"*{self._old_prefix} {write}_{consistency_level}_STCS",
                          f"{self._new_prefix} {write}_{consistency_level}_UCS2", f"*{self._new_prefix} {write}_{consistency_level}_UCS2", True)

        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {write}_{consistency_level}_STCS-UCS4",
                          f"{self._old_prefix} {write}_{consistency_level}_STCS", f"*{self._old_prefix} {write}_{consistency_level}_STCS",
                        f"{self._new_prefix} {write}_{consistency_level}_UCS4", f"*{self._new_prefix} {write}_{consistency_level}_UCS4")

        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {write}_{consistency_level}_STCS-UCS8",
                          f"{self._old_prefix} {write}_{consistency_level}_STCS", f"*{self._old_prefix} {write}_{consistency_level}_STCS",
                        f"{self._new_prefix} {write}_{consistency_level}_UCS8", f"*{self._new_prefix} {write}_{consistency_level}_UCS8")

        self.add_file_set( f"{self._old_prefix} vs {self._new_prefix} {write}_{consistency_level}_STCS-UCS10",
                           f"{self._old_prefix} {write}_{consistency_level}_STCS", f"*{self._old_prefix} {write}_{consistency_level}_STCS",
                        f"{self._new_prefix} {write}_{consistency_level}_UCS10", f"*{self._new_prefix} {write}_{consistency_level}_UCS10")

        # READ
        # extra tests for READ (compare with LCS)
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {read}_{consistency_level}_LCS",
                          f"{self._old_prefix} {read}_{consistency_level}_LCS", f"*{self._old_prefix} {read}_{consistency_level}_LCS",
                        f"{self._new_prefix} {read}_{consistency_level}_LCS", f"*{self._new_prefix} {read}_{consistency_level}_LCS")

        # optional compare
        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {read}_{consistency_level}_LCS-UCS2",
                          f"{self._old_prefix} {read}_{consistency_level}_LCS", f"*{self._old_prefix} {read}_{consistency_level}_LCS",
                        f"{self._new_prefix} {read}_{consistency_level}_UCS2", f"*{self._new_prefix} {read}_{consistency_level}_UCS2", True)

        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {read}_{consistency_level}_LCS-UCS4",
                          f"{self._old_prefix} {read}_{consistency_level}_LCS", f"*{self._old_prefix} {read}_{consistency_level}_LCS",
                        f"{self._new_prefix} {read}_{consistency_level}_UCS4", f"*{self._new_prefix} {read}_{consistency_level}_UCS4")

        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {read}_{consistency_level}_LCS-UCS8",
                          f"{self._old_prefix} {read}_{consistency_level}_LCS", f"*{self._old_prefix} {read}_{consistency_level}_LCS",
                        f"{self._new_prefix} {read}_{consistency_level}_UCS8", f"*{self._new_prefix} {read}_{consistency_level}_UCS8")

        self.add_file_set(f"{self._old_prefix} vs {self._new_prefix} {read}_{consistency_level}_LCS-UCS10",
                          f"{self._old_prefix} {read}_{consistency_level}_LCS", f"*{self._old_prefix} {read}_{consistency_level}_LCS",
                        f"{self._new_prefix} {read}_{consistency_level}_UCS10", f"*{self._new_prefix} {read}_{consistency_level}_UCS10")


    def run_default(self, consistency_level="LOCAL_ONE"):
        self.add_cmp_different_versions(consistency_level)
        self.run()

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
        """Generate graph based on TXT(JSON) files from extract"""
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

                # create graph based on text output
                generator = GraphPerformance()
                generator.generate_from_text(output.text_buffer, output_dir, suppress_error=True)
                output.close()
            else:
                if not optional:
                    print(f"!!! Missing '{item_set[0]}' & '{item_set[2]}' !!!")

