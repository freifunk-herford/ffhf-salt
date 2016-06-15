dhcp:
  # salt 'gw*' grains.item ip_interfaces
  interfaces: enp0s8
  ipv4:
    routers: 192.168.0.157
    domain_name_servers: 192.168.0.157
  ipv6:
    subnet: fe80::a00:27ff::/64
    name_servers: fe80::a00:27ff:fe79:5277
    routers: fe80::a00:27ff:fe79:5277
    domain_name_servers: fe80::a00:27ff:fe79:5277

network:
  # salt 'gw*' grains.get ip_interfaces:enp0s3
  interface: enp0s8
  ipaddr: 192.168.33.101
