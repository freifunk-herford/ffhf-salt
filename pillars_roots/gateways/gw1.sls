# salt 'gw*' grains.item ip_interfaces
dhcp:
  ipv4:
    routers: 192.168.0.157
    domain_name_servers: 192.168.0.157
  ipv6:
    subnet: fe80::a00::/64
    name_servers: fe80::a00:27ff:fe79:5277
    routers: fe80::a00:27ff:fe79:5277
    domain_name_servers: fe80::a00:27ff:fe79:5277

# salt 'gw*' grains.get ip_interfaces:enp0s3
network:
  bridge:
    ipv4:
      address: 192.168.0.157
      netmask: 255.255.0.0
    ipv6:
      address: fe80::a00:27ff:feee:ec3f
      netmask: 48
