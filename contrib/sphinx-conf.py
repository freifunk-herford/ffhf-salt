# -*- coding: utf-8 -*-
# Copyright 2018 - 2019 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

import saltdoc

if __name__ == '__main__':
    s = saltdoc.SaltDoc(
        '../../ffhf-salt/file_roots',
        '../../ffhf-salt/pillar_roots'
    )

    s.parse_states('gateway', 'Gateway')
    s.parse_states('map', 'Map')
    s.write_rst(
        '%s/file_roots/index.rst' % s.docs_source,
        s.template_index('States', ['gateway/index', 'map/index'])
    )

    s.parse_pillars('gateways', 'Gateways')
    s.parse_pillars('map', 'Map')
    s.write_rst(
        '%s/pillar_roots/index.rst' % s.docs_source,
        s.template_index('Pillars', ['gateways/index', 'map/index'])
    )
