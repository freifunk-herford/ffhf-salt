#!/usr/bin/env bash
# Copyright 2014 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd ${base}/..

find . -type f -not \( -path */contrib/venv/* -prune \) -not \( -path */.git/* -prune \) -print0 | xargs -0 chmod 0644
find . -type d -not \( -path */contrib/venv/* -prune \) -not \( -path */.git/* -prune \) -print0 | xargs -0 chmod 0755

popd

