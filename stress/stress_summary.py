import cql_helper as helper
from cql_output import CQLOutput
from glob import glob
import datetime, time
from os import path, linesep
import re
from json import dumps
from cql_helper import get_readable_duration, to_seconds
from graph_output import GraphOutput

class StressSummary:
    """ Generate summary outputs from particular tests (a lot of detail outputs).
        The outputs are in json, txt, csv formats
    """

    def __init__(self, input_dir, output_dir, file_extension = "*.txt"):
        self._input_dir = input_dir
        self._output_dir = output_dir
        self._file_extension = file_extension
        self._performance = {}

    def _parse_results(self, file_name, content):
        results=[]
        output={}

        key = self._get_pattern_item("(.*)_[^_]*xTHR.txt$", file_name)

        # basic info
        output["operation_type"] = self._get_pattern_item(f"Type:(.*)$", content)
        output["duration"] = self._get_pattern_item(f"Duration:(.*)$", content)
        output["consistency_level"] = self._get_pattern_item(f"Consistency Level:(.*)$", content)

        columns=self._get_pattern_items(f"id, type([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),(.*)$", content)
        items=self._get_pattern_items(f"(.*)threadCount, total,([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*)", content)

        if len(items)>0:
            for itm in items:
                output = {}
                # basic info
                output["operation_type"] = self._get_pattern_item(f"Type:(.*)$", content)
                output["duration"] = self._get_pattern_item(f"Duration:(.*)$", content)
                output["consistency_level"] = self._get_pattern_item(f"Consistency Level:(.*)$", content)
                output["executors"] = int(itm[0].strip())

                # performance details
                output["performance"] = itm[2].strip()
                output["avrg"] = itm[5].strip()
                output["median"] = itm[6].strip()
                output["latency_95th"] = itm[7].strip()
                output["latency_99th"] = itm[8].strip()
                output["latency_999th"] = itm[9].strip()
                output["latency_max"] = itm[10].strip()

                if self._performance.get(key, None):
                    self._performance[key].append(output)
                else:
                    self._performance[key] = [output]

    def _parse_result(self, file_name, content):
        output={}

        key = self._get_pattern_item("(.*)_[^_]*xTHR.txt$", file_name)

        # basic info
        output["operation_type"] = self._get_pattern_item(f"Type:(.*)$", content)
        output["duration"] = self._get_pattern_item(f"Duration:(.*)$", content)
        output["consistency_level"] = self._get_pattern_item(f"Consistency Level:(.*)$", content)
        executors=self._get_pattern_item("Thread Count:(.*)$", content)
        output["executors"] = int(executors) if executors else 0

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

        if self._performance.get(key, None):
            self._performance[key].append(output)
        else:
            self._performance[key] = [output]

    def _multi_result(self, content) -> bool:
        summary_items=self._get_pattern_items(f"(.*)threadCount, total,([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*),([^,]*)", content)
        return len(summary_items)>0 if summary_items else False

    def _get_pattern_item(self, pattern, content):
        match=re.findall(pattern, content, re.MULTILINE)
        if match:
            return match[0].strip() if type(match[0]) is str else match
        else:
            return None

    def _get_pattern_items(self, pattern, content):
        match=re.findall(pattern, content, re.MULTILINE)
        return match if match else None

    def _sort_executors(self, e):
        return e['executors']

    def parse(self):
        """Parse input"""
        self._performance = {}
        items=[]
        # iteration cross all files

        filter=path.join(self._input_dir, self._file_extension)
        for file_name in glob(filter):
            print("Processing:",file_name)

            content=helper.read_file_all(file_name)
            if self._multi_result(content):
                self._parse_results(path.basename(file_name), content)
            else:
                self._parse_result(path.basename(file_name), content)

        # order by amount of executors
        for key in self._performance.keys():
            self._performance[key].sort(key=self._sort_executors)

    def save_csv(self):
        """Save summary output to CSV file"""
        for key in self._performance.keys():
            output = None
            try:
                output = CQLOutput(self._output_dir, key + ".csv", False)
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

    def _to_datetime(self, label) -> datetime:
        keys = label.split()
        parts = keys[0].split('_')
        return datetime.datetime.fromisoformat(str.format(f"{parts[0]} {parts[1].replace('-',':')}"))

    def save_json(self):
        """Save summary output to TXT (JSON) file"""
        for key in self._performance.keys():
            output = None
            try:
                output = CQLOutput(self._output_dir, key + ".txt", False)
                graph = GraphOutput(output)
                output.open()

                if len(self._performance[key])>0:
                    duration = to_seconds(self._performance[key][0]['duration'])
                    keys = key.split()
                    group = keys[1]
                    date=self._to_datetime(keys[0])

                graph.print_header(date, str.format(f"{keys[1]} {keys[2]}"), duration)
                for itm in self._performance[key]:
                    graph.print_detail(itm, group) #f"{keys[1]} {keys[2]}")
                graph.print_footer(True,duration)
            finally:
                if output:
                    output.close()
