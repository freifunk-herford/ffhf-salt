# Gateway 2

dhcp:
  ipv4:
    routers: 10.34.0.2
    domain_name_servers: 10.34.0.2
    ntp_servers: 10.34.0.2
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:fe4c:84e7
    routers: fe80::a00:27ff:fe4c:84e7
    domain_name_servers: fe80::a00:27ff:fe4c:84e7

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:2; # localhost; freifunk
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.2; # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: 02:42:0a:22:00:02 # Die HW-Adresse ist Freifunk-spezifisch
    address: 10.34.0.2 # User Freifunk-Netzwerk IPv4
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:2 # User Freifunk-Netzwerk IPv6
    address6mask: fdf3:2049:5152::a22:2/64
    netmask6: 48
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: 02:00:0a:22:00:02
  primary:
    interface: eno1 # inet addr:89.163.225.133  Bcast:255.255.255.255  Mask:255.255.255.255
    address: 89.163.225.133
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

fastd: # Secret key von gw2 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----
    
    hQGMAy+gZA9xYWKnAQv/cHtn/CWovD5MTfDtymjY3giDZasxgK2Ak0VrqfZz49JZ
    wrSNePf0HReyaZVvBxpmOZcqwEUbyEJOQPomH4Y4HDtoWDyyUU/7JRG5GHwlXRD7
    NRbtpAmGJ23Kb/ALtyOW6Y6poKb6Vy9OTcqVAASEjoeICXQeMbfTx1z+lQ8Lnt7U
    kv7xTaHc6183EZlMpeEscTBfkvFzR4lrnNBpmNcoJIr22b6yJYcjmJc5sBfGLY0p
    gcBquFJhopeI3qRnaVYhDpGF/1ZFDB0Au91EN1GuHHy5v2UvmseGXJmJmWXyI+Gk
    HruCvmN7PmJDGDImHLSboe+XzSk+TA1uGHFx6OM+363SWmq23ZjF/mU5GGQox/yu
    s71tz8sdiXXt+mkLNRAGUYfVUOdl88WXH+xMXiv7RDkfkEqxCox7Gk0hubugacfF
    RzEmKQkDTMf3KloczbxZ9/RlpsVx9mvkJgXYgEWJbAOC+ovl8htpjL6gfEEtZU0E
    E27darfbBshRpgZbGTcq0nMBc2lcLCrkql0acKhgiKVWWTCKQgccQA3xHYoSVbU5
    96du65oZA+Rb0FJmdPRUhSO19IfMsoHgWGcbXy7vpnO90MHncTjIIh83hu6bq9+H
    KFk7OIJ+CGEa3nfinaxPmRkF9ZWXT+T/VGVUy/wr8/G9se0V
    =Acwb
    -----END PGP MESSAGE-----
  public: 4033298711b9a5a9862405486e603db0984812e4abb2d85d74b89ab06626ce99
  fqdn: gw2.herford.freifunk.net
