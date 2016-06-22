# Gemeinsame Daten

dhcp:
  ipv4:
    subnet: 10.34.0.0
    netmask: 255.255.0.0
    {% if grains['id'] == 'gw1' %}
    range_start: 10.34.0.100
    range_end: 10.34.0.119
    {% elif grains['id'] == 'gw2' %}
    range_start: 10.34.0.120
    range_end: 10.34.0.129
    {% elif grains['id'] == 'gw3' %}
    range_start: 10.34.0.130
    range_end: 10.34.0.139
    {% elif grains['id'] == 'gw4' %}
    range_start: 10.34.0.140
    range_end: 10.34.0.149
    {% endif %}
  interface_mtu: 1280
  default_lease_time: 300
  max_lease_time: 300
  min_lease_time: 300
  log_facility: local6

bind:
  ipv6:
    listen: fdf3:2049:5152::a22:3
    intern: fdf3:2049:5152::/48
    master: fdf3:2049:5152::a22:20
  ipv4:
    listen: 10.34.0.3
    intern: 10.34.0.0/16
    reverse: 34.10.in-addr.arpa
  zone: ffhf

iptables:
  ipv4:
    masquerade: 10.34.0.0/16

network:
  bridge:
    interface: hfBR # br0
    netmask: 255.255.0.0
    prefix: fdf3:2049:5152::/64
    address6: fdf3:2049:5152::0a22:3
    address6mask: fdf3:2049:5152::a22:3/64
  batman:
    interface: hfBAT # bat0
  vpn:
    # vpn in mesh umbenennen?
    interface: hfVPN # tun0/tap0
  exit:
    interface: exitVPN # tun0/tap0
  intercity:
    interface: icVPN # tun0/tap0

fastd:
  port: 1244
  socket: /var/run/fastd.sock

alfred:
  socket: /var/run/alfred.sock
  sock: /var/run/alfred.sock
  sitecode: ffhf

apache:
  serveradmin: webmaster@herford.freifunk.net
  sslcertificatefile: /etc/ssl/{{ grains['id'] }}/public/cert.pem
  sslcertificatekeyfile: /etc/ssl/{{ grains['id'] }}/private/privkey.pem
  sslcertificatechainfile: /etc/ssl/{{ grains['id'] }}/intermediate.pem
