#import os.path
import os
from os import path, makedirs


class CQLOutput:

    def __init__(self, perf_dir, output_file = None, mode = "wt"):
        self._perf_dir = perf_dir
        self._output_file = output_file
        self._mode=mode
        self._file = None

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
            self._file.write(f"{out}{os.linesep}")
            #self._file.writelines(out)
        print(out)

    def print_cmd(self, cmd, global_counter, run_value_index, params:dict):

        operation = params['OPERATION']
        thread = params['THREAD']
        if operation.lower()!='remove':
            self.print(f"echo 'START {params['OPERATION']}, {thread}x thread: {global_counter}/{run_value_index}...'")
        else:
            self.print(f"echo 'START {params['OPERATION']}: {global_counter}/{run_value_index}...'")
        self.print(cmd)
        #self.print(f"echo 'END  : {global_counter}/{run_value_index}'")

    def print_header(self):
        pass

    def print_footer(self):
        pass

    def print_detail(self):
        pass