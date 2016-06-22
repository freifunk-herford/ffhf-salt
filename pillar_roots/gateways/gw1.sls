# Gateway 1

# salt 'gw*' grains.item ip_interfaces
dhcp:
  ipv4:
    routers: 10.34.0.1
    domain_name_servers: 10.34.0.1
    ntp_servers: 10.34.0.1
  ipv6:
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:fe79:5277
    routers: fe80::a00:27ff:fe79:5277
    domain_name_servers: fe80::a00:27ff:fe79:5277

# salt 'gw*' grains.get ip_interfaces:enp0s3
network:
  bridge:
    hwaddress: 02:42:0a:22:00:01
    address: 10.34.0.1
    netmask: 255.255.0.0
    address6: fe80::a00:27ff:feee:ec3f
    netmask6: 48
  vpn:
    hwaddress: 02:42:0a:22:00:03
  primary:
    interface: enp0s3
    address: 192.168.0.157
    address6: fe80::a00:27ff:fe79:5277

openvpn:
  provider: mullvad_linux
  mullvad_linux:
    # account: 197993544660
    # md5: 5f7a020f2c8e0b8c9faffde6df320b59
    ca_crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      pf+zAes=
      =iT9J
      -----END PGP MESSAGE-----
    crl_pem: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      hQEMAzfCuITl4pqUAQgAkaFvJ2nnTJh0gDhzfPu79huLh8nKxvrGfiuVgvmAKkrj
      L2w3DuWB77oWHAMjXOFt3kgBsw2KFWksm51m6d62bmOmTkwnJOyrWWL6slxxGr3y
      Xx8VX+P7zKBd0oIUym2YRyBG8ZkzkkalQsPLX0mKf2LMkbfKGbBMqMcyoiM82dxL
      AKUgMmQVtPUo49S+/xk8ZPpAS6ETVaByyZEQ6pyUBYghVhkOTdQFx6rNP0ib+d7U
      1cxy2WTh1aJ9UvQCG0OznCyCRDx1coteyfMJG92pm3rSrCitAKehB+HtVeAr4VBE
      phtjZTu62tkFCZ89pnTPk5zbuh4syYX3n+fm5Y97sdLpAY5z7SPl64jHSH1rpuAb
      TTcCQueVCoyZyE5tZiSvAeWg8bdkBl0TrAS834F9fINUOEoZEq5U3LE5C6b8mKkC
      FkxLO6vdRrEHsVjxNEO4/e+iaweLkvDIamfmzYv4N4K4RivZvB1vsGR7zgupr/Eu
      bR3XB3LxHpzcSStI68CRn40IB1mCC04xF36Lg8LE4Kca1RK95GYzw6Mnr6i9AtBf
      OxXcW0bs2mQNNvtpEebe3GYAB2hDRaW3LrkrzCZM+ok+6+2RM7KjtUPrTD/7EqxP
      m/+E0Vx5ATayxc8OuGrcMPOvVt5exjtzUbJ/g+mbGJCracmcTA4B4P2eI/Z21Zw7
      rZw1oTqjVjhWnJdAu2adHRWJhE4mR40xKHog5KfXC0ZOKo+b3HQBDxeI0Yxe69yX
      UPb1KD9ajhaRur76C0mWfRaqMlJLEXTF4oRLvCt+IWmc4/l63zyxUsdfjGYrQtKO
      wbbLedbhmOQ3qxTlGLP0pz6GzPqGe+F4bAFBCZKCFfaxld3ZrkwhcvGsaS7IQqmX
      PXTHMkEtpHNwLoGsaNJHaLoA9cuuTQOEis4ju0W354ORBGOYSlnEN4Fk6a9ZMLSR
      NfqKGmLY0022eOCMMhTW6MprrQCZZEiWwW6EkiV+Q3lWSPmH5WlZOSatf33pgDzK
      odTZSlZyjoyar1eWtLHnVJ3BOST80UnWHRXNBqkx+6iMiHS3AP7y7OOXmU3vXVge
      goPffIOsBV6SdDJqyKQejZewwk4QffOX04CHv0+zrwqNTfzMZxbYs8eZabEZQW6h
      yKWR30N87sMT7/up9Fpcqp0V9gJs6STwIpgbWwz4xUf+gPPxKwrdhBdIwHl6sdyt
      Z6u7+JyO+TBKINqlp3LX2opDdLmKhfgNGnygPIpzbcTNPK8oOgj1ZjmUHHW1g7Nq
      aEXWkhq6STrapD9ZYFL8aEe8Kbqah9e/Nh5EMahTg78uHRfjXltk2jQ45ObFsSsj
      PKmLjORfpJAN6OTx40o7rPNPeCZcT/ZNLh7/ZaluW5zamH4J96CzglRLJ1FEwmP7
      eZewLPzPvrlAV0BjoU8LEBXPptl/btwrf9J28pLVTijLetfTNi4vVsRH/dkyu+xT
      2hwXh058aGCkHjxpjzaLBQfgnx3smR7mMcdiAoOEF57yibYK29Cq/cJbG338N6gy
      3QObJ1qvhyZCZr0gnhOp9Tr+5W3K3KUu7eXb+7xq8fXIfN12+oZ8sroHiZ/SRcgX
      n8ANG/T/SXNPnBeX76f4AGfADSJD/dnVZpRuRBf4pGxNwanY3YFcniCcK0/1Ee2d
      If0J7NhkEa9+xPOhYScfhBre6Zpna/9QCMAGswz2lsANjU2CqEmNQ2vGrKA=
      =6XGR
      -----END PGP MESSAGE-----
    mullvad_crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      mQ==
      =AzkW
      -----END PGP MESSAGE-----
    mullvad_key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      B8vueMIsLaoFxyLkAYnSvXcnuw==
      =uZA0
      -----END PGP MESSAGE-----

fastd:
  secret: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v2

    hQEMAzfCuITl4pqUAQgAnknmsFFy55NYpszV35EouuxTjBRbobb10bk+Z+4YS8t8
    zuE57gkAsuN77JbjMlXdHI5MpqtOD+0Qedl1pdXMNATDp/lyAabG2dEcBj/gBvYk
    iBpG7kzs27nOYILkrqK8jxzlIMbTBWdBybZwP9+2VqeXKHJp+t+RGN1KGobRrgiz
    OKyswBSQ5AE1CcEm07420paeOL0opZmqeOMJQMGwPaqMKIWxyIonOM0CTEQf4DFc
    86aWXM+DK2QJmVK9+I1NKYctW5evyLmqyyVT/x+2x1M+epVkaWgVS8yiytnDp+4W
    zKhgJKGeqsxcD7zF32FeuPTQjKD2njgD4JVs8QAD29JyAbMhB1fzRk15gRioBtBq
    UMNoh+hpBYmLIIAwsHf7MMMZG5v1mQIq+FFIDggYeMM92dt7WoELnZ7rhsQizJV6
    s2ipSsHgely9cyDdgkfssgcjpZ7P7sKPh+cmmLyFJsacoVvYP3ORZ14+eTIosM/1
    e6y1
    =45Re
    -----END PGP MESSAGE-----
  public: 076616d8b4e879f9f11f7d287e06b153347ff710fd31ac5586c028f84cbfd17d
