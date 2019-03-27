# Gateway 7

dhcp:
  ipv4:
    routers: '10.34.0.7'
    domain_name_servers: '10.34.0.7'
    ntp_servers: '10.34.0.7'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:7;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.7;'

network:
  bridge:
    hwaddress: '02:42:0a:22:00:07'
    address: '10.34.0.7'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:7'
    address6mask: 'fdf3:2049:5152::a22:7/64'
    netmask6: '48'
  mesh:
    hwaddress: '02:00:0a:22:00:07'
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

fastd: # Secret key von gw7 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQwAnd9Uy9tOWgTke6HVAAW8Hup3n7fsexbY5W1UawGLeGuV
    9/4aFsWVDTUhcVaaNScNnbRjWquL2jWcMkfsNdb9+obzxYsLPnVqaBZsI2rBbyVk
    MCFQVFDvmEe7qj812Wt2J5kPaor1znLnxoPhbC6yaZQNxnR1kxPI0EmrGvkYmvHH
    GL6RFUkbd62y26e4+UKdLLlH66AOUB3dTVXcav5Kf1y0bvlRHEoQ6eRBClFSJaAX
    9iIelAdbRv7iRh7D6fGsI1JzgET/eLjqdEGktfyBmt4lgy/dmcpS0UHudk/tkBqU
    hz8QJ2EqOpVKgDkgcHaEopnXVbYjUn5Nq/Ui02ktR6M/c/OR93pmcigEufQMeSfy
    wlGbG0YfTc4H/nlwdB+CnluLgwsHVfYNddizlUTjrb47DcuV9pQZqT/6bmFfsWsn
    wmHK4jID9ZPADj6+fv4Xa35VYLO4GX0RSlFNz6ymw5WbO+y4hfWHsZHvRMW02PRD
    fHsirS5HKNU72bThdftQ0nUBhcFR1+fa7wPbtDMHV8k+ey+ZgF7FfBOFq3vFe3tj
    UUq1y4BCZCk/QpyflSB4Qu/6vtJ+dHPLmQWGWV/EpQcWNVsvk6V+OCpMQIicNb7x
    OArehneq4tCS+3vBElKg6WyVn2XTyUhJt/mt1LV60ycZNxEGOnk=
    =MKgm
    -----END PGP MESSAGE-----
  public: '784c99cfa9a1cf2e29ccd5b4b9b239a32820f01e98e8e7c2139e03104657ce00'
  fqdn: 'gw7.herford.freifunk.net'
