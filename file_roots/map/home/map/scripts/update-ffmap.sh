#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

base="/home/map/scripts"

# Problem Stadt Herford
#python ${base}/update-node.py \
#--url http://gw-hf.herford.freifunk.net/node.json \
#--node ${base}/map/gw-hf.json

${base}/map/venv3/bin/python ${base}/map/ffmap-backend/backend.py \
--mesh {{ batman }}:{{ socket }} --dest-dir {{ data }} \
--online-aliases ${base}/map/aliases.json ${base}/map/gw-hf.json --prune 30 \
--with-rrd --rrd-time-global 14d --rrd-time-node 7d \
--anonymize

${base}/map/venv3/bin/python ${base}/map/ffflash/ffflash.py \
--nodelist {{ data }}/nodelist.json \
/var/www/meshviewer/freifunk-api/herford.json
