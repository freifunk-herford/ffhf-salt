# Gateway 10

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
    address6mask: 'fdf3:2049:5152::a22:10/64'
    netmask6: '48'
  mesh:
    hwaddress: '02:00:0a:22:00:0a'
  primary: # Test Daten
    interface: 'vnet0'
    address: '127.0.0.1'
    # address6: # Der Server hat keine IPv6 Adresse

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

fastd: # Secret key von gw10 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQwAjxLTKu+bEk1WJeLfy7f/UxtVJv3rYGr2IJG61zSOv8g+
    eEnTzI9D8nJOulppwB/spehl4OalzPZFrrd5hfNwBCF/j1ZrlhyR6ODCbqEvO6x3
    s1PpI0cZttwTFw7En9UYcgBkZvg1FMVFhWaiUdgK1Rf2xpaAkE3phGYHGTrMV+63
    NOwSi9u7IZnP1FIo5YnSkVOmZdgYfHoh4NwBQcTNwyHzHmBr+J4ZVPnw5bx7jf74
    KQyP5qUr+r4JeOdV9SaT49W+WANYqFaDBQXmFlwdKcRFRnqXIaAN54TGMJcYoQvq
    oBntJIW/IeXEmcyZP80/LH/D03BRjKqvkY0UxWf5fpz3YiCrUXhQQeLey9D9iCru
    ahm00isfV40L3CI++xAOzJskH82Sk2pgKIJe5UnI+CZoZveZ9DPnyEgawuyzYnfH
    QiPwPINcYnGjDBto8xC488z+jiMoIyeGr84y+VlEDDgCV6r+AGC3XKs6eMCKuaam
    4QTu/SNH0nvpuW22o6rf0nYBJldxDdFjpRvTNg75fWQmafJfajQj1NFIp7CE09zY
    N7HDq5ZzwlYm68oLRydAL1G7MlsTOMDb1Je25GyrKm+X9u1P/r4AFqsle0x/plW0
    0HjMUJ2zCsyLXHlMNbAudK+bayXV/JkCzFInbM3T3yBu1UevSoHP
    =uK6A
    -----END PGP MESSAGE-----
  public: 'd7ae822740c53808661fb6f22baaa5fab046f1a77b72ed5f271701eaae0f34e3'
  fqdn: 'gw10.herford.freifunk.net'
