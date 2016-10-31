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
  primary: # Test Daten
    interface: enp0s3
    address: 192.168.0.34
    address6: fe80::a00:27ff:feee:3b00/64

openvpn:
  provider: mullvad_linux # Verschiedene Provider sind moeglich
  mullvad_linux: # Freifunk Herford
    mullvad.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1
      
      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
      rBg=
      =nn6L
      -----END PGP MESSAGE-----
    mullvad.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1
      
      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
      =727/
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
    Version: GnuPG v1
    
    hQEMA9c3Y0Thoe2fAQf/S8J2WvjU1kI88b6yR3QrrLJYUKyVlSqz0gL+iGI0wxJu
    4W8m1qaIFOT24+LPc/JXeEBoO/t2eps7rFjqG8tQkmXR2iQ4QpG9AxuGUEaQLWlg
    zV+FHhRqpvErOygHnbv3VprrRmuYBqQPgk+v/z23+WaWQWQFH7Q4qjNuBIuW2102
    E+kGvjRjIzRp3v3rYjbvnIx+d6tmp16vwVjFyDyMqzAIzM6MzgnaqOb0WnNb0eyc
    ToZ7hz20sp1GINu3EAlKpnpiR/260Z6i5HJo9nPzf+EcyRbiQr68/Gh96OBrB/Ar
    AQuIgKgc4betdO0vp34k0mlyJtkZq6dsSxt3QeGLutJ2AeaUYAq9Lj6x7bjZ9v+6
    Mn6HxTIVTDXeOJ6bDYu4R8ZoIzSsfF+ETPRS+L6FzCrZPYG63/JlkQuJKntqCPMC
    vmCg4Exk8FkUHON3MU/5W7el4SikH3gfnKNR/NX1Pdg+PLpU6ZZotnnLjPoaxOYG
    5ED3fnXuEQ==
    =HEgA
    -----END PGP MESSAGE-----
  public: 3f4bc64be2c5ade4297bac8846a499dee9e01da062161edda562a582a59bbb1f
  fqdn: gw4.herford.freifunk.net
