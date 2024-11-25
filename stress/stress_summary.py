import cql_helper as helper
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

    def _parse_content(self, file_name, content) -> dict:

        output={}

        # basic info
        output["operation_type"]=self._get_pattern_item(f"Type:(.*)$", content)
        output["duration"] = self._get_pattern_item(f"Duration:(.*)$", content)
        output["consistency_level"] = self._get_pattern_item(f"Consistency Level:(.*)$", content)
        output["executors"] = self._get_pattern_item("Thread Count:(.*)$", content)

        # optional (can be zero for read operation)
        output["compaction"] = self._get_pattern_item("Table Compaction Strategy:(.*)$", content)
        output["compaction_option"] = self._get_pattern_item("Table Compaction Strategy Options:(.*)$", content)

        # performance details
        output["performance"] = self._get_pattern_item("Op rate.+:(.+) op\/s  \[.+\]", content).replace(",","")
        output["avrg"] = self._get_pattern_item("Latency mean.+:(.+)\[.+\]", content).replace(",","")
        output["median"] = self._get_pattern_item("Latency median.+:(.+)\[.+\]", content).replace(",","")
        output["latency_95th"] = self._get_pattern_item("Latency 95th percentile.+:(.+)\[.+\]", content).replace(",","")
        output["latency_99th"] = self._get_pattern_item("Latency 99th percentile.+:(.+)\[.+\]", content).replace(",","")
        output["latency_999th"] = self._get_pattern_item("Latency 99.9th percentile.+:(.+)\[.+\]", content).replace(",","")
        output["latency_max"] = self._get_pattern_item("Latency max.+:(.+)\[.+\]", content).replace(",", "")
        return output

    def _get_pattern_item(self, pattern, content):
        match=re.findall(pattern, content, re.MULTILINE)
        return match[0].strip() if match else None

    def _json_format(self, performance: dict):
        pass

    def parse(self):

        performance = {}
        # iteration cross all files
        for file_name in glob(path.join(self._output_dir, self._file_extension)):
            print("Processing:",file_name)
            performance = self._parse_content(file_name, helper.read_file_all(file_name))

            print(performance)

            # output JSON for qgate-graph


