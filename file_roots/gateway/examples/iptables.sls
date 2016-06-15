# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.iptables.html

# /etc/iptables/rules.v4
in-80-new-ipv4:
  iptables.append:
    - name: New HTTP Traffic IPv4
    - table: filter
    - save: True
    - family: ipv4
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 80
    - proto: tcp
    - in-interface: lxcbr0
#    - sport: 1025:65535

# /etc/iptables/rules.v6
in-80-new-ipv6:
  iptables.append:
    - name: New HTTP Traffic IPv6
    - table: filter
    - family: ipv6
    - save: True
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 80
    - proto: tcp
    - in-interface: lxcbr0
#    - sport: 1025:65535
