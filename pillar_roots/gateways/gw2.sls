# Gateway 2

dhcp:
  ipv4:
    routers: '10.34.0.2'
    domain_name_servers: '10.34.0.2'
    ntp_servers: '10.34.0.2'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:fe4c:84e7'
    routers: 'fe80::a00:27ff:fe4c:84e7'
    domain_name_servers: 'fe80::a00:27ff:fe4c:84e7'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:2;' # localhost; freifunk
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.2;' # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: '02:42:0a:22:00:02' # Die HW-Adresse ist Freifunk-spezifisch
    address: '10.34.0.2' # User Freifunk-Netzwerk IPv4
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:2' # User Freifunk-Netzwerk IPv6
    address6mask: 'fdf3:2049:5152::a22:2/64'
    netmask6: '48'
    # bridge_ports: ''
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: '02:00:0a:22:00:02'
  primary:
    interface: 'ens3'
    address: '37.120.186.226'
    # address6: '2a03:4000:f:621::/64'

netfilter:
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

fastd: # Secret key von gw2 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv/cHtn/CWovD5MTfDtymjY3giDZasxgK2Ak0VrqfZz49JZ
    wrSNePf0HReyaZVvBxpmOZcqwEUbyEJOQPomH4Y4HDtoWDyyUU/7JRG5GHwlXRD7
    NRbtpAmGJ23Kb/ALtyOW6Y6poKb6Vy9OTcqVAASEjoeICXQeMbfTx1z+lQ8Lnt7U
    kv7xTaHc6183EZlMpeEscTBfkvFzR4lrnNBpmNcoJIr22b6yJYcjmJc5sBfGLY0p
    gcBquFJhopeI3qRnaVYhDpGF/1ZFDB0Au91EN1GuHHy5v2UvmseGXJmJmWXyI+Gk
    HruCvmN7PmJDGDImHLSboe+XzSk+TA1uGHFx6OM+363SWmq23ZjF/mU5GGQox/yu
    s71tz8sdiXXt+mkLNRAGUYfVUOdl88WXH+xMXiv7RDkfkEqxCox7Gk0hubugacfF
    RzEmKQkDTMf3KloczbxZ9/RlpsVx9mvkJgXYgEWJbAOC+ovl8htpjL6gfEEtZU0E
    E27darfbBshRpgZbGTcq0nMBc2lcLCrkql0acKhgiKVWWTCKQgccQA3xHYoSVbU5
    96du65oZA+Rb0FJmdPRUhSO19IfMsoHgWGcbXy7vpnO90MHncTjIIh83hu6bq9+H
    KFk7OIJ+CGEa3nfinaxPmRkF9ZWXT+T/VGVUy/wr8/G9se0V
    =Acwb
    -----END PGP MESSAGE-----
  public: '4033298711b9a5a9862405486e603db0984812e4abb2d85d74b89ab06626ce99'
  fqdn: 'gw2.herford.freifunk.net'
