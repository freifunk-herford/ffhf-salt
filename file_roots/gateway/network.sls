# Network Interfaces & Brige Utilities

{% set bridgeutils = salt['grains.filter_by']({
  'Debian': {'pkg': 'bridge-utils'},
}, default='Debian') %}

{{ bridgeutils.pkg }}:
  pkg.installed:
    - name: {{ bridgeutils.pkg }}

# {#% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '18.04' %#}

{% set ifupdown = salt['grains.filter_by']({
  'Debian': {'pkg': 'ifupdown'},
}, default='Debian') %}

{{ ifupdown.pkg }}:
  pkg.installed:
    - name: {{ ifupdown.pkg }}

{% set resolvconf = salt['grains.filter_by']({
  'Debian': {'pkg': 'resolvconf'},
}, default='Debian') %}

{{ resolvconf.pkg }}:
  pkg.installed:
    - name: {{ resolvconf.pkg }}

# {#% endif %#}

# Interfaces

{% if grains['os_family'] == 'Debian' %}

# /etc/network/interfaces:
#   file.managed:
#     - name: /etc/network/interfaces
#     - srouce: salt://etc/network/interfaces-{#{ grains['nodename'] }#}

# /etc/network/interfaces.d/br0:
#   file.managed:
#     - name: /etc/network/interfaces.d/br0
#     - source: salt://gateway/etc/network/interfaces.d/br0
#     - template: jinja
#     - defaults:
#         address: {#{ pillar['network']['bridge']['ipv4']['address'] }#}
#         netmask: {#{ pillar['network']['bridge']['ipv4']['netmask'] }#}
#         address6: {#{ pillar['network']['bridge']['ipv6']['address'] }#}
#         netmask6: {#{ pillar['network']['bridge']['ipv6']['netmask'] }#}
#     - user: root
#     - group: root
#     - mode: 644

# /etc/network/interfaces.d/bat0:
#   file.managed:
#     - name: /etc/network/interfaces.d/bat0
#     - source: salt://gateway/etc/network/interfaces.d/bat0
#     - user: root
#     - group: root
#     - mode: 64

{% if not pillar['testing'] is defined %}
/etc/resolvconf/resolv.conf.d/head:
  file.managed:
    - name: /etc/resolvconf/resolv.conf.d/head
    - source: salt://gateway/etc/resolvconf/resolv.conf.d/head
{% endif %}

/etc/network/interfaces:
  file.append:
    - name: /etc/network/interfaces
    - text: |

        source /etc/network/interfaces.d/*

/etc/network/interfaces.d:
  file.directory:
    - name: /etc/network/interfaces.d
    - makedirs: True

/etc/network/interfaces.d/bridge:
  file.managed:
    - name: /etc/network/interfaces.d/bridge
    - source: salt://gateway/etc/network/interfaces.d/bridge
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        primary: {{ pillar['network']['primary']['interface'] }}
        bridge: {{ pillar['network']['bridge']['interface'] }}
        hwaddress: {{ pillar['network']['bridge']['hwaddress'] }}
        address: {{ pillar['network']['bridge']['address'] }}
        netmask: {{ pillar['network']['bridge']['netmask'] }}
        address6mask: {{ pillar['network']['bridge']['address6mask'] }}
  cmd.run:
    - name: ifup {{ pillar['network']['bridge']['interface'] }}
    - unless: test -n "$(ifconfig | grep {{ pillar['network']['bridge']['interface'] }})"

{% if pillar['fastd']['secret'] is defined %}

/etc/network/interfaces.d/batman:
  file.managed:
    - name: /etc/network/interfaces.d/batman
    - source: salt://gateway/etc/network/interfaces.d/batman
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        primary: {{ pillar['network']['primary']['interface'] }}
        bridge: {{ pillar['network']['bridge']['interface'] }}
        batman: {{ pillar['network']['batman']['interface'] }}

{% endif %}

{% if pillar['network']['mesh']['hwaddress'] is defined %}

/etc/network/interfaces.d/mesh:
  file.managed:
    - name: /etc/network/interfaces.d/mesh
    - source: salt://gateway/etc/network/interfaces.d/mesh
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        primary: {{ pillar['network']['primary']['interface'] }}
        batman: {{ pillar['network']['batman']['interface'] }}
        mesh: {{ pillar['network']['mesh']['interface'] }}
        hwaddress: {{ pillar['network']['mesh']['hwaddress'] }}

{% endif %}

{% if pillar['exit'] is defined and pillar['exit']['provider'] == 'ffrl' %}

/etc/network/interfaces.d/ffrl:
  file.managed:
    - name: /etc/network/interfaces.d/ffrl
    - source: salt://gateway/etc/network/interfaces.d/ffrl
    - user: root
    - group: root
    - mode: 644
    - template: jinja

{% endif %}

{% endif %}

# Forwarding
# IPv4
# Affects:  /etc/sysctl.d/99-salt.conf
# Validate: sysctl net.ipv4.ip_forward
net.ipv4.ip_forward:
  sysctl.present:
    - value: 1

# Sven
net.ipv4.conf.default.rp_filter:
  sysctl.present:
    - value: 0

net.ipv4.conf.all.rp_filter:
  sysctl.present:
    - value: 0

# IPv6
# Affects:  /etc/sysctl.d/99-salt.conf
# Validate: sysctl net.ipv6.conf.all.forwarding
net.ipv6.conf.all.forwarding:
  sysctl.present:
    - value: 1

# Sven
net.ipv6.conf.all.autoconf:
  sysctl.present:
    - value: 0

net.ipv6.conf.default.autoconf:
  sysctl.present:
    - value: 0

# net.ipv6.conf.eth0.autoconf:
#   sysctl.present:
#     - value: 0

net.ipv6.conf.all.accept_ra:
  sysctl.present:
    - value: 0

net.ipv6.conf.default.accept_ra:
  sysctl.present:
    - value: 0

# net.ipv6.conf.eth0.accept_ra:
#   sysctl.present:
#     - value: 0

# % if grains['kernelrelease'] < '3.18' %}

# /etc/resolv.conf

# Check the Bridge Interface for B.A.T.M.A.N.

/root/scripts/check-bridge.sh:
  file.managed:
    - name: /root/scripts/check-bridge.sh
    - source: salt://gateway/root/scripts/check-bridge.sh
    - makedirs: True
    - user: root
    - group: root
    - mode: 755
    - template: jinja

check-bridge-cron:
  cron.present:
    - name: /root/scripts/check-bridge.sh
    - identifier: check-bridge
    - user: root
    - minute: '*/5'
    - comment: 'Check if B.A.T.M.A.N. is on the Bridge Interface every 5 Minutes'
    - require:
      - file: /root/scripts/check-bridge.sh

# Check the Hostname

/root/scripts/check-hostname.sh:
  file.managed:
    - name: /root/scripts/check-hostname.sh
    - source: salt://gateway/root/scripts/check-hostname.sh
    - makedirs: True
    - user: root
    - group: root
    - mode: 755
    - template: jinja

check-hostname-cron:
  cron.present:
    - name: /root/scripts/check-hostname.sh
    - identifier: check-hostname
    - user: root
    - minute: '*/5'
    - comment: 'Check the Hostname every 5 Minutes'
    - require:
      - file: /root/scripts/check-hostname.sh

