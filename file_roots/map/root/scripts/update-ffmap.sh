#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

base="/root/scripts/map"
data="${base}/data"
data="{{ data }}"

${base}/venv/bin/python ${base}/ffmap-backend/backend.py -m {{ batman }} -d ${data}
