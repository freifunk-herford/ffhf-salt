#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

base="/home/map/scripts/map"

${base}/venv3/bin/python ${base}/ffmap-backend/backend.py \
--mesh {{ batman }}:{{ socket }} --dest-dir {{ data }} \
--aliases ${base}/aliases.json --aliases-assume-online \
--prune 30 --with-rrd --rrd-time-global 14d \
--rrd-time-node 7d --anonymize

${base}/venv3/bin/python ${base}/ffflash/ffflash.py \
--nodelist {{ data }}/nodelist.json \
/var/www/meshviewer/freifunk-api/herford.json
