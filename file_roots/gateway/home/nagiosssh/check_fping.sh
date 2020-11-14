#!/usr/bin/env bash
# Copyright 2020 - 2020 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

/usr/lib/nagios/plugins/check_fping "$@"

if [[ $? -eq 3 ]]; then
    exit 2
fi
