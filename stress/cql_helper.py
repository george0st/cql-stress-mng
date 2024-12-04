from time import perf_counter, perf_counter_ns, sleep
import re
from json import loads


def str2bool(value) -> bool:
    """Conversion of text value ("True", "1", "Yes", "On") to Bool value"""
    return value.lower() in ['true', '1', 'yes', 'on']

def bool2str(value, value_true, value_false, value_none) -> str:
    """Conversion value as bool (or None) to text value"""
    if value is not None:
        return value_true if value else value_false
    return value_none

def read_file_line(file) -> str:
    with open(file) as f:
        return f.readline()

def read_file_lines(file) -> list[str]:
    with open(file) as f:
        return f.readlines()

def read_file_all(file) -> str:
    with open(file) as f:
        content=""
        for itm in f.readlines():
            content += f"{itm.strip()}\n"
        return content[:-1]

def to_seconds(duration: str):
    """Convert text description of duration to the seconds. Expected inputs
        '5 minutes', '15 hours"', etc.
    """
    number, unit = duration.lower().split()
    number = int(number.strip())
    unit = unit.strip()

    if unit == "seconds":
        return number
    if unit == "minutes":
        return number * 60
    elif unit == "hours":
        return number * 3600
    elif unit == "days":
        return number * 86400
    else:
        return -1

def get_readable_duration(duration_seconds):
    """Return duration in human-readable form"""

    if duration_seconds < 0:
        return "n/a"

    str_duration = []
    days = int(duration_seconds // 86400)
    if days > 0:
        str_duration.append(f"{days} day")
    hours = int(duration_seconds // 3600 % 24)
    if hours > 0:
        str_duration.append(f"{hours} hour")
    minutes = int(duration_seconds // 60 % 60)
    if minutes > 0:
        str_duration.append(f"{minutes} min")
    seconds = int(duration_seconds % 60)
    if seconds > 0:
        str_duration.append(f"{seconds} sec")
    return ' '.join(str_duration)

def load_json(line):
    try:
        return loads(line.strip())
    except Exception as ex:
        pass
