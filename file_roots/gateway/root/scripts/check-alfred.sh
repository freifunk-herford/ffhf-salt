#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

if [ -f /bin/systemctl ]; then
	if [ "$(systemctl status alfred | grep -E 'Active: inactive|Active: failed')" ]; then
		systemctl restart fastd
		sleep 3
		systemctl restart alfred
	fi
else
	if [ "$(service alfred status | grep stop)" ]; then
		service fastd restart
		sleep 3
		service alfred restart
	fi
fi
