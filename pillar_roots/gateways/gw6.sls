# Gateway 6

dhcp:
  ipv4:
    routers: '10.34.0.6'
    domain_name_servers: '10.34.0.6'
    ntp_servers: '10.34.0.6'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:6;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.6;'

network:
  bridge:
    hwaddress: '02:42:0a:22:00:06'
    address: '10.34.0.6'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:6'
    address6mask: 'fdf3:2049:5152::a22:6/64'
    netmask6: '48'
  mesh:
    hwaddress: '02:00:0a:22:00:06'
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

fastd: # Secret key von gw6 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv/YwNRpbzE57Un4NAfGEUZzRw5fuNq0F/MaZxHf5enSDtt
    0mrRcl5mMn/ILqZodicj1408H503lzF5NoTojFBNY8YLyD9ipJgDNw1sao8w3/7C
    w5hQVT7ySUvnFtCHVWzH7KH0cXtNBTDjjaVhyRwavqccGVdejPbUwPYkN/JbeAY0
    gh148NSgBa83s3/LHGM4B8P2Lf0pDWQe01X4hgsUYBKfryZckEHaGen+3frhuS10
    G/1Re/JUhDNGvC494rZ3mpWvLmjxaqfSl30lmQ9lPVHjFGWIi1mUBC2GU4xNfxF2
    m9FLiq6vX4PnMdWTUTd2Qv8tbVXpSip8OanYY2GBiIV2/gVOpzwy2GqB2T+cwD6H
    nZeC3eRQ+nDjxmJ8jY4wrs907EoNwY1gYI99QuLfnK7jFnG9rVVUa7llzZ1DKtOG
    ZzLmMQ5GDs054jvQTrtKjVvvVVznG0UOBG4Nmn8ij/HU8yqgCQQ8WypOSDdqzUYE
    HEyVPA7AXXTpIAnFERxF0nQBboT6Ayb6iBiKHiBk/QuhdkuJzUG0L9lPa4kdyn/i
    0j7AwXFiBe50p/gOB/UhBV2fx5xWVKE3QbOTrKTsF/J37rTpQdmwo7b1Gaaz6UZA
    qwB3YS0JPbCbidBcdU4oH55oknNqImMbRGH+eoY0eUOALE1NfQ==
    =Tkkv
    -----END PGP MESSAGE-----
  public: '294e0a87b9700e4a3cde011a24c2839be243406b8b18818729b591e73e70fc1a'
  fqdn: 'gw6.herford.freifunk.net'
