#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

if [ -z "$(ifconfig | grep {{ exit }})" ]; then
	service openvpn restart
	exit
fi

testping=$(ping -q -I {{ exit }} 8.8.8.8 -c 4 -i 1 -W 5 | grep 100)

if [ -n "${testping}" ]; then
	service openvpn restart
	exit
fi
