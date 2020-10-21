#!/usr/bin/env bash
# Copyright 2020 - 2020 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

batmanif="{{ pillar['network']['bridge']['interface'] }}"
bridgeif="{{ pillar['network']['batman']['interface'] }}"

if [[ ! $(brctl show | grep ${batmanif}) ]]; then
	brctl addif ${batmanif} ${bridgeif}
fi
