dhcp:
  # salt 'gw*' grains.item ip_interfaces
  interfaces: enp0s8
  ipv4:
    routers: 192.168.0.198
    domain_name_servers: 192.168.0.198
  ipv6:
    subnet: fe80::a00:27ff::/64
    name_servers: fe80::a00:27ff:fe4c:84e7
    routers: fe80::a00:27ff:fe4c:84e7
    domain_name_servers: fe80::a00:27ff:fe4c:84e7

network:
  # salt 'gw*' grains.get ip_interfaces:enp0s3
  interface: enp0s8
  ipaddr: 192.168.33.102
