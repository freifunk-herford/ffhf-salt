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

def tincd_version(command):
    response = subprocess.Popen([command, "--version"], stdout=subprocess.PIPE)
    if response:
        return response.stdout.read().split()[2]

def modinfo(module):
    try:
        response = subprocess.Popen(["modinfo", "-F", "version", module], stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
        if response:
            return response.stdout.read().split()[0]
    except:
        pass

def freifunk():
    # initialize a grains dictionary
    grains = {}

    alfred = which("alfred")
    batadvvis = which("batadv-vis")
    batctl = which("batctl")
    batmanadv = modinfo("batman_adv")
    alfredjson = which("alfred-json")
    bird = which("bird")
    tincd = which("tincd")
    fastd = which("fastd")

    if alfred:
        grains['freifunk'] = {'alfred': alfred_version(alfred)}
        if batadvvis:
            grains['freifunk']['batadv-vis'] = batadvvis_version(batadvvis)
        if alfredjson:
            grains['freifunk']['alfred-json'] = alfredjson_version(alfredjson)
        if batctl:
            grains['freifunk']['batctl'] = batctl_version(batctl)
        if batmanadv:
            grains['freifunk']['batman-adv'] = batmanadv
        if bird:
            grains['freifunk']['bird'] = bird_version(bird)
        if tincd:
            grains['freifunk']['tincd'] = tincd_version(tincd)
        if fastd:
            grains['freifunk']['fastd'] = fastd_version(fastd)
        return grains
    else:
        return grains

if __name__ == '__main__':
    print(freifunk())
