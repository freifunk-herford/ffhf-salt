# Gateway 2

dhcp:
  ipv4:
    routers: 10.34.0.2
    domain_name_servers: 10.34.0.2
    ntp_servers: 10.34.0.2
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:fe4c:84e7
    routers: fe80::a00:27ff:fe4c:84e7
    domain_name_servers: fe80::a00:27ff:fe4c:84e7

bind:
  master: True # Test Daten Dummy DNS Master
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:2;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.2;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:02
    address: 10.34.0.2
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:2
    address6mask: fdf3:2049:5152::a22:2/64
    netmask6: 48
  mesh:
    hwaddress: 02:00:0a:22:00:02
  primary: # Test Daten
    interface: enp0s3
    address: 192.168.0.32
    address6: fe80::a00:27ff:fe4d:cbf6/64

openvpn:
  provider: dnn_linux # mullvad_linux
  mullvad_linux: # Test Daten
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
  dnn_linux:
    dnn.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      eLk=
      =8y96
      -----END PGP MESSAGE-----
    dnn.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      d8bJFZJj+6VbmL7vK226apecYkwbK1h+Rx1fTA==
      =qhp0
      -----END PGP MESSAGE-----

fastd: # Test Daten
  secret: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v2

    hQEMAzfCuITl4pqUAQgAooqUHzwTucZIWBXZxL6gBflMZc6Utv7ersCioDjstH1g
    qI1k8RmFSuvjoFclbeqOSBdpEPQeKZsaptctX4/T+EUA4vMfATDHP8Q+2mUlI3AW
    y2dqukYm9PkL3Ap7WBiyj4Q/7VrbNyAwacv206N0zHffGsH6vyjGXN/25hq4hpXS
    MbbOuLvfmDeQtDMTFAx8WHSoP2qiCmSvh9K+bS/+ScjwnxwMEPWkczzQ5Bv+GnYw
    nZoVcRfjVnW4/IT3oD0IOw1SF9oSSXojGgk9iPWeNHZ3iV2JoqhzrH54yd1m2rrK
    5HDRRLvTjoexag24P2YWBDgu6ICPrZiR9rfxLdIJK9JzARf3hiYnYN/8ERh9ycfI
    2cUYdiL18I5Xkpoq6G2ZLXwa92/aiSfV0kHGNvvIQe+KG3HgpKF7DZvw1mQhxZ7x
    7am9zf3C4/E/oyvbE5LLRLWHiWnCGN0gew/g6UugX0LFMdiGv8yBvS/s1hiOY0Ck
    5TUZrQ==
    =1JcK
    -----END PGP MESSAGE-----
  public: f9165006d55f1eeb2b09b8ae6193700fcd4c297183d373c7d1fa2dfea86e6ffc
  fqdn: gw2.digital-nerv.net
