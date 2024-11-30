from os import path, makedirs, linesep
from datetime import datetime
import platform


class CQLOutput:

    def __init__(self, perf_dir, output_file = None, output_screen = True, mode = "wt"):
        self._perf_dir = perf_dir
        self._output_file = output_file
        self._output_screen = output_screen
        self._mode=mode
        self._file = None
        self._newLine="\n" if platform.system().lower()=="windows" else linesep

    def open(self):
        if self._output_file is not None:
            if self._perf_dir:
                dirname = path.dirname(self._output_file)
                full_dir=path.join(self._perf_dir, dirname) if dirname else self._perf_dir
                if not path.exists(full_dir):
                    makedirs(full_dir, mode=0o777)
            self._file = open(path.join(self._perf_dir,self._output_file), self._mode, encoding="utf-8")

    def close(self):
        if self._file is not None:
            self._file.close()
            self._file = None

    def print(self, out: str = ""):

        # print to the file 'out'
        if self._file is not None:
            self._file.write(f"{out}{self._newLine}")

        if self._output_screen:
            print(out)

    def print_cmd(self, cmd, global_counter, run_value_index, params:dict):

        operation = params['OPERATION']
        thread = params['THREAD']
        if operation.lower()!='remove':
            self.print(f"echo 'START {params['OPERATION']}, {thread}x thread: {global_counter}/{run_value_index}...'")
        else:
            #self.print(f"echo 'START {params['OPERATION']}: {global_counter}/{run_value_index}...'")
            self.print(f"echo 'START {params['OPERATION']}: ...'")
        self.print(cmd)

    def print_header(self):
        self.print("#!/bin/sh")
        self.print("# GENERATED: " + datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        self.print("curr_date=$(date +%Y-%m-%d_%H-%M-%S)")
        self.print("mkdir -p ./stress-output/$curr_date/")

    def print_footer(self):
        pass
