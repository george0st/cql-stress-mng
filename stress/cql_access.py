from cassandra.auth import PlainTextAuthProvider
from cassandra.cluster import Cluster, Session
from cassandra import ProtocolVersion
from cassandra.policies import DCAwareRoundRobinPolicy, RoundRobinPolicy
from cassandra.policies import RetryPolicy
from colorama import Fore, Style
from time import perf_counter


class Setting:
    """Setting for CQLAccess"""

    TIMEOUT = 40
    TIMEOUT_CREATE_MODEL = 900

class CQLAccess:
    """The access via CQL"""

    def __init__(self, run_setup):
        self._run_setup = run_setup
        self._cluster = None

    @property
    def cluster(self):
        return self._cluster

    def open(self):
        """Create cluster for connection"""
        auth_provider = None

        # authentication provider
        if self._run_setup.get('USER', None):
            auth_provider = PlainTextAuthProvider(username = self._run_setup["USER"],
                                                 password = self._run_setup["PWD"])

        # load balancing policy
        if self._run_setup.get("LOCAL_DC", None):
            load_balancing_policy = DCAwareRoundRobinPolicy(local_dc = self._run_setup["LOCAL_DC"])
        else:
            load_balancing_policy = RoundRobinPolicy()

        if self._run_setup.get("SECURE_CONNECT_BUNDLE", None):
            # connection with 'secure_connect_bundle' to the cloud
            cloud_config = {
                "secure_connect_bundle": self._run_setup["SECURE_CONNECT_BUNDLE"],
                'use_default_tempdir': True
            }
            self._cluster = Cluster(cloud = cloud_config,
                                    auth_provider = auth_provider,
                                    load_balancing_policy = load_balancing_policy,
                                    default_retry_policy = RetryPolicy(),
                                    control_connection_timeout = Setting.TIMEOUT,
                                    connect_timeout = Setting.TIMEOUT,
                                    protocol_version = ProtocolVersion.V4)
        else:
            # connection with 'ip' and 'port'
            self._cluster = Cluster(contact_points = [itm.strip() for itm in self._run_setup['IP'].split(",")],
                                    port = self._run_setup.get('PORT', 9042),
                                    auth_provider = auth_provider,
                                    load_balancing_policy = load_balancing_policy,
                                    default_retry_policy = RetryPolicy(),
                                    control_connection_timeout = Setting.TIMEOUT,
                                    connect_timeout = Setting.TIMEOUT,
                                    protocol_version = ProtocolVersion.V4)
                                    # issue with 'CRC mismatch on header ...', not use protocol V5
                                    # protocol_version = ProtocolVersion.V5)

    def create_session(self, timeout = Setting.TIMEOUT) -> Session:
        """Create new session"""
        session = self._cluster.connect()
        session.default_timeout = timeout
        return session

    def remove_keyspace(self, keyspace: str):
        session = None

        try:
            session = self.create_session(Setting.TIMEOUT_CREATE_MODEL)
            session.execute(f"DROP KEYSPACE IF EXISTS {keyspace};")
        except Exception as ex:
            print(Fore.LIGHTRED_EX + f"    {type(ex).__name__}: {str(ex)}" + Style.RESET_ALL)
        finally:
            if session:
                session.shutdown()

    def create_model(self):
        """Create new NoSQL model (create keyspace and table)"""
        if not self._run_setup["model_rebuild"]:
            return

        session = None
        print(f"  Create new model [{self._run_setup['keyspace']}].[{self._run_setup['table']}]...")
        create_start = perf_counter()

        try:
            session = self.create_session(Setting.TIMEOUT_CREATE_MODEL)
            if self._run_setup["keyspace_rebuild"]:
                if self._run_setup['keyspace_replication_factor']:
                    # Drop key space
                    session.execute(f"DROP KEYSPACE IF EXISTS {self._run_setup['keyspace']};")

                    # Create key space
                    session.execute(f"CREATE KEYSPACE IF NOT EXISTS {self._run_setup['keyspace']} " +
                                    "WITH replication = {" +
                                    f"'class':'{self._run_setup['keyspace_replication_class']}', " +
                                    f"'replication_factor' : {self._run_setup['keyspace_replication_factor']}" +
                                    "};")

            # use LTW atomic command with IF
            session.execute(f"DROP TABLE IF EXISTS {self._run_setup['keyspace']}.{self._run_setup['table']};")

            # prepare insert statement for batch
            columns = ""
            for i in range(0, self._run_setup.bulk_col):
                columns += f"fn{i} int,"

            # complex primary key (partition key 'fn0' and cluster key 'fn1')
            create_tbl = (f"CREATE TABLE IF NOT EXISTS {self._run_setup['keyspace']}.{self._run_setup['table']} "
                          f"({columns[:-1]}, PRIMARY KEY (fn0, fn1))")

            # add compaction setting
            if self._run_setup['compaction']:
                compaction_params = f", {self._run_setup['compaction_params']}" if self._run_setup['compaction_params'] else ""
                compaction = " WITH compaction = {" \
                f"'class': '{self._run_setup['compaction']}'{compaction_params}" \
                "};"
                create_tbl += compaction

            # create table
            session.execute(create_tbl)
            print(f"    Model created (duration {round(perf_counter()-create_start,1)} seconds)!")
        except Exception as ex:
            print(Fore.LIGHTRED_EX + f"    {type(ex).__name__}: {str(ex)}" + Style.RESET_ALL)
        finally:
            if session:
                session.shutdown()

    def close(self):
        """Close cluster connection and all sessions"""
        if self._cluster:
            self._cluster.shutdown()
            self._cluster = None
