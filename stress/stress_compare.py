from polars import read_csv
import os
import glob


class StressCompare:
    """ Generate compare stress tests (typically between cassandra v4/old and v5/new).
        The outputs are in json, txt format
    """

    COLUMNS_LOW = ["Performance", "Avrg"]
    COLUMNS_MEDIUM = ["Performance", "Avrg", "Latency 95th", "Latency 99th"]
    COLUMNS_HIGH = ["Performance", "Avrg", "Latency 95th", "Latency 99th", "Latency 999th", "Max"]

    #EXECUTORS_LOW = [4, 8, 16, 32, 64, 128]
    #EXECUTORS_HIGH = [4, 8, 16, 32, 64, 128, 256, 512]

    def __init__(self, path, columns: list[str]=COLUMNS_LOW):
        self._path=path
        self._items=[]
        #self._executors=executors
        self._columns=columns

    def add_file_set(self, old_label, old_file, new_label, new_file):
        self._items.append((old_label, old_file, new_label, new_file))

    def _run_item(self, old_label, old_file_name, new_label, new_file_name):
        new_file = None
        old_file = None

        for file in glob.glob(os.path.join(self._path, new_file_name)):
            new_file = file
        for file in glob.glob(os.path.join(self._path, old_file_name)):
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

    def run(self):

        executors=""
        output=""
        final_output = ""
        final_executors=""

        for item_set in self._items:
            output, executors =self._run_item(item_set[0], item_set[1], item_set[2], item_set[3])

            if output:
                if len(final_executors)==0:
                    final_executors = executors

                final_output += output+"\r\n"

                if executors!=final_executors:
                    print("!!! DIFFERENT EXECUTORS !!!!")

        # create header
        header=f"Test case\t"
        for i in range(len(self._columns)):
            header += f"{executors}\t"
        header = header [:-1]

        print(header)
        print(final_output)

    def run_default(self, consistency_level="LOCAL_ONE"):

        self._items=[]
        # STCS - heavy write, LCS - read heavy
        # L - read heavy, T - write heavy

        # extra tests for WRITE (compare with STCS)
        self.add_file_set(f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS.csv",
                        f"v5 write_{consistency_level}_STCS", f"*v5 write_{consistency_level}_STCS.csv")

        self.add_file_set(f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS.csv",
                        f"v5 write_{consistency_level}_UCS2", f"*v5 write_{consistency_level}_UCS2.csv")

        self.add_file_set(f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS.csv",
                        f"v5 write_{consistency_level}_UCS4", f"*v5 write_{consistency_level}_UCS4.csv")

        self.add_file_set(f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS.csv",
                        f"v5 write_{consistency_level}_UCS8", f"*v5 write_{consistency_level}_UCS8.csv")

        self.add_file_set(f"v4 write_{consistency_level}_STCS", f"*v4 write_{consistency_level}_STCS.csv",
                        f"v5 write_{consistency_level}_UCS10", f"*v5 write_{consistency_level}_UCS10.csv")

        # extra tests for READ (compare with LCS)
        self.add_file_set(f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS.csv",
                        f"v5 read_{consistency_level}_LCS", f"*v5 read_{consistency_level}_LCS.csv")

        self.add_file_set(f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS.csv",
                        f"v5 read_{consistency_level}_UCS2", f"*v5 read_{consistency_level}_UCS2.csv")

        self.add_file_set(f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS.csv",
                        f"v5 read_{consistency_level}_UCS4", f"*v5 read_{consistency_level}_UCS4.csv")

        self.add_file_set(f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS.csv",
                        f"v5 read_{consistency_level}_UCS8", f"*v5 read_{consistency_level}_UCS8.csv")

        self.add_file_set(f"v4 read_{consistency_level}_LCS", f"*v4 read_{consistency_level}_LCS.csv",
                        f"v5 read_{consistency_level}_UCS10", f"*v5 read_{consistency_level}_UCS10.csv")

        self.run()
