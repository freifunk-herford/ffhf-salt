# Gateway 3

dhcp:
  ipv4:
    routers: 10.34.0.3
    domain_name_servers: 10.34.0.3
    ntp_servers: 10.34.0.3
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:3;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.3;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:03
    address: 10.34.0.3
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:3
    address6mask: fdf3:2049:5152::a22:3/64
    netmask6: 48
  mesh:
    hwaddress: 02:42:0a:22:00:03
  primary: # Test Daten
    interface: eth0
    address: 192.168.0.33
    address6: fe80::a00:27ff:fe7f:b562/64

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
      =7CWE
      -----END PGP MESSAGE-----
    dnn.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      Z7kbizWhd5m9UoPxqcg8sNsOqJcX5Mr3rm8u
      =I67A
      -----END PGP MESSAGE-----

fastd: # Test Daten
  secret: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v2

    hQEMAzfCuITl4pqUAQgAq3EjffYcbEcVPi1guMCAYn5HpOgCnAFG0gDcVgLHdjH5
    Pwl1m1w28I8FLpp+nr1Jpke7Ntg3zPhi1HNWp2BFmE3ZDV74G/eNWptzsRFvn27g
    4nPinYahQ4hbwhb8KMk+hQyH2LrVHB/XnxBp6qCMQUqvcX3e1nSbK8RNrMdwPZOc
    Cs1FUZqXr5M73bfkIw1W73bnCDAC0wrZ5LXitoMROUQ7PyPflUT6jYWpwzEjIh2h
    pbrs750KZcZN4ORfLyvK9cIfUvwIbuOeWthot15RnwgNIWO6kl+XO81lK9XTg6lY
    qrDU7uUlX4Fw6MqiVuooT/j86Xmw38Fn1/Sest2V/tJzAYXu+PrBsExSRx1M0opw
    KRN6j9yYEdGZiUHVGCELt2O0u9o605qaaYuqRhQHBAtd7bh93AS7qmSVJW8ioLof
    S3vCx3RsMJDAPQd39pvhIxXYO2HrPsM/muaLUrJTYV4GvY7vmFONz9725q/vAaTS
    Vjm8fg==
    =ckXZ
    -----END PGP MESSAGE-----
  public: 0796825163e27fdeeb4d2e66cdb8bb7dc81ad8ad5dd5e400a6ee0cc6204884e9
  fqdn: gw3.digital-nerv.net
