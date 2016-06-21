#!/usr/bin/env bash

source /root/scripts/announce/ffnord-alfred-announce/venv/bin/activate; \
python announce.py \
-d /root/scripts/announce/ffnord-alfred-announce/nodeinfo.d/ \
{{ bridge }} {{ batman }} { vpn }} {{ sitecode }} | gzip | \
alfred {{ socket }} {{ bridge }} -s 159

source /root/scripts/announce/ffnord-alfred-announce/venv/bin/activate; \
python announce.py \
-d /root/scripts/announce/ffnord-alfred-announce/statistics.d/ \
{{ bridge }} {{ batman }} { vpn }} {{ sitecode }} | gzip | \
alfred {{ socket }} {{ bridge }} -s 159
