# Gateway 3

dhcp:
  ipv4:
    routers: '10.34.0.3'
    domain_name_servers: '10.34.0.3'
    ntp_servers: '10.34.0.3'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::10a4:20ff:feb1:c3da/64'
    routers: 'fe80::10a4:20ff:feb1:c3da/64'
    domain_name_servers: 'fe80::10a4:20ff:feb1:c3da/64'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:3;' # localhost; freifunk
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.3;' # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: '02:42:0a:22:00:03' # Die HW-Adresse ist Freifunk-spezifisch
    address: '10.34.0.3' # User Freifunk-Netzwerk IPv4
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:3' # User Freifunk-Netzwerk IPv6
    address6mask: 'fdf3:2049:5152::a22:3/64'
    netmask6: '48'
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: '02:00:0a:22:00:03'
  primary:
    interface: 'eth0'
    address: '89.163.130.241'
    # address6: # Der Server hat keine IPv6 Adresse

iptables:
  tables:
    nat:
      - '-A POSTROUTING -s 10.34.0.0/16 -o exitVPN -j MASQUERADE'

exit:
  type: 'openvpn' # Verschiedene Arten sind moeglich "gre" oder "openvpn"
  provider: 'mullvad_linux' # Verschiedene Provider sind moeglich
  pia_linux: # Private Internet Access Luca
    pia_userpass.txt: |
      -----BEGIN PGP MESSAGE-----

      hQGMAy+gZA9xYWKnAQv/fDwi5gGKP+lhiubBS4c80oVEn5Ap2acHhTuSOrABs5ar
      0bYDoiw2wvvf2IGzNurgtVBP3yLkiUYnaDg2r2fEbMArU/2uGVCMuwcBt8R4TWsb
      JjrhLQqxbgilh6jrdlJwCi26rfWL5dVF3Trr8UwT5ciOsXs4naAJ8NFFPV9BmtPz
      dlnX2E5cE8HmN0QafZZbgod9w/oVVKZ3sF2feR4lgeFQZ0RNiq6btoGJ1KXZH8oJ
      Nf5z/mCIPJ4+2c7g/l/SFGFjpB3z0yA3a+RjHzpcVTLwl3gfvOFCFcXkfSLGE5wQ
      yoSqHpn4Flno8tQSyqz2w97YP8SBNso5BfxsLYsGa07NRP+DVQkW8r1NnjxvJIAg
      0W0dbmxxuIAwTg8sdMSoJIZv5/xh+3OpR81unujrgbUguK+BSPvMHF5muT6qaP1c
      BMjSNJCtAfj7ORrp6l8Nu4gzuEQGamBZ5amEtOic1PpTWcVQKdOyTSltZFfODZrV
      HDM88WCFZAp0w1JMzfr10k8B0EWsSJ8tSfl4MCnVj2MiDGMEx4EojQHID6VBXnX/
      +YVbXinEzd5V55e+xQROu5vIqx8VsmXDIxprAwnID6W8n1ihNg2qxAq+TMsVR6UG
      =l8yR
      -----END PGP MESSAGE-----
  mullvad_linux: # Mullvad Freifunk Herford
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
  public: '6b9c2bbe6b90fef3c8046c8551a0681a8b3bf24c8fd9e87d12dd1bdcf2f38d1c'
  fqdn: 'gw3.herford.freifunk.net'
