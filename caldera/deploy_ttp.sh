#!/bin/bash
mkdir ~/caldera/payloads/
cp -p payloads/* ~/caldera/payloads/
cp tx2/ability/tx2_disable_defender_realtime.yml ~/caldera/plugins/atomic/data/abilities/defense-evasion/
cp tx2/ability/tx2_lateral_copy_attack_tool.yml ~/caldera/plugins/atomic/data/abilities/lateral-movement/
mkdir ~/caldera/plugins/atomic/data/abilities/impair-process-control/
cp tx2/ability/tx2_lateral_exec_attack_tool.yml ~/caldera/plugins/atomic/data/abilities/impair-process-control/
cp tx2/ability/tx2_mimikatz_download.yml ~/caldera/plugins/atomic/data/abilities/command-and-control/
cp tx2/ability/tx2_mimikatz_run.yml ~/caldera/plugins/atomic/data/abilities/credential-access/
cp tx2/ability/tx2_nmap_download.yml ~/caldera/plugins/atomic/data/abilities/command-and-control/
cp tx2/ability/tx2_nmap_run.yml ~/caldera/plugins/atomic/data/abilities/discovery/
cp tx2/adversary/tx2_simple_lateral_simulation.yml ~/caldera/plugins/stockpile/data/adversaries/
