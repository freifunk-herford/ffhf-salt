# Gateway 1

dhcp:
  ipv4:
    routers: 10.34.0.1
    domain_name_servers: 10.34.0.1
    ntp_servers: 10.34.0.1
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:fe4c:84e7
    routers: fe80::a00:27ff:fe4c:84e7
    domain_name_servers: fe80::a00:27ff:fe4c:84e7

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:1; # localhost; freifunk
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.1; # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: 02:42:0a:22:00:01 # Die HW-Adresse ist Freifunk-spezifisch
    address: 10.34.0.1 # User Freifunk-Netzwerk IPv4
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:1 # User Freifunk-Netzwerk IPv6
    address6mask: fdf3:2049:5152::a22:1/64
    netmask6: 48
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: 02:00:0a:22:00:01
  primary:
    interface: eth0 # externes Interface TODO ChangeMe
    address: 1.2.3.4 # TODO ChangeMe
    # address6: # Der Server hat keine IPv6 Adresse

exit:
  type: openvpn # Verschiedene Arten sind möglich "gre" oder "openvpn"
  provider: mullvad_linux # Verschiedene Provider sind moeglich
  mullvad_linux: # Freifunk Herford
    mullvad.crt: |
      -----BEGIN PGP MESSAGE-----

      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
      =eyqx
      -----END PGP MESSAGE-----
    mullvad.key: |
      -----BEGIN PGP MESSAGE-----

      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
      EpOcjoOq
      =Ab0B
      -----END PGP MESSAGE-----
  dnn_linux:
    dnn.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2
      
      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
      tnDTm5uL3ew=
      =macr
      -----END PGP MESSAGE-----
    dnn.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2
      
      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
      v75ibt3Q62+zGJm6GNijHbzmHY2W9dY=
      =J4GK
      -----END PGP MESSAGE-----

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
  public: 4033298711b9a5a9862405486e603db0984812e4abb2d85d74b89ab06626ce99
  fqdn: gw1.herford.freifunk.net
