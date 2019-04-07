# Gateway 5

dhcp:
  ipv4:
    routers: '10.34.0.5'
    domain_name_servers: '10.34.0.5'
    ntp_servers: '10.34.0.5'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:5;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.5;'

network:
  bridge:
    hwaddress: '02:42:0a:22:00:05'
    address: '10.34.0.5'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:5'
    address6mask: 'fdf3:2049:5152::a22:5/64'
    netmask6: '48'
  mesh:
    hwaddress: '02:00:0a:22:00:05'
  primary:
    interface: 'ens3'
    address: '188.68.40.226'
    # address6: '2a03:4000:17:6dc::/64'

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

openssh:
  ssh_auth:
    user:
      root:
        lmb@lmb-nb:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1RXq+yTsKtt8brNQLRH51TAdC2CxiSi2JsJJtw47b9hFdWhDlEOoMqQI0XqCBKHevhmtt7nc3k6vOX9yiC078Tz5hauQBTcMWbo+xSH1AxFlVo2pmPjL/N/9EritIe/4tJD3cIWSuGzjR69cyAQcCWshpivTV85xbpsiZS5ljKC4+TgAGC3jbSBGGMfoeb1MqWaMcuttcKXO2GFOOLxFYv2QVdOpQNf6S0Y992WLsBQ3BS0E6HTBCj/AXdt/x7eK25BpdAzrahCJw7Ytklmus6Fsi1LbJlaYBnKoRxwwpizbK7SHQ16Zca6NzsrI3H8c6SvPAj7p3lW88WntasoK9'
          enc: 'ssh-rsa'

fastd: # Secret key von gw5 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQwAhF9s1LL70287OAJALMDj0frxXkNagIMSABx2HecLwF0/
    GGW0VEq/vZNKlp/9Lep4mHcQyPJk4RpiDtYrOqeeVj/6WCErBT7QX0cD/eiQuqsz
    cnL/hDdltXw070KdIdmxs7uTXzyZg5mrbciNccGrKx+f46NRnIMW7ngZmdGK+P+5
    NMhwcE66+dXjZ6H9eJxcua/Cg3HG5c1cLwdlilr+BtwVOcNtw6+h0omJNuhv7C6k
    oJB3uxv+3+9KQGTht7wBGmQbdPu29NS17dpBEgCNRHDOR9je3ocKen1eaeKm6qa7
    +v/O/5cWLVXoEoSEi29b/8igY3fJ4FqaXsUL5oyvalnhNDZpcgowVIPbLJdrdEtF
    h85Ecshw+fSaN6C/hMl14X3QwZLnFwZNRcdoDJqGIEepG9P9j/7uMMuFjvwEO6TH
    91FzHLv7bPsPTBR3tzRS0GzODVov1bDBAqe0ILh+D5M0cgHZ5HjvjSRUm7muJJ3u
    T0obTd8Zo1PDvSrP6FVs0nYBWfjRtU0frflNg7n/VzfaAoOpiWCi7lIE1Qgo7AFe
    a4RL1c4GzOXtztafx9LHIrDkww30kapcVW3+C9FBUjVVEJNj/xWMIp+jHdQ88Rhh
    Tw1z9wqbnTgoNa3ErL3SaSeWcT30jxsiceUmYlphQXJFDisJbCeA
    =MOID
    -----END PGP MESSAGE-----
  public: '081fdcf3e03976dcc340372ac1692b2fcd2de89f2d00db738078ea6ff2e13213'
  fqdn: 'gw5.herford.freifunk.net'
