# Run from terminal
###########################

# Run without terminal
###########################

python3.11 stress/stress_mng.py run -e _cass_v4_*.env -l ../_cass_v4.sh -d stress
python3.11 stress/stress_mng.py run -e _cass_v5_*.env -l ../_cass_v5.sh -d stress
python3.11 stress/stress_mng.py run -e _cass_*.env -l ../_cass_all.sh -d stress

nohup ./_cass_v4.sh
nohup ./_cass_v5.sh
nohup ./_cass_all.sh