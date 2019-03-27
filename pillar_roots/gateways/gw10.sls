# Gateway 10

dhcp:
  ipv4:
    routers: 10.34.0.10
    domain_name_servers: 10.34.0.10
    ntp_servers: 10.34.0.10
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:feee:ec3f
    routers: fe80::a00:27ff:feee:ec3f
    domain_name_servers: fe80::a00:27ff:feee:ec3f

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:10;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.10;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:10
    address: 10.34.0.10
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:10
    address6mask: fdf3:2049:5152::a22:10/64
    netmask6: 48
  mesh:
    hwaddress: 02:00:0a:22:00:10
  primary: # Testdaten
    interface: ens3
    address: 188.68.40.226
    # address6: # Der Server hat keine IPv6 Adresse

fastd: # Secret key von gw10 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQwAjxLTKu+bEk1WJeLfy7f/UxtVJv3rYGr2IJG61zSOv8g+
    eEnTzI9D8nJOulppwB/spehl4OalzPZFrrd5hfNwBCF/j1ZrlhyR6ODCbqEvO6x3
    s1PpI0cZttwTFw7En9UYcgBkZvg1FMVFhWaiUdgK1Rf2xpaAkE3phGYHGTrMV+63
    NOwSi9u7IZnP1FIo5YnSkVOmZdgYfHoh4NwBQcTNwyHzHmBr+J4ZVPnw5bx7jf74
    KQyP5qUr+r4JeOdV9SaT49W+WANYqFaDBQXmFlwdKcRFRnqXIaAN54TGMJcYoQvq
    oBntJIW/IeXEmcyZP80/LH/D03BRjKqvkY0UxWf5fpz3YiCrUXhQQeLey9D9iCru
    ahm00isfV40L3CI++xAOzJskH82Sk2pgKIJe5UnI+CZoZveZ9DPnyEgawuyzYnfH
    QiPwPINcYnGjDBto8xC488z+jiMoIyeGr84y+VlEDDgCV6r+AGC3XKs6eMCKuaam
    4QTu/SNH0nvpuW22o6rf0nYBJldxDdFjpRvTNg75fWQmafJfajQj1NFIp7CE09zY
    N7HDq5ZzwlYm68oLRydAL1G7MlsTOMDb1Je25GyrKm+X9u1P/r4AFqsle0x/plW0
    0HjMUJ2zCsyLXHlMNbAudK+bayXV/JkCzFInbM3T3yBu1UevSoHP
    =uK6A
    -----END PGP MESSAGE-----
  public: d7ae822740c53808661fb6f22baaa5fab046f1a77b72ed5f271701eaae0f34e3
  fqdn: gw10.herford.freifunk.net
