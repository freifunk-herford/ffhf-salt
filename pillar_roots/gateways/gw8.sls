# Gateway 8

dhcp:
  ipv4:
    routers: 10.34.0.8
    domain_name_servers: 10.34.0.8
    ntp_servers: 10.34.0.8
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:8;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.8;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:08
    address: 10.34.0.8
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:8
    address6mask: fdf3:2049:5152::a22:8/64
    netmask6: 48
  mesh:
    hwaddress: 02:00:0a:22:00:08
  primary: # Testdaten
    interface: ens3
    address: 188.68.40.226
    # address6: # Der Server hat keine IPv6 Adresse

fastd: # Secret key von gw8 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv+NiRA7MoKqUSCacG+Ju3bv2R3aQDvpNwOCglwrrGS5lOK
    IbhONYZqQue/jnxbNZ/JXhKdo4FCWkQlGRm/w0FUHAMo+UDW9HsOf5l0s/+awvLg
    WSKlaAiyIpmlQHWXzPhk0rw4hiKUQdxXTO3OWBX8Okbow0itnPvBc7rM+hqzWCGj
    wAWE5Y6l0zUggvWOxOhxdzWxU011ir5dvP1wnnVGJyNQuMCwBGFmgc1NYCUYREEh
    HNUc99Z5JBNBVuHZ7Eb/1izA15itKpptXzkzcNuiX6OBCVoq/mi33grpXuEn9qGL
    hrnaq7Xqhg5D/7MoVJXlu3tNWQU8q4dwCemWZBhDmWnjqR52V4kBYFh7XDOO4RUG
    3wF1Y4Zr0Bz9QMHOcx4TBCzfRNdqB7vZQxFEyw8pCOqRNtcM9fcRNJcenHP1DKdo
    7C56ZFy2maY17rYTVWEkiJgiRbGEXW3pRGZmINgr5EsSoPdhhcTkcZeQ5xaAb2rd
    kdG9ywwvWDMJKUI/uWoy0nYBDfiR75csoyR69cqbU5hfnAEdpbCfkj7qxK0Nc6Xg
    mIW9DGkWPz6jkJJVNDpYTHgKwfNjczRAtyudyVZ4d1qJfg2H6LkAoBA70mpaRHXC
    QrcelD3Re8NcPEpUZzQdeRD3+sM5+dpnoo6YUHE3RsbvLbXfhjN4
    =0RBf
    -----END PGP MESSAGE-----
  public: 7d9372d44ba889f460ecb300c06aa7b31c69fd2e6a93e4d826b63c7bbbd9fb55
  fqdn: gw8.herford.freifunk.net
