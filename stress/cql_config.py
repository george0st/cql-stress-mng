from os import path
from dotenv import dotenv_values
import stress.cql_helper


class ConfigSetting:

    # The key parameters
    ADAPTER = "Cassandra"
    EXECUTOR_DURATION = "5"
    BULK_LIST = "[[200, 10]]"
    BULK_LIST_W = "[[200, 10]]"
    BULK_LIST_R = "[[1, 10]]"
    BULK_LIST_RW = "[[5, 10]]"
    EXECUTORS = "[[1, 1, '1x threads'], [2, 1, '1x threads']]"

    # The other tuning
    EXECUTOR_START_DELAY = "0"
    DETAIL_OUTPUT = "True"
    GENERATE_GRAPH = "Perf"
    CLUSTER_DIAGNOSE = "Short"
    MULTIPLE_ENV_DELAY = "0"

    TABLE = "t01"
    KEYSPACE = "prftest"
    TEST_TYPE = "W"
    REPLICATION_CLASS = "NetworkTopologyStrategy"
    REPLICATION_FACTOR = "3"
    CONSISTENCY_LEVEL = "LOCAL_QUORUM"
    USERNAME = "cassandra"
    PASSWORD = "cassandra"
    PORT = "9042"
    IP = "localhost"
    LABEL = "local"
    NUMERIC_SCOPE = "99999"

    MODEL_REBUILD = "True"
    KEYSPACE_REBUILD = "True"

class CQLConfig:
    """The configuration of CQL, based on ENV files."""

    def __init__(self, perf_dir = "."):
        """Processing/Parsing of dictionary parameters from config/ENV files"""
        self._perf_dir = perf_dir
        self._config = {}

    def get_global_params(self, env_file) -> dict:

        global_param = {}

        #env_file_path = path.join(self._perf_dir, "config", env_file)
        if not path.exists(env_file):
            raise Exception(f"Invalid path to ENV file '{env_file}'.")

        self._config = dotenv_values(env_file)

        for key in self._config.keys():
            global_param[key]=self._config[key]

        password_path =self._config["PWD"]
        global_param['PWD'] = stress.cql_helper.read_file_line(path.join(self._perf_dir, password_path)) if password_path else ConfigSetting.PASSWORD

        return global_param



