#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

if [ -f /etc/sysfs.d/99-batman-hop-penalty.conf ]; then

	key=$(awk -F '=' '{print $1}' /etc/sysfs.d/99-batman-hop-penalty.conf)
	desired_value=$(awk -F '=' '/[0-9]+/{print $2}' /etc/sysfs.d/99-batman-hop-penalty.conf)
	present_value=$(awk '/[0-9]+/{print $1}' /sys/${key})

	if [ ! ${desired_value} -eq ${present_value} ]; then
	        if [ -f /bin/systemctl ]; then
	                systemctl restart sysfsutils
	        else
	                service sysfsutils restart
	        fi
	fi
fi