# Gateway 8

dhcp:
  ipv4:
    routers: '10.34.0.8'
    domain_name_servers: '10.34.0.8'
    ntp_servers: '10.34.0.8'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:8;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.8;'

network:
  bridge:
    hwaddress: '02:42:0a:22:00:08'
    address: '10.34.0.8'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:8'
    address6mask: 'fdf3:2049:5152::a22:8/64'
    netmask6: '48'
  mesh:
    hwaddress: '02:00:0a:22:00:08'
  primary: # Test Daten
    interface: 'vnet0'
    address: '127.0.0.1'
    # address6: # Der Server hat keine IPv6 Adresse

netfilter:
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

fastd: # Secret key von gw8 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv+NiRA7MoKqUSCacG+Ju3bv2R3aQDvpNwOCglwrrGS5lOK
    IbhONYZqQue/jnxbNZ/JXhKdo4FCWkQlGRm/w0FUHAMo+UDW9HsOf5l0s/+awvLg
    WSKlaAiyIpmlQHWXzPhk0rw4hiKUQdxXTO3OWBX8Okbow0itnPvBc7rM+hqzWCGj
    wAWE5Y6l0zUggvWOxOhxdzWxU011ir5dvP1wnnVGJyNQuMCwBGFmgc1NYCUYREEh
    HNUc99Z5JBNBVuHZ7Eb/1izA15itKpptXzkzcNuiX6OBCVoq/mi33grpXuEn9qGL
    hrnaq7Xqhg5D/7MoVJXlu3tNWQU8q4dwCemWZBhDmWnjqR52V4kBYFh7XDOO4RUG
    3wF1Y4Zr0Bz9QMHOcx4TBCzfRNdqB7vZQxFEyw8pCOqRNtcM9fcRNJcenHP1DKdo
    7C56ZFy2maY17rYTVWEkiJgiRbGEXW3pRGZmINgr5EsSoPdhhcTkcZeQ5xaAb2rd
    kdG9ywwvWDMJKUI/uWoy0nYBDfiR75csoyR69cqbU5hfnAEdpbCfkj7qxK0Nc6Xg
    mIW9DGkWPz6jkJJVNDpYTHgKwfNjczRAtyudyVZ4d1qJfg2H6LkAoBA70mpaRHXC
    QrcelD3Re8NcPEpUZzQdeRD3+sM5+dpnoo6YUHE3RsbvLbXfhjN4
    =0RBf
    -----END PGP MESSAGE-----
  public: '7d9372d44ba889f460ecb300c06aa7b31c69fd2e6a93e4d826b63c7bbbd9fb55'
  fqdn: 'gw8.herford.freifunk.net'
