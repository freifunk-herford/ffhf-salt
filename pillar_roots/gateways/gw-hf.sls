# Gateway Herford

dhcp:
  ipv4:
    routers: '10.34.0.10'
    domain_name_servers: '10.34.0.10'
    ntp_servers: '10.34.0.10'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:10;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.10;'

network:
  bridge:
    hwaddress: '02:42:0a:22:00:0a'
    address: '10.34.0.10'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:10'
    address6mask: 'fdf3:2049:5152::a22:10/64'
    netmask6: '48'
  # mesh:
  #   hwaddress: '02:00:0a:22:00:0a'
  primary: # Test Daten
    interface: 'eth1'
    address: '78.94.9.77'
    # address6: # Der Server hat keine IPv6 Adresse

exit:
  type: 'gre' # Verschiedene Arten sind moeglich "gre" oder "openvpn"
  provider: 'ffrl' # Verschiedene Provider sind moeglich
  ffrl:
