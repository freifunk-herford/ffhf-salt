#!/usr/bin/env bash
# Copyright 2011 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dirs=(
	"${base}/../file_roots"
	"${base}/../pillar_roots"
	"${base}/docs"
)

for dir in ${dirs[@]}; do
	find ${dir} -type d -print0 | xargs -0 chmod 0775 # For directories
	find ${dir} -type f -print0 | xargs -0 chmod 0664 # For files
done
