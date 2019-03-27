# Gateway 9

dhcp:
  ipv4:
    routers: 10.34.0.9
    domain_name_servers: 10.34.0.9
    ntp_servers: 10.34.0.9
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:9;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.9;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:09
    address: 10.34.0.9
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:9
    address6mask: fdf3:2049:5152::a22:9/64
    netmask6: 48
  mesh:
    hwaddress: 02:00:0a:22:00:09
  primary: # Testdaten
    interface: ens3
    address: 188.68.40.226
    # address6: # Der Server hat keine IPv6 Adresse

fastd: # Secret key von gw9 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv/XqsC3OaV5Y6GOPwAZv1Eq2Csmy5+yylT1QdqDjBVZ3jb
    gvTa27LY2kTxyww7QSy42BvXgZzDAR2usMvv1yAPwj+pJBoXTPf3WgIkrrgIziPU
    bSGtf3xEeQATwAtjzp6AtavIFeXhFaAkExubvDMSTe8KiLkE0jCq1P/Q4VIPiRIA
    +KuCa0VUoz1R5d4f2cOifKplPVoRoY5sVSdViQ4uhIKmZBebhkSQYkADdJwtId+s
    ZThjVANYMAGGSuCTyYLf/shL06bJ//1fWhY4OTUXtB1Rngu7b3DjrNLyCZROyOmx
    E392++DrqaurnmFFik1YCCd51/JSqPNCtCuQz+MocxT9h/vCGZJNvKlDIJZrszgL
    kvuLS4ZUKK8OEznX3Ouvujpg+YHkr7YjIeZ4z6FPlSDYz4w1Asqmd+Tm/jh0qqM1
    AcvNHbHYGq2Ji09UttiZ7mwWgYFzBN0KQG35HApH2Y1CGLGxnetZafbxlaC2I5Yj
    mrkCmiNm0MXZtQLE8FIw0nYB3ZuY8iK7QR7QuLfxlk/HjL3moljlW9piJ8cUXwSR
    RQXTBI4fwRppzZRHQITzSSxH1Bkqo+MibnOAMJQfUSzSHUKLBQWtCpWr/aXFuPEh
    YxmYeiP/AvvZArGD2YtLFFh3TCT1zzxZCpVQtEgX82JaHjDZIap3
    =1yBx
    -----END PGP MESSAGE-----
  public: 6f8299c6008f2f80f4c4bc57e5ebff6fdd3115e5e652bc0bd2ce1ac06369a7ee
  fqdn: gw9.herford.freifunk.net
