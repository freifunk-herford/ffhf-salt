# Gateway 4

dhcp:
  ipv4:
    routers: '10.34.0.4'
    domain_name_servers: '10.34.0.4'
    ntp_servers: '10.34.0.4'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:4;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.4;'

network:
  hostname: 'gw4.herford.freifunk.net'
  bridge:
    hwaddress: '02:42:0a:22:00:04'
    address: '10.34.0.4'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:4'
    address6mask: 'fdf3:2049:5152::a22:4/64'
    netmask6: '48'
    # bridge_ports: ''
  mesh:
    hwaddress: '02:00:0a:22:00:04'
  primary:
    interface: 'ens3'
    address: '188.68.32.81'
    # address6: # Der Server hat keine IPv6 Adresse

netfilter:
  tables:
    nat:
      # - '-A POSTROUTING -s 10.34.0.0/16 -o exitVPN -j MASQUERADE'
      # iptables -t nat -D POSTROUTING -s 10.34.0.0/16 -o exitVPN -j MASQUERADE
      - '-N ffrl-nat'
      - '-A POSTROUTING -s 10.34.0.0/16 -o bb+ -j ffrl-nat'
      - '-A ffrl-nat -s 100.64.6.72/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 100.64.6.76/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 100.64.6.78/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 100.64.6.80/31 -o bb+ -j RETURN'
      - '-A ffrl-nat -s 10.34.0.0/16 -o bb+ -j SNAT --to-source 185.66.193.96'
    filter:
      - '-A FORWARD -i hfBR -o bb+ -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu'
      - '-A FORWARD -i bb+ -o hfBR -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu'

exit:
  type: 'openvpn' # Verschiedene Arten sind moeglich "gre" oder "openvpn"
  provider: 'pia_linux' # Verschiedene Provider sind moeglich
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
      address: '100.64.6.73'
      dstaddr: '100.64.6.72'
      endpoint: '185.66.195.0'
      address6: '2a03:2260:0:348::2/64'
    # bb-a.fra3.fra:
    #   interface: 'bb-a.fra3.fra'
    #   netmask: '255.255.255.255'
    #   address: '100.64.6.75'
    #   dstaddr: '100.64.6.74'
    #   endpoint: '185.66.194.0'
    #   address6: '2a03:2260:0:349::2/64'
    bb-a.ix.dus:
      interface: 'bb-a.ix.dus'
      netmask: '255.255.255.255'
      address: '100.64.6.77'
      dstaddr: '100.64.6.76'
      endpoint: '185.66.193.0'
      address6: '2a03:2260:0:34a::2/64'
    bb-b.ak.ber:
      interface: 'bb-b-ak-ber'
      netmask: '255.255.255.255'
      address: '100.64.6.79'
      dstaddr: '100.64.6.78'
      endpoint: '185.66.195.1'
      address6: '2a03:2260:0:34b::2/64'
    # bb-b.fra3.fra:
    #   interface: 'bb-b-fra3-fra'
    #   netmask: '255.255.255.255'
    #   address: '100.64.6.81'
    #   dstaddr: '100.64.6.80'
    #   endpoint: '185.66.194.1'
    #   address6: '2a03:2260:0:34c::2/64'
    bb-b.ix.dus:
      interface: 'bb-b-ix-dus'
      netmask: '255.255.255.255'
      address: '100.64.6.83'
      dstaddr: '100.64.6.82'
      endpoint: '185.66.193.1'
      address6: '2a03:2260:0:34d::2/64'

openssh:
  ssh_auth:
    user:
      root:
        iwo@1337book.localdomain: # Iwo
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCYyi0aw9S+i1Hye5EE9fX9l+VJhxW4RExw/zzxpB2PeECOMRRoZqhNSntkjuGLCKFf3Pdehcj8h3obGIhbut2p2IUzpa3YQi5VMVyVzRLs0roTq47mUYvV1Prcds3ejHRzrSc1skY5Js7goIOHUfNOPtEJj/QUy8typ9pnoqgzAdcIDSGDnnb3tD12zWKQ3v8byJTYfje5vggU6i0W2xwx2+lGpY0uSruTkeShAM0f1Mc1T9JaWjP2YhUs2YLRo0kj3Gd2FU75jktWq8IJDplW+5JTPW7tAJb+jgGlPtOxcopXvUjyj55EDwub3BzDzO67SWIEQIImKgs9PzRa3VpX'
          enc: 'ssh-rsa'

fastd: # Secret key von gw4 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv/Rtpj5BKmhXvBfuqggzUdOb6R7C6IHsRznRBbfZWxwx+o
    6eQvwNInvycAvZN8VFonta923cXaqXVC1BPTTmx5WT5Q5PctDkg1JT2rgKwFq430
    GwQxcRUvntGss8uLCATNROORZ7aOGvpmatsecJUHYhPZr3BbN1emBin5jHUFWzBm
    SZqSi4xeglyysLNzlRsP1MaOQjP10dQR6rMj+2vn/wS9Uwkk5HWfKZ6oTL2NRcGh
    ZGMrBwuXrklfGE/8X/y9QFbubydMgsmm/X2SO8Nhnx7nNB1iKSOf2sqxa8Si8EWO
    vq/8/oGWJ1QKXmOpwMNWCDxdnfE9O6IW0/zSLElF6tNtNRY25XawVeSQQrJxLrxB
    +XGM0N38Tpiyk24shnjG+Rd/Vb0ej9dJTnSGzHFhHTI71fV/gfvaIfXq5klJPNzV
    qBoyllAEAwEum7mtWSGvGEkBdNOcX4TQjpWZTczaGzfUFw+yFEm6MSQrcxxw8Esq
    9rO+8gZIiggfb0pUyMdp0ncBOA2/7Cmov0oBHBKM2eNXxZLW9mME4BWW26WDgGgu
    ENwmoXQeoT/BNW3PiIbTIrEA3vJwgpEqEDHI0uwwbwBz0P5ndA/laZ9Vac1ohYIn
    edqlANk8jk+r1aoqYAMaYRRZEeUHujeMJZ0SFX8BipvTzlWj/yUMMw==
    =SOAM
    -----END PGP MESSAGE-----
  public: 'b8d086b5ad7716968a07006765d791cdd43718dc11b3f3607c1af2df8b2e55a2'
  fqdn: 'gw4.herford.freifunk.net'
