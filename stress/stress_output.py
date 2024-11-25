import cql_helper as helper
from glob import glob
import datetime, time
from os import path
import re


class StressOutput:
    """ Generate summary outputs from particular tests (a lot of detail outputs).
        The outputs are in json, txt, csv formats
    """

    def __init__(self, output_dir, file_extension = "*.txt"):
        self._output_dir = output_dir
        self._file_extension = file_extension

    def _parse_content(self, content) -> dict:
        pass

    def _json_format(self, performance: dict):
        pass

    def parse(self):

        performance = {}
        # iteration cross all files
        for file in glob(path.join(self._output_dir, self._file_extension)):
            print("Processing:",file)
            performance = self._parse_content(helper.read_file_whole(file))

            print(performance)

            # output JSON for qgate-graph


