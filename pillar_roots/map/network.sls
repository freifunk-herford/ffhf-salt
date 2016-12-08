# Netzwerk Konfiguration
# erweitert gateways.shared

network:
  primary:
    interface: enp0s3
    address: 192.168.0.40
    address6: fe80::a00:27ff:fe2b:2015/64
  bridge:
    hwaddress: 02:42:0a:22:00:20
    address: 10.34.0.32
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:32
    address6mask: fdf3:2049:5152::a22:20/64
    netmask6: 48
  mesh:
    hwaddress: 02:00:0a:22:00:20



