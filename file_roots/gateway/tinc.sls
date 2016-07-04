# tinc VPN (Virtual Private Network)

{% set tinc = salt['grains.filter_by']({
  'Debian': {'pkg': 'tinc', 'srv': 'tinc'},
}, default='Debian') %}

{{ tinc.pkg }}:
  pkg.installed:
    - name: {{ tinc.pkg }}
#   service.running:
#     - name: {{ tinc.srv }}
#     - enable: True
#     - watch:
#       - file: /etc/tinc/icvpn/tinc.conf
#       - file: /etc/tinc/icvpn/rsa_key.priv
#       - file: /etc/tinc/icvpn/rsa_key.pub

# intercity-repository:
#   git.latest:
#     - name: https://github.com/freifunk/icvpn.git
#     - target: /etc/tinc/icvpn

# /etc/tinc/icvpn/tinc.conf:
#   file.managed:
#     - name: /etc/tinc/icvpn/tinc.conf
#     - source: salt://gateway/etc/tinc/icvpn/tinc.conf
#     - require:
#       - git: intercity-repository

# Contents of /etc/tinc/icvpn/tinc.conf:
# Name=herford1
# Mode=switch

# /etc/tinc/icvpn/rsa_key.priv:
#   file.managed:
#     - contents_pillar: tinc:icvpn:rsa_key.priv
#
# /etc/tinc/icvpn/rsa_key.pub:
#   file.managed:
#     - contents_pillar: tinc:icvpn:rsa_key.pub

# Generate Keys: tincd -n icvpn -K

# /root/scripts/update-intercity.sh:
#   file.managed:
#     - name: /root/scripts/update-intercity.sh
#     - source: salt://gateway/root/scripts/update-intercity.sh
#     - makedirs: True

# git --git-dir=/etc/tinc/icvpn --work-tree=/etc/tinc/icvpn pull

# update-intercity-cron:
#   cron.present:
#     - name: /root/scripts/update-intercity.sh
#     - identifier: update-intercity
#     - user: root
#     - minute: '23'
#     - hour: '23'
#     - day: '*'
#     - comment: 'Update InterCity VPN Peers every Day'
#     - require:
#       - file: /root/scripts/update-intercity.sh
