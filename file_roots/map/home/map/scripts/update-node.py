#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

import json
import urllib2
import argparse


class Alfred:
    def __init__(self, options):
        self.options = options

    def fetch(self):
        try:
            return json.loads(urllib2.urlopen(self.options.url).read())
        except Exception as error:
            if self.options.debug:
                print(error)

    def load(self):
        try:
            return json.load(open(self.options.node, 'r'))
        except Exception as error:
            if self.options.debug:
                print(error)

    def update(self):
        local = self.load()
        remote = self.fetch()
        try:
            local[0]['statistics'] = remote['statistics']
            local[0]['software']['firmware'] = remote['firmware']
            local[0]['hardware'] = remote['hardware']
            if self.options.debug:
                print(json.dumps(local, indent=4))
            with open(self.options.node, 'w') as handler:
                json.dump(local, handler)
        except Exception as error:
            if self.options.debug:
                print(error)


def main(options):
    alfred = Alfred(options)
    alfred.update()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='fetch a remote json file with system informations' +
                    'and update your aliases json file with a single node.')
    parser.add_argument('-u', '--url', dest='url', help='url to the remote json file',
                        action='store', required=True, metavar='URL')
    parser.add_argument('-n', '--node', dest='node',
                        help='full path to node json file that will be updates',
                        action='store', required=True, metavar='FILE')
    parser.add_argument('-d', '--debug', dest='debug', help='debug output',
                        default=False, action='store_true')

    main(parser.parse_args())
