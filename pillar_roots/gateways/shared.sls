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
    {% elif grains['id'] == 'gw5' %}
    range_start: 10.34.128.0
    range_end: 10.34.143.254
    {% elif grains['id'] == 'gw6' %}
    range_start: 10.34.144.0
    range_end: 10.34.159.254
    {% elif grains['id'] == 'gw7' %}
    range_start: 10.34.160.0
    range_end: 10.34.175.254
    {% elif grains['id'] == 'gw8' %}
    range_start: 10.34.176.0
    range_end: 10.34.191.254
    {% elif grains['id'] == 'gw9' %}
    range_start: 10.34.192.0
    range_end: 10.34.207.254
    {% endif %}
  ipv6:
    enable: False
  interface_mtu: 1350
  default_lease_time: 300
  max_lease_time: 300
  min_lease_time: 300
  log_facility: local6
  domain_search: ffhf

bind:
  zones:
    - ffhf
    - 34.10.in-addr.arpa
    - 2.5.1.5.9.4.0.2.3.f.d.f.ip6.arpa
  trusted:
    - 127.0.0.1
    - 10.34.0.0/16
    - ::1
    - fdf3:2049:5152::/48
  # masters: 10.34.0.32; fdf3:2049:5152::a22:20;
  # Test Daten Dummy DNS Master
  masters: 10.34.0.2; fdf3:2049:5152::a22:2;

iptables:
  ipv4:
    masquerade: 10.34.0.0/16

network:
  bridge:
    interface: hfBR # br0
    netmask: 255.255.0.0
    prefix: fdf3:2049:5152::/64
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
  protocol: ipv4
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
