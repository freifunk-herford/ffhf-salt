# salt 'gw*' grains.item ip_interfaces
dhcp:
  ipv4:
    routers: 192.168.0.195
    domain_name_servers: 192.168.0.195
  ipv6:
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

# salt 'gw*' grains.get ip_interfaces:enp0s3
network:
  bridge:
    ipv4:
      address: 192.168.33.103
      netmask: 255.255.0.0
    ipv6:
      address: fe80::a00:27ff:feee:ec3f
      netmask: 48
