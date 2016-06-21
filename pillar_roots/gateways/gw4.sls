# salt 'gw*' grains.item ip_interfaces
dhcp:
  ipv4:
    routers: 10.34.0.4
    domain_name_servers: 10.34.0.4
  ipv6:
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

# salt 'gw*' grains.get ip_interfaces:enp0s3
network:
  bridge:
    address: 10.34.0.4
    netmask: 255.255.0.0
    address6: fe80::a00:27ff:feee:ec3f
    netmask6: 48
  primary:
    interface: eth0
    address: 192.168.0.192
    address6: fe80::a00:27ff:fe27:f3bc

openvpn:
  provider:
    mullvad_linux:
      key: xxx
      crt: xxx
      ca: xxx
      crl: xxx

fastd:
  secret: 80021d2232b0ad4bb03372cc20758b6e1672b82e932ccd5ccb144f8b400d3c43
  public: 076616d8b4e879f9f11f7d287e06b153347ff710fd31ac5586c028f84cbfd17d
