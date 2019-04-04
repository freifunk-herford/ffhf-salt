# Net Filter/IP Tables Persistent

{% set iptables = salt['grains.filter_by']({
  'Debian': {'pkg': 'iptables-persistent', 'srv': 'iptables-persistent'}
}, default='Debian') %}

{% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}
{% set iptables = salt['grains.filter_by']({
  'Debian': {'pkg': 'netfilter-persistent', 'srv': 'netfilter-persistent'}
}, default='Debian') %}
{% endif %}

{% if grains['osrelease'] == '18.04' and grains['os'] == 'Ubuntu' %}
{% set iptables = salt['grains.filter_by']({
  'Debian': {'pkg': 'netfilter-persistent', 'srv': 'netfilter-persistent'}
}, default='Debian') %}
{% endif %}

{{ iptables.pkg }}:
  pkg.installed:
    - name: {{ iptables.pkg }}
  {% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}
  service.running:
    - name: {{ iptables.srv }}
    - enable: True
  file.managed:
    - name: /usr/share/netfilter-persistent/plugins.d/iptables-persistent
    - source: salt://gateway/usr/share/netfilter-persistent/plugins.d/iptables-persistent
    - mode: 755
    - user: root
    - group: root
  {% elif grains['osrelease'] == '18.04' and grains['os'] == 'Ubuntu' %}
  service.running:
    - name: {{ iptables.srv }}
    - enable: True
  file.managed:
    - name: /usr/share/netfilter-persistent/plugins.d/iptables-persistent
    - source: salt://gateway/usr/share/netfilter-persistent/plugins.d/iptables-persistent
    - mode: 755
    - user: root
    - group: root
  {% else %}
  service.enabled:
    - name: {{ iptables.srv }}
  {% endif %}

nat-POSTROUTING-ACCEPT-MASQUERADE:
  iptables.append:
    - table: nat
    - save: True
    - family: ipv4
    - chain: POSTROUTING
    - jump: MASQUERADE
    - source: {{ pillar['iptables']['ipv4']['masquerade'] }}
    - out-interface: {{ pillar['network']['exit']['interface'] }}

{% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}
netfilter-persistent-save:
  cmd.run:
    - name: service netfilter-persistent save
    - onchanges:
      - iptables: nat-POSTROUTING-ACCEPT-MASQUERADE
{% endif %}

{% if grains['osrelease'] == '18.04' and grains['os'] == 'Ubuntu' %}
netfilter-persistent-save:
  cmd.run:
    - name: service netfilter-persistent save
    - onchanges:
      - iptables: nat-POSTROUTING-ACCEPT-MASQUERADE
{% endif %}

# /etc/iptables/rules.v4
# filter-INPUT-ACCEPT:
#   iptables.append:
#     - table: filter
#     - save: True
#     - family: ipv4
#     - chain: INPUT
#     - jump: ACCEPT
# filter-FORWARD-ACCEPT:
#   iptables.append:
#     - table: filter
#     - save: True
#     - family: ipv4
#     - chain: FORWARD
#     - jump: ACCEPT
# filter-OUTPUT-ACCEPT:
#   iptables.append:
#     - table: filter
#     - save: True
#     - family: ipv4
#     - chain: OUTPUT
#     - jump: ACCEPT
# mangle-PREROUTING-ACCEPT:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: PREROUTING
#     - jump: ACCEPT
# mangle-INPUT-ACCEPT:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: INPUT
#     - jump: ACCEPT
# mangle-FORWARD-ACCEPT:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: FORWARD
#     - jump: ACCEPT
# mangle-OUTPUT-ACCEPT:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: OUTPUT
#     - jump: ACCEPT
# mangle-POSTROUTING-ACCEPT:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: POSTROUTING
#     - jump: ACCEPT
# mangle-POSTROUTING-TCPMSS:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: POSTROUTING
#     - jump: TCPMSS
#     - protocol: tcp
#     - tcp-flags: SYN,RST SYN
#     - out-interface: tun-+
#     - set-mss: 1280
# mangle-PREROUTING-MARK:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: PREROUTING
#     - jump: MARK
#     - in-interface: br0
#     - set-xmark: 0x1/0xffffffff
# mangle-OUTPUT-MARK-udp:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: OUTPUT
#     - jump: MARK
#     - out-interface: eth0
#     - protocol: udp
#     - destination-port: 53
#     - set-xmark: 0x1/0xffffffff
# mangle-OUTPUT-MARK-tcp:
#   iptables.append:
#     - table: mangle
#     - save: True
#     - family: ipv4
#     - chain: OUTPUT
#     - jump: MARK
#     - out-interface: eth0
#     - protocol: tcp
#     - destination-port: 53
#     - set-xmark: 0x1/0xffffffff
# nat-PREROUTING-ACCEPT:
#   iptables.append:
#     - table: nat
#     - save: True
#     - family: ipv4
#     - chain: PREROUTING
#     - jump: ACCEPT
# nat-INPUT-ACCEPT:
#   iptables.append:
#     - table: nat
#     - save: True
#     - family: ipv4
#     - chain: INPUT
#     - jump: ACCEPT
# nat-OUTPUT-ACCEPT:
#   iptables.append:
#     - table: nat
#     - save: True
#     - family: ipv4
#     - chain: OUTPUT
#     - jump: ACCEPT
# nat-POSTROUTING-ACCEPT:
#   iptables.append:
#     - table: nat
#     - save: True
#     - family: ipv4
#     - chain: POSTROUTING
#     - jump: ACCEPT
# nat-POSTROUTING-ACCEPT-SNAT:
#   iptables.append:
#     - table: nat
#     - save: True
#     - family: ipv4
#     - chain: POSTROUTING
#     - jump: SNAT
#     - out-interface: tun-+
#     - to-source: {#{ pillar['network']['bridge']['ipv4']['address'] }#}
    # Public IPv4 Address GW

  # cmd.run:
  #   - name: service {{ iptables.srv }} save
  #   - unless: test -z "$(iptables-save | grep '-A POSTROUTING -s {{ pillar['iptables']['ipv4']['masquerade'] }} -o {{ pillar['network']['exit']['interface'] }} -j MASQUERADE')"

# iptables -t nat -A POSTROUTING -s 10.34.0.0/16 -o exitVPN -j MASQUERADE
# /etc/iptables/rules.v6

# Todo: Not Saving iptables
