import cql_helper as helper
from cql_output import CQLOutput
from glob import glob
import datetime, time
from os import path, linesep
import re


class StressSummary:
    """ Generate summary outputs from particular tests (a lot of detail outputs).
        The outputs are in json, txt, csv formats
    """

    def __init__(self, output_dir, file_extension = "*.txt"):
        self._output_dir = output_dir
        self._file_extension = file_extension
        self._performance = {}

    def _parse_content(self, file_name, content) -> (str,dict):

        output={}

        #file_name = "2024-11-25_22-02-41 v5 read_LOCAL_ONE_UCS10_32xTHR.txt"
        key = self._get_pattern_item("(.*)_[^_]*xTHR.txt$", file_name)

        # basic info
        output["operation_type"]=self._get_pattern_item(f"Type:(.*)$", content)
        output["duration"] = self._get_pattern_item(f"Duration:(.*)$", content)
        output["consistency_level"] = self._get_pattern_item(f"Consistency Level:(.*)$", content)
        output["executors"] = int(self._get_pattern_item("Thread Count:(.*)$", content))

        # optional (can be zero for read operation)
        output["compaction"] = self._get_pattern_item("_([^_]*)_[^_]*xTHR.txt$", file_name)

        # performance details
        output["performance"] = self._get_pattern_item("Op rate.+:(.+) op\/s  \[.+\]", content).replace(",","")
        output["avrg"] = self._get_pattern_item("Latency mean.+:(.+)\[.+\]", content).replace(",","")
        output["median"] = self._get_pattern_item("Latency median.+:(.+)\[.+\]", content).replace(",","")
        output["latency_95th"] = self._get_pattern_item("Latency 95th percentile.+:(.+)\[.+\]", content).replace(",","")
        output["latency_99th"] = self._get_pattern_item("Latency 99th percentile.+:(.+)\[.+\]", content).replace(",","")
        output["latency_999th"] = self._get_pattern_item("Latency 99.9th percentile.+:(.+)\[.+\]", content).replace(",","")
        output["latency_max"] = self._get_pattern_item("Latency max.+:(.+)\[.+\]", content).replace(",", "")
        return key, output

    def _get_pattern_item(self, pattern, content):
        match=re.findall(pattern, content, re.MULTILINE)
        return match[0].strip() if match else None

    def _json_format(self, performance: dict):
        pass

    def _sort_executors(self, e):
        return e['executors']

    def parse(self):

        self._performance = {}
        items=[]
        # iteration cross all files
        for file_name in glob(path.join(self._output_dir, self._file_extension)):
            print("Processing:",file_name)

            key, one_output = self._parse_content(path.basename(file_name), helper.read_file_all(file_name))
            # file_name = "2024-11-25_22-02-41 v5 read_LOCAL_ONE_UCS10_32xTHR.txt"
            # key = 2024-11-25_22-02-41 v5 read_LOCAL_ONE_UCS10

            # collect items
            if self._performance.get(key, None):
                self._performance[key].append(one_output)
            else:
                #items=[one_output]
                #items.append(one_output)
                self._performance[key]=[one_output]

        # order by amount of executors
        for key in self._performance.keys():
            self._performance[key].sort(key=self._sort_executors)


    def save_json(self):
        pass

    def save_csv(self):

        for key in self._performance.keys():
            output = None
            try:
                output = CQLOutput(self._output_dir, key+".csv")
                output.open()
                output.print("Executors,Group,Performance,Avrg,Latency 95th,Latency 99th,Latency 999th,Max")

                for itm in self._performance[key]:
                    output.print(str.format(f"{itm['executors']},"
                                            f"'norm',"
                                            f"{itm['performance']},"
                                            f"{itm['avrg']},"
                                            f"{itm['latency_95th']},"
                                            f"{itm['latency_99th']},"
                                            f"{itm['latency_999th']},"
                                            f"{itm['latency_max']}"))
            finally:
                if output:
                    output.close()


