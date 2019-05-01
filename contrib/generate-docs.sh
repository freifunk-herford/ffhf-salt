#!/usr/bin/env bash
# Copyright 2018 - 2018 Tobias Benzin <tbenzin@digital-nerv.net>
#                       Rally Vincent <rvincent@digital-nerv.net>

venv/bin/python sphinx-conf.py
venv/bin/sphinx-build -b html docs/source docs/build/html -d docs/build/doctrees -c docs/source -a

