#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

import os
import re
import json
import argparse
import datetime

class Alfred:
    def __init__(self, options):
        self.options = options
        self.clients = self.count_clients()

    def statistics(self):
        clients = self.clients
        uptime = 0
        memory_usage = 0
        rootfs_usage = 0
        loadavg = 0
        try:
            filename = '/proc/meminfo'
            total = 0
            free = 0
            with open(filename, 'r') as content:
                for line in content:
                    total_match = re.match(r'MemTotal:\s+(.*)\skB', line)
                    if total_match:
                        total = total_match.groups()[0]
                        total = int(total)
                    free_match = re.match(r'MemFree:\s+(.*)\skB', line)
                    if free_match:
                        free = free_match.groups()[0]
                        free = int(free)
            used = (total - free)
            memory_usage = (float(used) / total) * 100
            memory_usage = memory_usage / 100
        except Exception as error:
            if self.options.debug:
                print(error)
            pass
        try:
            statvfs = os.statvfs('/')
            total = (statvfs.f_blocks * statvfs.f_frsize)
            used = (statvfs.f_blocks - statvfs.f_bfree) * statvfs.f_frsize
            rootfs_usage = (float(used) / total) * 100
            rootfs_usage = rootfs_usage / 100
        except Exception as error:
            if self.options.debug:
                print(error)
            pass
        try:
            filename = '/proc/uptime'
            handler = open(filename, 'r')
            content = handler.read()
            uptime = content.split()[1]
            uptime = float(uptime)
        except Exception as error:
            if self.options.debug:
                print(error)
            pass
        try:
            filename = '/proc/loadavg'
            handler = open(filename, 'r')
            content = handler.read()
            loadavg = content.split()[0]
            loadavg = float(loadavg)
        except Exception as error:
            if self.options.debug:
                print(error)
            pass
        return {
            "clients": clients,
            "uptime": uptime,
            "memory_usage": memory_usage,
            "rootfs_usage": rootfs_usage,
            "loadavg": loadavg
        }

    def hardware(self):
        nproc = 0
        model = ""
        filename = "/proc/cpuinfo"
        try:
            with open(filename, 'r') as content:
                for line in content:
                    model_match = re.match(r'model\sname\s:\s(.*)', line)
                    if model_match:
                        model = model_match.groups()[0]
                    nproc_match = re.match(r'siblings\s+:\s(.*)', line)
                    if nproc_match:
                        nproc = nproc_match.groups()[0]
                        nproc = int(nproc)
        except Exception as error:
            if self.options.debug:
                print(error)
            pass
        return {
            "nproc": nproc,
            "model": model
        }

    def firmware(self):
        release = ""
        base = ""
        filename = '/etc/os-release'
        try:
            with open(filename, 'r') as content:
                for line in content:
                    base_match = re.match(r'^NAME=(.*)$', line)
                    if base_match:
                        base = base_match.groups()[0]
                        base = base.strip('\"')
                    release_match = re.match(r'^PRETTY_NAME=(.*)$', line)
                    if release_match:
                        release = release_match.groups()[0]
                        release = release.strip('\"')
        except Exception as error:
            if self.options.debug:
                print(error)
            pass
        return {
            "release": release,
            "base": base
        }

    def count_clients(self):
        clients = 0
        try:
            with open(self.options.leases, 'r') as content:
                for line in content:
                    if 'binding state active':
                        active = True
                    if re.findall(r'ends\s\d\s\d{4}/\d{2}/\d{2}\s\d{2}:\d{2}:\d{2}', line):
                        ends = re.findall(r'\d{4}/\d{2}/\d{2}\s\d{2}:\d{2}:\d{2}', line)
                        expire = datetime.datetime.strptime(ends[0], '%Y/%m/%d %H:%M:%S')
                        now = datetime.datetime.now()
                        if expire < now:
                            expired = True
                    if re.findall(r'^}$', line):
                        if active and not expired:
                            clients += 1
                        active = False
                        expired = False
        except Exception as error:
            if self.options.debug:
                print(error)
            pass
        return clients


def main(options):
    alfred = Alfred(options)
    data = {
        "statistics": alfred.statistics(),
        "firmware": alfred.firmware(),
        "hardware": alfred.hardware()
    }
    try:
        with open(options.output, 'w') as handler:
            json.dump(data, handler)
    except Exception as error:
        print(error)
    if options.debug:
        print(json.dumps(data, indent=4))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='collect system informations and store them into an json file.')
    parser.add_argument('-o', '--output', dest='output', help='full path to your output file',
                        action='store', required=True, metavar='FILE')
    parser.add_argument('-l', '--leases', dest='leases', help='full path to dhcpd.leases',
                        default='/var/lib/dhcp/dhcpd.leases', metavar='FILE')
    parser.add_argument('-d', '--debug', dest='debug', help='debug output',
                        default=False, action='store_true')

    main(parser.parse_args())
