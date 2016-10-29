# Network Interfaces & Brige Utilities

{% set bridgeutils = salt['grains.filter_by']({
  'Debian': {'pkg': 'bridge-utils'},
}, default='Debian') %}

{{ bridgeutils.pkg }}:
  pkg.installed:
    - name: {{ bridgeutils.pkg }}

# Interfaces

{% if grains['os_family'] == 'Debian' %}
# /etc/network/interfaces:
#   file.managed:
#     - name: /etc/network/interfaces
#     - srouce: salt://etc/network/interfaces-{{ grains['nodename'] }}

# /etc/network/interfaces.d/br0:
#   file.managed:
#     - name: /etc/network/interfaces.d/br0
#     - source: salt://gateway/etc/network/interfaces.d/br0
#     - template: jinja
#     - defaults:
#         address: pillar['network']['bridge']['ipv4']['address'] }}
#         netmask: pillar['network']['bridge']['ipv4']['netmask'] }}
#         address6: pillar['network']['bridge']['ipv6']['address'] }}
#         netmask6: pillar['network']['bridge']['ipv6']['netmask'] }}
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

/etc/resolvconf/resolv.conf.d/head:
  file.managed:
    - name: /etc/resolvconf/resolv.conf.d/head
    - source: salt://gateway/etc/resolvconf/resolv.conf.d/head

/etc/network/interfaces:
  file.append:
    - name: /etc/network/interfaces
    - text: |

        source /etc/network/interfaces.d/*

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
        hwaddress: {{ pillar['network']['bridge']['hwaddress'] }}
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
