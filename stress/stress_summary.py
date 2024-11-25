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


        #"Op rate                   :    5,823 op/s  [WRITE: 5,823 op/s]"
        #"Latency mean              :    0.7 ms [WRITE: 0.7 ms]"
        #"Latency median            :    0.6 ms [WRITE: 0.6 ms]"
        #"Latency 95th percentile   :    0.9 ms [WRITE: 0.9 ms]"
        #"Latency 99th percentile   :    1.3 ms [WRITE: 1.3 ms]"
        #"Latency 99.9th percentile :    3.0 ms [WRITE: 3.0 ms]"
        #"Latency max               :  210.4 ms [WRITE: 210.4 ms]"

        duration = self._get_pattern_item(f"Duration:(.*)$", content)
        executors = self._get_pattern_item("Thread Count:(.*)$", content)
        compaction = self._get_pattern_item("Table Compaction Strategy:(.*)$", content)
        compaction_option = self._get_pattern_item("Table Compaction Strategy Options:(.*)$", content)
        performance = self._get_pattern_item("Op rate[.]*:(.*)$", content)

        match=re.findall(f"Duration:(.*)$", content, re.MULTILINE)


        if match:
            for itm in match:
                print(itm)
        #pattern=r"%([^%]+)%"

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


