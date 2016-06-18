dhcp:
  ipv4:
    subnet: 192.168.33.0
    netmask: 255.255.255.0
    {% if grains['id'] == 'gw1' %}
    range_start: 192.168.33.110
    range_end: 192.168.33.129
    {% elif grains['id'] == 'gw2' %}
    range_start: 192.168.33.130
    range_end: 192.168.33.149
    {% elif grains['id'] == 'gw3' %}
    range_start: 192.168.33.150
    range_end: 192.168.33.169
    {% elif grains['id'] == 'gw4' %}
    range_start: 192.168.33.170
    range_end: 192.168.33.189
    {% endif %}
  interface_mtu: 1280
  default_lease_time: 240
  max_lease_time: 1200
  interfaces: hfBR # br0

network:
  bridge:
    interface: hfBR # br0
    hwaddress: 02:42:0a:22:00:03
    address: 10.34.0.3
    netmask: 255.255.0.0
    prefix: fdf3:2049:5152::/64
    address6: fdf3:2049:5152::a22:3
    address6mask: fdf3:2049:5152::a22:0003/64
  batman:
    interface: hfBAT # bat0
  vpn:
    interface: hfVPN # tun0/tap0
    hwaddress: 02:00:0a:22:00:03
  exit:
    interface: exitVPN
  intercity:
    interface: icVPN

git:
  user:
    name: ffhf
    email: webmaster@herford.freifunk.net

apache:
  serveradmin: webmaster@herford.freifunk.net
  sslcertificatefile: /etc/ssl/{{ grains['nodename'] }}/public/cert.pem
  sslcertificatekeyfile: /etc/ssl/{{ grains['nodename'] }}/private/privkey.pem
  sslcertificatechainfile: /etc/ssl/{{ grains['nodename'] }}/intermediate.pem
