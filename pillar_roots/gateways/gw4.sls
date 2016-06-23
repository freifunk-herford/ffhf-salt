# Gateway 4

dhcp:
  ipv4:
    routers: 10.34.0.4
    domain_name_servers: 10.34.0.4
    ntp_servers: 10.34.0.4
  ipv6:
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:4;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.4;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:04
    address: 10.34.0.4
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:4
    address6mask: fdf3:2049:5152::a22:4/64
    netmask6: 48
  mesh:
    hwaddress: 02:42:0a:22:00:04
  primary:
    # Test Daten
    interface: eth0
    address: 192.168.0.192
    address6: fe80::a00:27ff:fe27:f3bc

openvpn:
  provider: mullvad_linux
  mullvad_linux:
    # Test Daten
    mullvad.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      =SyNE
      -----END PGP MESSAGE-----
    mullvad.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      RSDv4LxHPuD8i42aQN93a1g+qiK5m8NS0h/bng==
      =EAzn
      -----END PGP MESSAGE-----

fastd:
  # Test Daten
  secret: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v2

    hQEMAzfCuITl4pqUAQgAp/I+VHUZZSy3zMqf4bUWz5AylTL3Gcm5PJ+DdvYqJRpP
    SSOvqwJE+rZ/T94if0Hqkmmk/IagkeDpj6wJADvBI5N40AZznp1clmWNbH2JkN8/
    EltQrxG2dcBDQVfGqKsr09flgPfObtXBXggPefbjpTGUFqxH5z6KqswWZ9xKWMdF
    It/LavtBiQ/clBQm1T459TAfUucfZfBwBo+472DE/GR7FEpUiiggOsXZgMBy7r5X
    qEJd+AoOCJqfCqaczoOnR7UTf0qGsUvK46R+dv9t5GlPv/2pEgUKj7bHfPCZ1SAV
    rW13SXs47lW0rnoPAWdo1Dg3SJT+lM33HfgyExW/+tJ0AVaBNNneALC8M3WPClnQ
    p0o0iTRcblmX8lPk8apqgZ+TdWIWW+HYgJeySV9Jd+uwUOyqA+lSTUj4xCLuwhha
    ysLnbbREpB/Brjg0dyliG0cF71MJwXOXrdlooMIz11/UnQ5htmJy1iUr16Rks4Ef
    4a5gaEw=
    =w/3W
    -----END PGP MESSAGE-----
  public: 871bde12620761fd7480a27874b572bde730a6a541e1057f7b2caf8bb8277c9a
  fqdn: gw4.digital-nerv.net
