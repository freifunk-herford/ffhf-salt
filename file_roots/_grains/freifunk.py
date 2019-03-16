# -*- coding: utf-8 -*-
# Copyright 2015 - 2019 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net
from __future__ import absolute_import, division, print_function

import subprocess
import collections
import os
import re
import distutils.spawn

def which(command):
    return distutils.spawn.find_executable(command)

def alfred_version(command):
    response = subprocess.Popen([command, "-v"], stdout=subprocess.PIPE)
    if response:
        return response.stdout.read().split()[1]

def fastd_version(command):
    response = subprocess.Popen([command, "-v"], stdout=subprocess.PIPE)
    if response:
        return response.stdout.read().split()[1]

def batctl_version(command):
    response = subprocess.Popen([command, "-v"], stdout=subprocess.PIPE)
    if response:
        return response.stdout.read().split()[1]

def batadvvis(command):
    response = subprocess.Popen([command, "-v"], stdout=subprocess.PIPE)
    if response:
        return response.stdout.read().split()[1]

def alfredjson_version(command):
    response = subprocess.Popen([command, "-h"], stdout=subprocess.PIPE)
    if response:
        return response.stdout.read().split()[1]

def bird_version(command):
    response = subprocess.Popen([command, "--version"], stdout=None, stderr=subprocess.PIPE, shell=False)
    if response:
        return response.stderr.read().split()[2]

def batadvvis_version(command):
    response = subprocess.Popen([command, "-v"], stdout=subprocess.PIPE)
    if response:
        return response.stdout.read().split()[1]

def freifunk():
    # initialize a grains dictionary
    grains = {}

    alfred = which("alfred")
    alfredjson = which("alfred-json")
    fastd = which("fastd")
    batctl = which("batctl")
    batadvvis = which("batadv-vis")
    bird = which("bird")
    if alfred:
        grains['freifunk'] = {'alfred': alfred_version(alfred)}
        if alfredjson:
            grains['freifunk']['alfred-json'] = alfredjson_version(alfredjson)
        if fastd:
            grains['freifunk']['fastd'] = fastd_version(fastd)
        if batadvvis:
            grains['freifunk']['batadv-vis'] = batadvvis_version(batadvvis)
        if batctl:
            grains['freifunk']['batctl'] = batctl_version(batctl)
        if bird:
            grains['freifunk']['bird'] = bird_version(bird)
        return grains
    else:
        return grains

if __name__ == '__main__':
    print(freifunk())
