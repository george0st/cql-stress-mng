import cql_helper as helper
from cql_output import CQLOutput
from glob import glob
import datetime, time
from os import path, linesep
import re
from json import dumps
from file_marker import FileMarker
from cql_helper import get_readable_duration


class StressSummary:
    """ Generate summary outputs from particular tests (a lot of detail outputs).
        The outputs are in json, txt, csv formats
    """

    def __init__(self, output_dir, file_extension = "*.txt"):
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

        filter=path.join(self._output_dir, self._file_extension)
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
                output = CQLOutput(self._output_dir, key+".csv", False)
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

    def save_json(self):
        """Save summary output to TXT (JSON) file"""
    ################ 2023-10-15 15:09:20.638004 ###############
    # {"type":"headr","label":"cassandra-163551-W1-low","bulk":[200,10],"duration":60,"percentile":0.95,"cpu":8,"mem":"15.1 GB","mem_free":"12.7 GB","host":"os01-jic76ebbnzgz.cz.infra/10.129.54.56","now":"2024-10-11 14:36:07.799293"}
    #   {"type": "core",
        #   "real_executors": 2,
        #   "group": "Austria perf",
        #   "total_call_per_sec": 12.882812275236457,
        #   "avrg_time": 1.5524560610453289,
        #   "std_deviation": 0.00418030586255807}
    #   {"type": "core", "plan_executors": 4, "plan_executors_detail": [2, 2], "real_executors": 4, "group": "Austria perf", "total_calls": 12, "total_call_per_sec": 25.8796241474028, "avrg_time": 1.5456175009409585, "std_deviation": 0.007724887210259932, "endexec": "2023-10-15 15:09:39.049110"}
    #   {"type": "core", "plan_executors": 4, "plan_executors_detail": [1, 4], "real_executors": 4, "group": "Germany perf", "total_calls": 12, "total_call_per_sec": 25.74525310264132, "avrg_time": 1.5536844730377197, "std_deviation": 0.004366116211321063, "endexec": "2023-10-15 15:09:58.374092"}
    #   {"type": "core", "plan_executors": 8, "plan_executors_detail": [2, 4], "real_executors": 8, "group": "Germany perf", "total_calls": 24, "total_call_per_sec": 51.35900922500767, "avrg_time": 1.5576624472935996, "std_deviation": 0.004880468682655263, "endexec": "2023-10-15 15:10:07.503113"}
    #   {"type": "core", "plan_executors": 16, "plan_executors_detail": [4, 4], "real_executors": 16, "group": "Germany perf", "total_calls": 48, "total_call_per_sec": 103.95169615994652, "avrg_time": 1.5391764243443808, "std_deviation": 0.009352894892740266, "endexec": "2023-10-15 15:10:17.224968"}
    # ############### State: OK,  Duration: 56.6 seconds ###############
        for key in self._performance.keys():
            output = None
            try:
                output = CQLOutput(self._output_dir, key+".json.txt", False)
                output.open()

                self._print_header(output, datetime.datetime.now(),"", 60 )
                for itm in self._performance[key]:
                    self._print_detail(output,itm)
                self._print_footer(output, True)
            finally:
                if output:
                    output.close()

    def _print_header(self, output:CQLOutput, start_tasks, label, duration):
        output.print(f"############### {start_tasks.isoformat(' ')} ###############")
        out = {}
        out[FileMarker.PRF_TYPE] = FileMarker.PRF_HDR_TYPE
        out[FileMarker.PRF_HDR_LABEL] = label if label is not None else "Noname"
        out[FileMarker.PRF_HDR_BULK] = [1, 1]
        out[FileMarker.PRF_HDR_DURATION] = duration
        out[FileMarker.PRF_HDR_NOW] =  start_tasks.isoformat(' ')

        output.print(dumps(out)) #, separators=OutputSetup().json_separator))

    def _print_footer(self, output:CQLOutput, final_state, duration_seconds):
        output.print(f"############### State: {'OK' if final_state else 'Error'}, "
                    f"Duration: {get_readable_duration(duration_seconds)} ({duration_seconds} "
                    f"seconds) ###############")

    def _print_detail(self, output:CQLOutput, performance, group=''):
        """
        Print detail from performance
        """

        out = {}
        out[FileMarker.PRF_TYPE] =  FileMarker.PRF_CORE_TYPE
        out[FileMarker.PRF_CORE_REAL_EXECUTOR] = performance['executors']
        out[FileMarker.PRF_CORE_GROUP] = group
        out[FileMarker.PRF_CORE_TOTAL_CALL_PER_SEC] = performance['performance']    # ok
        out[FileMarker.PRF_CORE_AVRG_TIME] = performance['avrg']                    # ok

        # final dump
        output.print(f"  {dumps(out)}")