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
  default_lease_time: 240
  max_lease_time: 1200

bind:
  ipv6:
    master: fdf3:2049:5152::a22:20
    listen: fdf3:2049:5152::a22:3
    intern: fdf3:2049:5152::/48
  ipv4:
    listen: 10.34.0.3
    intern: 10.34.0.0/16
    reverse: 34.10.in-addr.arpa
  zone: ffhf

network:
  bridge:
    interface: hfBR # br0
    hwaddress: 02:42:0a:22:00:03
    netmask: 255.255.0.0
    prefix: fdf3:2049:5152::/64
    address6: fdf3:2049:5152::0a22:3
    address6mask: fdf3:2049:5152::a22:3/64
  batman:
    interface: hfBAT # bat0
  vpn:
    interface: hfVPN # tun0/tap0
    hwaddress: 02:00:0a:22:00:03
  exit:
    interface: exitVPN # tun0/tap0
  intercity:
    interface: icVPN # tun0/tap0

apache:
  serveradmin: webmaster@herford.freifunk.net
  sslcertificatefile: /etc/ssl/{{ grains['nodename'] }}/public/cert.pem
  sslcertificatekeyfile: /etc/ssl/{{ grains['nodename'] }}/private/privkey.pem
  sslcertificatechainfile: /etc/ssl/{{ grains['nodename'] }}/intermediate.pem
