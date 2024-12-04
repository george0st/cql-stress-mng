from json import dumps
from file_marker import FileMarker
from cql_helper import get_readable_duration, to_seconds
from cql_output import CQLOutput


class GraphOutput:

    def __init__(self, output:CQLOutput):
        self._output=output

    def print_header(self, start_tasks, label, duration):
        self._output.print(f"############### {start_tasks.isoformat(' ')} ###############")
        out = {}
        out[FileMarker.PRF_TYPE] = FileMarker.PRF_HDR_TYPE
        out[FileMarker.PRF_HDR_LABEL] = label if label is not None else "Noname"
        out[FileMarker.PRF_HDR_BULK] = [1, 1]
        out[FileMarker.PRF_HDR_DURATION] = duration
        out[FileMarker.PRF_HDR_RESPONSE_UNIT] = "msec"
        out[FileMarker.PRF_HDR_NOW] = start_tasks.isoformat(' ')

        self._output.print(dumps(out))

    def print_footer(self, final_state, duration_seconds):
        self._output.print(f"############### State: {'OK' if final_state else 'Error'}, "
                    f"Duration: {get_readable_duration(duration_seconds)} ({duration_seconds} "
                    f"seconds) ###############")

    def print_details(self, performances):
        for performance in performances:
            out = {}
            out[FileMarker.PRF_TYPE] = FileMarker.PRF_CORE_TYPE
            out[FileMarker.PRF_CORE_REAL_EXECUTOR] = int(performance[FileMarker.PRF_CORE_REAL_EXECUTOR])
            out[FileMarker.PRF_CORE_GROUP] = performance[FileMarker.PRF_CORE_GROUP]
            out[FileMarker.PRF_CORE_TOTAL_CALL_PER_SEC] = float(performance[FileMarker.PRF_CORE_TOTAL_CALL_PER_SEC])
            out[FileMarker.PRF_CORE_AVRG_TIME] = float(performance[FileMarker.PRF_CORE_AVRG_TIME])
            self._output.print(f"  {dumps(out)}")

    def print_detail(self, performance, group=''):
        """
        Print detail from performance
        """

        out = {}
        out[FileMarker.PRF_TYPE] =  FileMarker.PRF_CORE_TYPE
        out[FileMarker.PRF_CORE_REAL_EXECUTOR] = int(performance['executors'])
        out[FileMarker.PRF_CORE_GROUP] = group
        out[FileMarker.PRF_CORE_TOTAL_CALL_PER_SEC] = float(performance['performance'])    # ok
        out[FileMarker.PRF_CORE_AVRG_TIME] = float(performance['avrg'])                    # ok

        # final dump
        self._output.print(f"  {dumps(out)}")