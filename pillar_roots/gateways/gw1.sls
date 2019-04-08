# Gateway 1

dhcp:
  ipv4:
    routers: '10.34.0.1'
    domain_name_servers: '10.34.0.1'
    ntp_servers: '10.34.0.1'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:fe4c:84e7'
    routers: 'fe80::a00:27ff:fe4c:84e7'
    domain_name_servers: 'fe80::a00:27ff:fe4c:84e7'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:1;' # localhost; freifunk
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.1;' # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: '02:42:0a:22:00:01' # Die HW-Adresse ist Freifunk-spezifisch
    address: '10.34.0.1' # User Freifunk-Netzwerk IPv4
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:1' # User Freifunk-Netzwerk IPv6
    address6mask: 'fdf3:2049:5152::a22:1/64'
    netmask6: '48'
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: '02:00:0a:22:00:01'
  primary:
    interface: 'ens3'
    address: '185.162.249.190'
    # address6: '2a03:4000:1a:6e0::/64'

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

openssh:
  ssh_auth:
    user:
      root:
        lmb@lmb-nb:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1RXq+yTsKtt8brNQLRH51TAdC2CxiSi2JsJJtw47b9hFdWhDlEOoMqQI0XqCBKHevhmtt7nc3k6vOX9yiC078Tz5hauQBTcMWbo+xSH1AxFlVo2pmPjL/N/9EritIe/4tJD3cIWSuGzjR69cyAQcCWshpivTV85xbpsiZS5ljKC4+TgAGC3jbSBGGMfoeb1MqWaMcuttcKXO2GFOOLxFYv2QVdOpQNf6S0Y992WLsBQ3BS0E6HTBCj/AXdt/x7eK25BpdAzrahCJw7Ytklmus6Fsi1LbJlaYBnKoRxwwpizbK7SHQ16Zca6NzsrI3H8c6SvPAj7p3lW88WntasoK9'
          enc: 'ssh-rsa'

fastd: # Secret key von gw1 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv/QEfl3lsOuHVAq2HcVdfFTFWLKsxqrQTgk4cWSrMjxMK9
    4xs9O18SPj8COyDTm4OAYnB6yjqKjH1Y050P5loj1FkqF/+C+NBdJGgDGK86HZHZ
    acYI1R1aK0wbbMSWARjh3D958cji6wBH8M3CN/wkaaZfH5KWoTLhaX6v0ARTMtrU
    K8Dohz4eg3nuedF7+QYh3YNkFkH4RAV9oJVt7DtpOLqQh/hNzOQJDZaTydAsFXxw
    TXF0A7WVlNQxpRRcQ1kzWlK5QvBlTNqwIWP1F9AQ9DIyf39qOzaTppUIVDVCWpVf
    kcPVT/Bd3nVJqWbQeF3A3a0KiOaj8v3GesfVS1hoa0pge/qtaAff8BB27WHJ6ltr
    Ssq4v0zLtTKHOxCuxkCgnCqWjfTVzZCWUIKQr2w4blCN8WwSFGh9PS8e3q+INP/7
    727XyEctyd5xqKh+SYW8X7i6Wrpn8MwyKzxvN2KV73xjMLjHuyGVUIWAfLQc4eEY
    EzcfPEPMJz0qzXvLyyUb0nQBWNrF4zuKRvAb/sVyq7JRyUqnM1TFhSqDdgKrP0w9
    zjCXtuDGf30zwofvrg2wDOvf56IrZHudmF85Bn85Xw8oydE2q01gNqTXonl2DrFs
    yvJuOHkuAVMY9OSwKf0Nb1B4NZt2TkeFdlDcX4od4+PbSCDuCQ==
    =kX80
    -----END PGP MESSAGE-----
  public: '4033298711b9a5a9862405486e603db0984812e4abb2d85d74b89ab06626ce99'
  fqdn: 'gw1.herford.freifunk.net'
