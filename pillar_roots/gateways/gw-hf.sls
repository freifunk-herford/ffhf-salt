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
    address6mask: 'fdf3:2049:5152::a22:000a/64' # address6mask: 'fdf3:2049:5152::a22:10/64' # ????
    netmask6: '48'
    bridge_ports: 'eth1'
  # mesh:
  #   hwaddress: '02:00:0a:22:00:0a'
  primary:
    interface: 'eth1'
    address: '78.94.9.77'
    # netmask: 255.255.255.248
    # network: 78.94.9.72
    # broadcast: 78.94.9.79
    # gateway: 78.94.9.73
    # address6: # Der Server hat keine IPv6 Adresse

netfilter:
  tables:
    nat:
      - '-A POSTROUTING -s 10.34.0.0/16 -o bb+ -j ffrl-nat'
      - '-A ffrl-nat -s 100.64.4.204/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 100.64.4.206/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 100.64.4.208/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 100.64.4.210/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 10.34.0.0/16 -o bb+ -j SNAT --to-source 185.66.193.96'
    filter:
      - '-A FORWARD -i hfBR -o bb+ -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu'
      - '-A FORWARD -i bb+ -o hfBR -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu'

exit:
  type: 'gre' # Verschiedene Arten sind moeglich "gre" oder "openvpn"
  provider: 'ffrl' # Verschiedene Provider sind moeglich
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
  ffrl: # Freifunk Rheinland Backbone
    bb-a.ak.ber:
      interface: 'bb-a-ak-ber'
      netmask: '255.255.255.255'
      address: '100.64.4.205'
      dstaddr: '100.64.4.204'
      endpoint: '185.66.195.0'
      address6: '2a03:2260:0:a9::2/64'
    # bb-a.fra3.fra:
    #   interface: 'bb-a-fra3-fra'
    #   netmask: '255.255.255.255'
    #   address: '100.64.2.61'
    #   dstaddr: '100.64.2.60'
    #   endpoint: '185.66.194.0'
    #   address6: '2a03:2260:0:126::2/64'
    bb-a.ix.dus:
      interface: 'bb-a-ix-dus'
      netmask: '255.255.255.255'
      address: '100.64.4.207'
      dstaddr: '100.64.4.206'
      endpoint: '185.66.193.0'
      address6: '2a03:2260:0:aa::2/64'
    bb-b.ak.ber:
      interface: 'bb-b-ak-ber'
      netmask: '255.255.255.255'
      address: '100.64.4.209'
      dstaddr: '100.64.4.208'
      endpoint: '185.66.195.1'
      address6: '2a03:2260:0:ab::2/64'
    # bb-b.fra3.fra:
    #   interface: 'bb-b-fra3-fra'
    #   netmask: '255.255.255.255'
    #   address: '100.64.2.59'
    #   dstaddr: '100.64.2.58'
    #   endpoint: '185.66.194.1'
    #   address6: '2a03:2260:0:127::2/64'
    bb-b.ix.dus:
      interface: 'bb-b-ix-dus'
      netmask: '255.255.255.255'
      address: '100.64.4.211'
      dstaddr: '100.64.4.210'
      endpoint: '185.66.193.1'
      address6: '2a03:2260:0:ac::2/64'

openssh:
  ssh_auth:
    user:
      root:
        felixannen@web.de: # Felix
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDTPilqWfeYXAz3+MtQvVTrxXtLxyWoQdEDtyFkUVONNlqZ0yZfsKlFbuf10JME5y+Hd9THgiB5xh0Ir8fUJVN6JMCvdaaG293L7VK8tlyogcKbGN3aOdDmI3AsDK1ir4F1ZsbiZr/xcypXdWKCWsqgj2QaOS27oJFYCBlyTmdazPxEP/7BkZvDiFaU08kJuESwtCedvmT1BRNrsm73qsnlxsMI9SIg+tba+GPyQ97G7W864w5iimloNtIuETfIvEFjEZczWBEuLb2+kNkSWjgCguacp6iRyO0+Ho0H7YiLc/xGaCqvyDwNvIuXWfNzcYJcjQQbAxb9Vtu3Dc2Qlaib'
          enc: 'ssh-rsa'
