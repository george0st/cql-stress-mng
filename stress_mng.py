import click
import subprocess

import re

# # Otevřete log soubor
# with open('stress_output.log', 'r') as file:
#     log_data = file.read()
#
# # Regulární výraz pro zachycení relevantních metrik
# pattern = re.compile(r'total ops\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'partition rate\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'row rate\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'latency mean\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency median\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency 95th percentile\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency 99th percentile\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency 99.9th percentile\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'latency max\s+:\s+(\d+\.\d+)\s+\[WRITE:(\d+\.\d+)\]\n'
#                      r'Total partitions\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n'
#                      r'Total errors\s+:\s+(\d+)\s+\[WRITE:(\d+)\]\n')
#
# # Vyhledání metrik v log souboru
# match = pattern.search(log_data)
# if match:
#     results = match.groups()
#     print("Výsledky testu:")
#     print(f"Celkový počet operací: {results[0]}")
#     print(f"Počet operací za sekundu: {results[2]}")
#     print(f"Průměrná latence: {results[6]} ms")
#     print(f"95. percentil latence: {results[10]} ms")
#     print(f"Maximální latence: {results[16]} ms")
#     print(f"Celkový počet chyb: {results[20]}")
# else:
#     print("Nepodařilo se najít výsledky v log souboru.")

if __name__ == '__main__':
    process = subprocess.run('notepad', shell=True)
    process.wait()