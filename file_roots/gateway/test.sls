# pillars['abc']['abc']

{% set interface = 'lxcbr0' %}

# Affects:  /etc/iptables/rules.v4
# Validate: iptables -L -v
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
    - in-interface: {{ interface }}
#    - sport: 1025:65535

# Affects:  /etc/iptables/rules.v6
# Validate: ip6tables -L -v
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
    - in-interface: {{ interface }}
#    - sport: 1025:65535

# Affects:  /etc/network/interfaces
# validate: cat /etc/network/interfaces
lo:
  network.managed:
    - name: lo
    - enabled: True # auto lo
    - type: eth
    - proto: loopback # iface lo inet loopback

enp0s3:
  network.managed:
    - name: enp0s3
    - enabled: True # auto enp0s3
    - type: eth
    - proto: dhcp # iface enp0s3 inet dhcp

/etc/network/interfaces:
  file.prepend:
    - text: |
        # This file describes the network interfaces available on your system
        # and how to activate them. For more information, see interfaces(5).

        source /etc/network/interfaces.d/*

# Affects:  /etc/hostname
# Validate: hostname
system:
  network.system:
    - enabled: True
    - hostname: ubuntu-xenial
    - apply_hostname: True

# Affects:  /etc/sysctl.d/99-salt.conf
# Validate: sysctl net.ipv4.ip_forward
net.ipv4.ip_forward:
  sysctl.present:
    - value: 1

# Affects:  /etc/hosts
# Validate: cat /etc/hosts
localhost:
  host.present:
    - ip:
      - 127.0.0.1
    - names:
      - localhost

ubuntu-xenial:
  host.present:
    - ip:
      - 127.0.1.1
    - names:
      - ubuntu-xenial
      - ubuntu-xenial.digital-nerv.net
      - m2.dev.digital-nerv.net

ubuntu-xenial-absent:
  host.absent:
    - ip:
      - 127.0.0.1
    - names:
      - ubuntu-xenial
      - ubuntu-xenial.digital-nerv.net
      - m2.dev.digital-nerv.net

localhost-absent:
  host.absent:
    - ip:
      - 127.0.1.1
    - names:
      - localhost
