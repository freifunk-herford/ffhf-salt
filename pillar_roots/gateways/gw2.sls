# Gateway 2

# salt 'gw*' grains.item ip_interfaces
dhcp:
  ipv4:
    routers: 10.34.0.2
    domain_name_servers: 10.34.0.2
    ntp_servers: 10.34.0.2
  ipv6:
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:fe4c:84e7
    routers: fe80::a00:27ff:fe4c:84e7
    domain_name_servers: fe80::a00:27ff:fe4c:84e7

# salt 'gw*' grains.get ip_interfaces:enp0s3
network:
  bridge:
    hwaddress: 02:42:0a:22:00:02
    address: 10.34.0.2
    netmask: 255.255.0.0
    address6: fe80::a00:27ff:feee:ec3f
    netmask6: 48
  vpn:
    hwaddress: 02:42:0a:22:00:02
  primary:
    interface: enp0s3
    address: 192.168.0.198
    address6: fe80::a00:27ff:fe4c:84e7

openvpn:
  provider: mullvad_linux
  mullvad_linux:
    account: 197993544660
    md5: 5f7a020f2c8e0b8c9faffde6df320b59

fastd:
  secret: 80021d2232b0ad4bb03372cc20758b6e1672b82e932ccd5ccb144f8b400d3c43
  public: 076616d8b4e879f9f11f7d287e06b153347ff710fd31ac5586c028f84cbfd17d
