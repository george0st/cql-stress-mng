# Run from terminal
###########################

# Run without terminal
###########################
python3.11 stress/stress_mng.py generate -e private/zeebe/_cass_profile.env -l ../_zeebe_all.sh -d stress
nohup ./_zeebe_all.sh


python3.11 stress/stress_mng.py generate -e private/zeebe/_cass_*.env -l ../_zeebe_all.sh -d stress
./_zeebe_all.sh

# Mains for 'compareV4V5_sequenceTHR'
python3.11 stress/stress_mng.py run -e compareV4V5_sequenceTHR/_cass_v4_*.env -l ../_cass_seq_v4.sh -d stress
python3.11 stress/stress_mng.py run -e compareV4V5_sequenceTHR/_cass_v5_*.env -l ../_cass_seq_v5.sh -d stress
python3.11 stress/stress_mng.py run -e compareV4V5_sequenceTHR/_cass_*.env -l ../_cass_seq_all.sh -d stress

nohup ./_cass_seq_v4.sh
nohup ./_cass_seq_v5.sh
nohup ./_cass_seq_all.sh

# Mains for 'compareV4V5_separateTHR'
python3.11 stress/stress_mng.py run -e compareV4V5_separateTHR/_cass_v4_*.env -l ../_cass_v4.sh -d stress
python3.11 stress/stress_mng.py run -e compareV4V5_separateTHR/_cass_v5_*.env -l ../_cass_v5.sh -d stress
python3.11 stress/stress_mng.py run -e compareV4V5_separateTHR/_cass_*.env -l ../_cass_all.sh -d stress

nohup ./_cass_v4.sh
nohup ./_cass_v5.sh
nohup ./_cass_all.sh

# Others
python3.11 stress/stress_mng.py run -e compareV4V5_separateTHR/_cass_v4_1*.env -l ../_cass_v4_1.sh -d stress
python3.11 stress/stress_mng.py run -e compareV4V5_separateTHR/_cass_v4_2*.env -l ../_cass_v4_2.sh -d stress
python3.11 stress/stress_mng.py run -e compareV4V5_separateTHR/_cass_v5_1*.env -l ../_cass_v5_1.sh -d stress
python3.11 stress/stress_mng.py run -e compareV4V5_separateTHR/_cass_v5_2*.env -l ../_cass_v5_2.sh -d stress

nohup ./_cass_v4_1.sh
nohup ./_cass_v4_2.sh
nohup ./_cass_v5_1.sh
nohup ./_cass_v5_2.sh

