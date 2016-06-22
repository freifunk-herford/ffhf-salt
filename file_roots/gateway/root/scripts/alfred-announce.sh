#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

base="/root/scripts/announce"

${base}/venv/bin/python ${base}/ffnord-alfred-announce/announce.py \
-d /root/scripts/announce/ffnord-alfred-announce/nodeinfo.d/ \
-i {{ bridge }} -b {{ batman }} -f {{ mesh }} -s {{ sitecode }} | gzip | \
alfred -u {{ socket }} -i {{ bridge }} -b {{ batman }} -s 159

${base}/venv/bin/python ${base}/ffnord-alfred-announce/announce.py \
-d /root/scripts/announce/ffnord-alfred-announce/nodeinfo.d/ \
-i {{ bridge }} -b {{ batman }} -f {{ mesh }} -s {{ sitecode }} | gzip | \
alfred -u {{ socket }} -i {{ bridge }} -b {{ batman }} -s 159
