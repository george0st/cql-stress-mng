from polars import read_csv
import os
import glob


class StressCompare:
    """ Generate compare stress tests (typically between cassandra v4/old and v5/new).
        The outputs are in json, txt format
    """

    def __init__(self, path):
        self._path=path
        self._items=[]

    def add_file_set(self, old_label, old_file, new_label, new_file):
        self._items.append((old_label, old_file, new_label, new_file))

    def _run_item(self, old_label, old_file_name, new_label, new_file_name):
        new_file = ""
        old_file = ""

        for file in glob.glob(os.path.join(self._path, new_file_name)):
            new_file = file
        for file in glob.glob(os.path.join(self._path, old_file_name)):
            old_file = file

        new = read_csv(new_file)
        old = read_csv(old_file)

        new_row=""
        new_executors=""
        old_executors=""

        # V5
        new_row += f"{new_label}\t"
        for perf in new.items():
            if perf[0]=="Executors":
                for item in perf[1]:
                    new_executors+=f"{item}\t"

            if perf[0]=="Performance 99ph":
                for item in perf[1]:
                    new_row+=f"{item}\t"

            if perf[0] == "Avrg 99ph":
                for item in perf[1]:
                    new_row += f"{item}\t"
        new_executors = new_executors[:-1]
        new_row = new_row[:-1]
        new_row += "\n"

        # V4
        new_row += f"{old_label}\t"
        for perf in old.items():
            if perf[0]=="Executors":
                for item in perf[1]:
                    old_executors+=f"{item}\t"

            if perf[0]=="Performance 99ph":
                for item in perf[1]:
                    new_row+=f"{item}\t"

            if perf[0] == "Avrg 99ph":
                for item in perf[1]:
                    new_row += f"{item}\t"

        old_executors = old_executors[:-1]
        new_row = new_row[:-1]
        new_row += "\n"

        if old_executors != new_executors:
            print("!!! DIFFERENT EXECUTORS !!!!")
        return new_row.replace(".",","), new_executors

    def run(self):

        executors=""
        output=""
        final_output = ""
        final_executors=""

        for item_set in self._items:
            output, executors =self._run_item(item_set[0], item_set[1], item_set[2], item_set[3])

            if len(final_executors)==0:
                final_executors = executors

            final_output += output+"\r\n"

            if executors!=final_executors:
                print("!!! DIFFERENT EXECUTORS !!!!")

        print(f"Test case\t{executors}\t{executors}")
        print(final_output)



#     aa = Merge("c:/Python/.Compare V4 vs V5/LONG_DATA/NEW ALL/output/graph-perf/1 min/2024-11-21/")
# #    aa = Merge("c:/Python/.Compare V4 vs V5/LONG_DATA/NEW LOCAL QUORUM/output/graph-perf/1 min/2024-11-21/")
# #    aa = Merge("c:/Python/.Compare V4 vs V5/LONG_DATA/NEW LOCAL ONE/output/graph-perf/1 min/2024-11-20/")
#
#     aa.add_file_set("TC01-Write-STCS-v4", "*cassandrav4-*-W-TC01-*.csv",
#                     "TC01-Write-STCS-v5", "*cassandrav5-*-W-TC01-*.csv")
