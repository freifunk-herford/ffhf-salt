# Gateway 4

dhcp:
  ipv4:
    routers: 10.34.0.4
    domain_name_servers: 10.34.0.4
    ntp_servers: 10.34.0.4
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:4;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.4;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:04
    address: 10.34.0.4
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:4
    address6mask: fdf3:2049:5152::a22:4/64
    netmask6: 48
  mesh:
    hwaddress: 02:00:0a:22:00:04
  primary:
    interface: venet0
    address: 85.214.87.18
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
      =8Rrg
      -----END PGP MESSAGE-----
    dnn.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2
      
      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
      riHFFpDMQzZaYHyMJOMD6vqQ/59WWuEfXsVKdQ==
      =iuKd
      -----END PGP MESSAGE-----

fastd: # for gw4.herford.freifunk.net
  secret: |
    -----BEGIN PGP MESSAGE-----
    
    hQGMAy+gZA9xYWKnAQwAivHD3NjVsoyTsd++v9QkuMi3XzHB9s31QJNtiIrA6U4E
    94IiJ9IvXBAYn1hDabxUsso/GKtJkpTv3NMxrnjEcjN3Ko/PlFBnCZpxaoFWsfBj
    OCGkZaKfqrZ2qZ1qpskE8bvgVHx04QHtHcA0PFfXt/Nv0RloQnROnFHxt48itxKJ
    tCqEJx0m1UwpgX7fg3WKj6jKsZdbHLlNP3fQOiTun30tgdoAk/+Ma5xZfJZLNAVs
    CtwRTpQvfeMrmb4ReJOY7iPKUzDrCTBbib4MS2fbK2IjgjksK69KM5DR9CBbV8AO
    alqdLtl9Hebgah2gYTjpr5b+say0vydgJYJ7BTQPJEk6g2zNbOF3z7aH6zGKPN+U
    nwWR4YaWJh5xQ1fH0Zv2jXWyZ6bzqNgzFZi1Aiq0GXneiOgPY1n/vnGtn21SnAoL
    LMt7kUCbWOdFiAoa6pn+ImzOi3gXwJ14uv8JcshCuySfe+Cl/ddbsRRoCx1bHY9c
    Le/Zr4GWCed5f6ilvmAV0nQBAjTh2Rnh3PkJGByNtU01DoCeHYYEkjSkBKRnnryR
    565UMM3cWYFd+jAutN46baCJWRLY2jhQi2qn4r33r9iPX55c7qp8jHRzQYRyET+W
    2FhXLlA0Z8WQcBDEzYR1oD+EAmQbXdd1x0Gka3Q0JmPfxcuijw==
    =V7I9
    -----END PGP MESSAGE-----
  public: 3f4bc64be2c5ade4297bac8846a499dee9e01da062161edda562a582a59bbb1f
  fqdn: gw4.herford.freifunk.net
