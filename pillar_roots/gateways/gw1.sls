# Gateway 2

dhcp:
  ipv4:
    routers: 10.34.0.1
    domain_name_servers: 10.34.0.1
    ntp_servers: 10.34.0.1
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:fe4c:84e7
    routers: fe80::a00:27ff:fe4c:84e7
    domain_name_servers: fe80::a00:27ff:fe4c:84e7

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:1; # localhost; freifunk
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.1; # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: 02:42:0a:22:00:01 # Die HW-Adresse ist Freifunk-spezifisch
    address: 10.34.0.1 # User Freifunk-Netzwerk IPv4
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:1 # User Freifunk-Netzwerk IPv6
    address6mask: fdf3:2049:5152::a22:1/64
    netmask6: 48
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: 02:00:0a:22:00:01
  primary:
    interface: eth0 # externes Interface TODO ChangeMe
    address: 1.2.3.4 # TODO ChangeMe
    # address6: # Der Server hat keine IPv6 Adresse

openvpn:
  provider: mullvad_linux # Verschiedene Provider sind moeglich
  mullvad_linux: # Freifunk Herford
    mullvad.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1
      
      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
      rBg=
      =nn6L
      -----END PGP MESSAGE-----
    mullvad.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1
      
      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
      =727/
      -----END PGP MESSAGE-----
  dnn_linux:
    dnn.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2
      
      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
      tnDTm5uL3ew=
      =macr
      -----END PGP MESSAGE-----
    dnn.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2
      
      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
      v75ibt3Q62+zGJm6GNijHbzmHY2W9dY=
      =J4GK
      -----END PGP MESSAGE-----

fastd: # Secret key von gw1 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v1
    
    hQEMA9c3Y0Thoe2fAQf/bUxCwoXTifjYciG7TY0vgRj2vyJvf7oK4ahC3EGh0Ls3
    9kka6YqO7J0NxZfPdYniFTm30DdTeV2HJnivVqRH/K1O7ZooLeyy5Q4VtQKi93ty
    aGzkdyFfpFWzGiWEPIqYfPYwtKwK79O0OpS23fKE1vUIxfK+4xffZ5U4CoIAzMdS
    DEQajmPfpVPkTAOV28yKMNErHbH136iEpc7Q2kV5POSluTelirBV7xnGWIZWZjo6
    nLjp0dtrY76SmiKlOjm2Vhr2Cy/2E4Vkst+kGBLYAWMmbbun1dhINs0mELa3janL
    Ti8GT9ScCVdr56TxDRAfaxhVVyPOhPwzN14J3F2HLdJ1ARPUbN+f2AWCCY0ddOAD
    OV7YpxWrNDeBsHnoIrBHg2kkuYIUcPnNfHQ+Zpz9EylFQnk0FS+SM3wZIAMeZFNF
    4IC5LPrlajkNF7tNTjRf1XXZXQihjCHcUYhOygZ4VOn0JBUgLvCR5CHZ60N8mWL+
    EfvH63RT
    =jdKU
    -----END PGP MESSAGE-----
  public: 4033298711b9a5a9862405486e603db0984812e4abb2d85d74b89ab06626ce99
  fqdn: gw1.herford.freifunk.net
