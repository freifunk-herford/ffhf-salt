# Paketfilter Userland

{% set iptables = salt['grains.filter_by']({
  'Debian': {'pkg': 'iptables-persistent', 'srv': 'iptables-persistent'}
}, default='Debian') %}

{% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}
{% set iptables = salt['grains.filter_by']({
  'Debian': {'pkg': 'netfilter-persistent', 'srv': 'netfilter-persistent'}
}, default='Debian') %}
{% endif %}

{{ iptables.pkg }}:
  pkg.installed:
    - name: {{ iptables.pkg }}
  service.running:
    - name: {{ iptables.srv }}
    - enable: True

# /etc/iptables/rules.v4
filter-INPUT-ACCEPT:
  iptables.append:
    - table: filter
    - save: True
    - family: ipv4
    - chain: INPUT
    - jump: ACCEPT
filter-FORWARD-ACCEPT:
  iptables.append:
    - table: filter
    - save: True
    - family: ipv4
    - chain: FORWARD
    - jump: ACCEPT
filter-OUTPUT-ACCEPT:
  iptables.append:
    - table: filter
    - save: True
    - family: ipv4
    - chain: OUTPUT
    - jump: ACCEPT
mangle-PREROUTING-ACCEPT:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: PREROUTING
    - jump: ACCEPT
mangle-INPUT-ACCEPT:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: INPUT
    - jump: ACCEPT
mangle-FORWARD-ACCEPT:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: FORWARD
    - jump: ACCEPT
mangle-OUTPUT-ACCEPT:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: OUTPUT
    - jump: ACCEPT
mangle-POSTROUTING-ACCEPT:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: POSTROUTING
    - jump: ACCEPT
mangle-POSTROUTING-TCPMSS:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: POSTROUTING
    - jump: TCPMSS
    - protocol: tcp
    - tcp-flags: SYN,RST SYN
    - out-interface: tun-+
    - set-mss: 1280
mangle-PREROUTING-MARK:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: PREROUTING
    - jump: MARK
    - in-interface: br0
    - set-xmark: 0x1/0xffffffff
mangle-OUTPUT-MARK-udp:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: OUTPUT
    - jump: MARK
    - out-interface: eth0
    - protocol: udp
    - destination-port: 53
    - set-xmark: 0x1/0xffffffff
mangle-OUTPUT-MARK-tcp:
  iptables.append:
    - table: mangle
    - save: True
    - family: ipv4
    - chain: OUTPUT
    - jump: MARK
    - out-interface: eth0
    - protocol: tcp
    - destination-port: 53
    - set-xmark: 0x1/0xffffffff
nat-PREROUTING-ACCEPT:
  iptables.append:
    - table: nat
    - save: True
    - family: ipv4
    - chain: PREROUTING
    - jump: ACCEPT
nat-INPUT-ACCEPT:
  iptables.append:
    - table: nat
    - save: True
    - family: ipv4
    - chain: INPUT
    - jump: ACCEPT
nat-OUTPUT-ACCEPT:
  iptables.append:
    - table: nat
    - save: True
    - family: ipv4
    - chain: OUTPUT
    - jump: ACCEPT
nat-POSTROUTING-ACCEPT:
  iptables.append:
    - table: nat
    - save: True
    - family: ipv4
    - chain: POSTROUTING
    - jump: ACCEPT
nat-POSTROUTING-ACCEPT-SNAT:
  iptables.append:
    - table: nat
    - save: True
    - family: ipv4
    - chain: POSTROUTING
    - jump: SNAT
    - out-interface: tun-+
    - to-source: {{ pillar['network']['bridge']['ipv4']['address'] }}
    # Public IPv4 Address GW

# /etc/iptables/rules.v6
