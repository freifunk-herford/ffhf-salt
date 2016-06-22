# Gemeinsame Daten

dhcp:
  ipv4:
    subnet: 10.34.0.0
    netmask: 255.255.0.0
    {% if grains['id'] == 'gw1' %}
    range_start: 10.34.64.0
    range_end: 10.34.79.254
    {% elif grains['id'] == 'gw2' %}
    range_start: 10.34.80.0
    range_end: 10.34.95.254
    {% elif grains['id'] == 'gw3' %}
    range_start: 10.34.96.0
    range_end: 10.34.111.254
    {% elif grains['id'] == 'gw4' %}
    range_start: 10.34.112.0
    range_end: 10.34.127.254
    {% endif %}
  interface_mtu: 1280
  default_lease_time: 300
  max_lease_time: 300
  min_lease_time: 300
  log_facility: local6
  domain_search: ffhf

bind:
  ipv6:
    listen: fdf3:2049:5152::a22:3
    acl_internal: fdf3:2049:5152::/48
    master: fdf3:2049:5152::a22:20
  ipv4:
    listen: 10.34.0.3
    acl_internal: 10.34.0.0/16
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
  mesh:
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
