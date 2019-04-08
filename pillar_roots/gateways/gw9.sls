# Gateway 9

dhcp:
  ipv4:
    routers: '10.34.0.9'
    domain_name_servers: '10.34.0.9'
    ntp_servers: '10.34.0.9'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:9;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.9;'

network:
  bridge:
    hwaddress: '02:42:0a:22:00:09'
    address: '10.34.0.9'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:9'
    address6mask: 'fdf3:2049:5152::a22:9/64'
    netmask6: '48'
  mesh:
    hwaddress: '02:00:0a:22:00:09'
  primary: # Test Daten
    interface: 'vnet0'
    address: '127.0.0.1'
    # address6: # Der Server hat keine IPv6 Adresse

iptables:
  tables:
    nat:
      - '-A POSTROUTING -s 10.34.0.0/16 -o exitVPN -j MASQUERADE'

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

fastd: # Secret key von gw9 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv/XqsC3OaV5Y6GOPwAZv1Eq2Csmy5+yylT1QdqDjBVZ3jb
    gvTa27LY2kTxyww7QSy42BvXgZzDAR2usMvv1yAPwj+pJBoXTPf3WgIkrrgIziPU
    bSGtf3xEeQATwAtjzp6AtavIFeXhFaAkExubvDMSTe8KiLkE0jCq1P/Q4VIPiRIA
    +KuCa0VUoz1R5d4f2cOifKplPVoRoY5sVSdViQ4uhIKmZBebhkSQYkADdJwtId+s
    ZThjVANYMAGGSuCTyYLf/shL06bJ//1fWhY4OTUXtB1Rngu7b3DjrNLyCZROyOmx
    E392++DrqaurnmFFik1YCCd51/JSqPNCtCuQz+MocxT9h/vCGZJNvKlDIJZrszgL
    kvuLS4ZUKK8OEznX3Ouvujpg+YHkr7YjIeZ4z6FPlSDYz4w1Asqmd+Tm/jh0qqM1
    AcvNHbHYGq2Ji09UttiZ7mwWgYFzBN0KQG35HApH2Y1CGLGxnetZafbxlaC2I5Yj
    mrkCmiNm0MXZtQLE8FIw0nYB3ZuY8iK7QR7QuLfxlk/HjL3moljlW9piJ8cUXwSR
    RQXTBI4fwRppzZRHQITzSSxH1Bkqo+MibnOAMJQfUSzSHUKLBQWtCpWr/aXFuPEh
    YxmYeiP/AvvZArGD2YtLFFh3TCT1zzxZCpVQtEgX82JaHjDZIap3
    =1yBx
    -----END PGP MESSAGE-----
  public: '6f8299c6008f2f80f4c4bc57e5ebff6fdd3115e5e652bc0bd2ce1ac06369a7ee'
  fqdn: 'gw9.herford.freifunk.net'
