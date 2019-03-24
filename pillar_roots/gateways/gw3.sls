# Gateway 3

dhcp:
  ipv4:
    routers: 10.34.0.3
    domain_name_servers: 10.34.0.3
    ntp_servers: 10.34.0.3
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::10a4:20ff:feb1:c3da/64
    routers: fe80::10a4:20ff:feb1:c3da/64
    domain_name_servers: fe80::10a4:20ff:feb1:c3da/64

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:3; # localhost; freifunk
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.3; # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: 02:42:0a:22:00:03 # Die HW-Adresse ist Freifunk-spezifisch
    address: 10.34.0.3 # User Freifunk-Netzwerk IPv4
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:3 # User Freifunk-Netzwerk IPv6
    address6mask: fdf3:2049:5152::a22:3/64
    netmask6: 48
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: 02:00:0a:22:00:03
  primary:
    interface: eth0
    address: 89.163.130.241
    address6: 2001:4ba0:fff4:9b::4/64

exit:
  type: openvpn # Verschiedene Arten sind möglich "gre" oder "openvpn"
  provider: mullvad_linux # Verschiedene Provider sind moeglich
  mullvad_linux: # Freifunk Herford
    mullvad_userpass.txt: |
      -----BEGIN PGP MESSAGE-----

      hQGMAy+gZA9xYWKnAQwAiKgEOYnMwgBxnDqOSFJnRAtA5IKT6V3YDFKYGHsS+mUD
      wlKDIgCgzBufXzCv1QAmTgT52brx8IuRPd8/lxqM3cWimkqy3acbLTv3eFdM+p+c
      fjBj17nHjMbrIlthgHDqs/xPaMD3Q3OIk1Lkka1eLOE6YDVcX3mFWPmVc0DUuDpd
      8czlHoMoBOXcBaFSjiOkQkUXgitLiAmaQKNeERirWnDxU6kzT7euCbSGjRydlPkY
      mtf0UM+v4juCUXBl6Ft6Dth5okJ6q/mbhH878pjiQj3jzzS3v9KgaZOWK5E6nLV6
      kR3eeVAnTVu2i4iSvG8YzZrackGSVBZQfWEovaR5JpDpSldbPvijuiquGHujjC/j
      jqdDvvEtyYspNtNJJzuSmroCF1D7TzfZFGBf48ofBUab0rg29ajk69N3CalDDrKj
      dXjgRdN0tlxWKszzsqXSnYXFtWw9T7mI0ItMCrS/bHTstSe5P474PCq38WuyYnN2
      NuzULNesqSwTEtTzCyFU0ksBC4+Xx8CAFnH0QpAWiSI+O/igZAC+Cx4eY8GODE8C
      +gDOv/i/boSUF3yHBEhVlv6BGOQAHu5CDkhjXFNqeVUdbFS/Ru1FVL+wj3Q=
      =HKyn
      -----END PGP MESSAGE-----
    mullvad.crt: |
      -----BEGIN PGP MESSAGE-----

      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
      =evYW
      -----END PGP MESSAGE-----
    mullvad.key: |
      -----BEGIN PGP MESSAGE-----

      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
      xYs84OWU01/4+OJY/epNTQ==
      =gnXv
      -----END PGP MESSAGE-----
  dnn_linux:
    dnn.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      =8Rrg
      -----END PGP MESSAGE-----
    dnn.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      riHFFpDMQzZaYHyMJOMD6vqQ/59WWuEfXsVKdQ==
      =iuKd
      -----END PGP MESSAGE-----

fastd: # Secret key von gw3 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv9Efr2inW0VGsM8hlNQ07vRm7oJgnFIVhlxlGwK0XNEabm
    xT9zCvw4VW8hIOT4I+krOBeQMkUx7u4LFd6ok/aFxRS62/SpdUxbyyrgyNxA3jlJ
    OHGC4vVGLb0pwRRqJmDd1rP3tEog/OcyFJOIluxqadoeFcgM9NSkVRzSNO01P5L2
    CI8KIgOHNVICcLTMOKLWAf88oNChVxwbIGix+hugMK6gTlLfE9NJZnmtYdQLJMS7
    5p6+GmZVgOZFROSwWE/+Mdhx3l4vY+kUVOqaC77aky1703M3l8COOpeXGaE+fwgJ
    oZ2O9RvJVKyBMMcKOuU5YYmoOXLdUbhIpfgU8fIP1LIupDDfaxcI0Tvy+UIFHn9T
    Q8l7aDvjKfgSKt8CkI1AbGa4dNKW9y+ygsYiR5Hn/Jq3OpTE6LBYUwhkoh+93PjU
    ge0mJSG0sJBvkzP75PKsyu7mkM12o1i0S36VRo8yEIMAxaD1TwCMuPbb6BoGoMOL
    lJj1t/LBc9aZ9bb8Qs180nMBE22S74j/BjOfwjbh85jmWXERN6HHRw+kIpDovLGV
    OVQZvc9f5AK2FqX4Q4LEQ60FWUL3yQYs7acCA0IBOTcE5SJByvcb+QM9GNd6bNiI
    XU8B8ly7nLfAX1ArwMSrnx0BamHv9ogkzgLa0XmT09yj8TLZ
    =aiYB
    -----END PGP MESSAGE-----
  public: 6b9c2bbe6b90fef3c8046c8551a0681a8b3bf24c8fd9e87d12dd1bdcf2f38d1c
  fqdn: gw3.herford.freifunk.net
