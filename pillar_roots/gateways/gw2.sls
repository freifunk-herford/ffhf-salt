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

openvpn:
  provider: mullvad_linux # Verschiedene Provider sind moeglich
  mullvad_linux: # Freifunk Herford
    mullvad.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1

      hQEMA9c3Y0Thoe2fAQgAmtmV1Q7fpHGorz6nnBrXj2b+l/1P/z+Bx+il7Wt2Zt73
      JCDit0cjuMxEsbFRmBE+XEuzfCV5OzTWT20NdFx8lC/A8KfkBFBsbtz/aG6o3oV7
      uFmJRy2aqrHvcPhc4yy9qHX3Nsxu2Tt0p8lgoTYSNCFrYbqxDN7kvCWUh/0xN6oA
      q2x8fMNooGWe5QLYGNl/+UBz4gEPIkTZJqCAc8Ocwfuobnk7j8IIvmOfK6BszdX0
      WyaP1GS6SyfmkTtRu5fM2oWsaiDmAqN2i5ouo/FDRgfZMFMMS7i1fNQ1HhRzIbAT
      wI7Eg3mFv7IusXkzYeHB91bbaTS0OZQR44d4FM4yytLrAbmcCbGdt+IOZul9N3QP
      YCPpU5fRk9JTrXGLmVzbcSZk7y+U6dAV0ZzNZcSVagrxLSe3uTySJGg2M1Lc1vVQ
      P5RXv4A4gsmZ4bufw3aKB0QoDcgjxkgNrB3oE2s+Wa/WQ2/36wm2cGE0vrBNefvY
      oT4pflPMEKCrATCM0Wtq8QmZedVVyGtndlw0WA4oiLcho+5OiZNdyAJ/7xUfjv2U
      2YJ2AIrexd0O7qcpDQYmeqOHE/Lf57n+SvPTM5R6ZoWWF7bv51fQPGtFsnYglZuV
      HGyHGGYVNVLITVQIVoWZP90p72d3X4Vdmja49e7Y4sB9kTvLBavUKKqHshiM0HEr
      PcpB17vxeBphIDUdkn2/oxBF5xYiqH2FeSh51TQYOyOCKq1L9BZUqnzlR2RoZlr/
      9CAe7g5ipbf7jEd41pMQmnUT1uzpCRtqAtKl93EMHi2JZfgsp5iWeGmmFXyNdazp
      P9N2Jn9XO3s9m0yAAM0xvf4dTcidMRFp0mdO89Fqy8JKS4y1KrlvtptTztHaiUjW
      nhT+VVogIT9jF6yw51gEHk0L0GMDlAX9cBqAV62kRGeSgPT9Z9vG916R/vuTXVwT
      MaDZem63Px7f+g08K8HmQbCDG1Z6b4RvCxyObqxWJvMGdz3kFI0GpU6w2p8RZB7A
      OdaT0i5Lu6sWSrdQ6NSnorvpSB7TYU75W5eb9zf2LMHiumP1t6VD35ehwM36dC0Q
      XfYXSbRP5isFu+rarc0pmVDURNbWr9B5DXTROqbe1Z+XwTN+5JaVEdZumBaVrl5x
      sojcnE0ckKh2t1YlpbGdOsOw3eEpyKl72J/3mJI7RtVmOuTrf4ay3/tsiiiuRWH7
      VjySzGI5PKBmP4wkHQfnOaXfyzpb6V4Zu3AXHfgofzDQ7uqM1fEXANCH3DBV6U37
      mUSGQ3qur2p5WiTPyyPRzy4ERAha1GbPSHBO9WHbf5TcukMc7m42QzrgBc3IYBix
      6JitSFW1ec2iOYVmVRHC8I63w9bm/QCB1Ov2TCYXd3FFIypURi42WZiZlA3Ig5rT
      Q2GeizeQKjN3mxAl6QbP5vdbRGWcUHAq0W/MFCd3wxBu8IRnZJ+vdg4uWW/Dcgq9
      b7mOPbE/P6F8bUuqktLwbg23fMPptvlM4Da0wN/ctFgAROumdqaEnz7cekjqbSf7
      zR81DcWkerwB//e4XbfcLQrpqEaZn2OnLikm4M4IEcIUB4KT+yJTwGLV8O0gnCpt
      snfv30+XTyoFEfWooNpHTjjJ/c2o9xpgcTLlLkXCHt+9alH+Fz5cVW1vfYkP16BF
      Ymf25+CGWs/EfbhpY8vTvXoghJdS8ox/exfmaKqIy9ajsDMCUtPg0v10wNEBzots
      KlbGVqKKBsO0TRRer0QUzNirz7j7ijuSdKlOZOVISmwyLv3GoViT4ErsZvjvn14k
      Zz9S37prE92BNM1Wd4HzCoZnUQl2hvNp3ozcetcO/+9Zf6c5w3LwlBIJCL2dkGoR
      pyHX8hNa7gOqmApu4cKUuQ4/Sgu7oouJqmN7VFmTehw+uT8j3ilKKlJwhsIhoi5A
      aYpTg+9bYgN3w9jn/MO95T9hz9RZvAyCUtTEgkbn7sJ0RuIlai5W6Ktn4rAeeyod
      dGxGNISuMTpRuhEAytCvPuvI89/o+IIv7cxpw+msaIOk/aX9ZVlTn5S6dFg9bVM8
      arj7N085Uq/jDyuERWukmt910w9N7SQYYQYP3GXXNY6M067gLt2seUIAwcfw8R/3
      2ockeJ7Bic+ZprtvzslRYbOIBJyGs4oc+OAIOj551rDea9fVVWYsAEh6K0pEYy1/
      5EiFwraCzY5xrJe43IiVye7eZAY256WZFHV+meOIwGPFM/1g8z9NPaz2Tf6qVLx0
      TS+WMB6lB+u85xMIurfdKnKcD2BV/w4DrZcTyIATGloRD5TgbYjEtbcgDHG0OtTz
      WhfHAJS/gTbzevSK2TDRDGvruNRAaswOFsz10YvQ6HMz/R+R03yO7R89SF92Fy4j
      kJzpwDZ7xwvmy6yn0j5hScwij8n6FkpOylhkrTMLcDLKzLBf3lhN/a1DBfpafB9F
      mtD9wDop+JNzOQkyJk9PnPkxU0rHj5zTQgwaAsVNt+um65S3QD301ipxRHVc4PA8
      0a+JeMYdF9UY8HLKPprXDvnOqtzRTtyNfmoj79aofHlKZclJBVl24FWCRiwsOeX1
      MceuhlWprHmtkGWpEOEaGU2osyWEQcA2fxBctbN+aTK6GuNz8gCrrPUoGe2nk1zD
      Fbr/cB1HB3Pj9tj1ggps9ZEz2Gmjdf1zHNOWU6ypuNJbCSAVUQ4fPdCLepI/EAkt
      D7agqxoeEzomTs5K2Y11ENiWBzAP5wqdyKS2JY4RLTQY6pywFpznwZPl5EwV2gv/
      30sL5x1gflAHiurfsfXIYDG5hdEzayrYcTo8j7sDrJ01qwnNSfpB9m51gONuj8ZY
      7cd8AvzXhVJ2lwuxxUrKmnAOORsCZNf/d8+prtQsseYN9RiF6DLNS8xLhgXEHHs8
      B52tK1/A5ZRnUokbjtm1KGmHiLL1Jw2fSn9Exr+gSOUQaSLmEVtTXfoA5xrnzRno
      5G2gi0CTQgcEK6bkjeMTn8ezqFOIP+7fBrwgqdcKcKCb85blGcKP7DKqMITNK/dA
      VO8lTSrqug3EXu3LhxvNuu1HNG052PBGWP5f+vdMV6nFrsYoF4INMN+5RrQmY2nl
      V/lWt4AFXdWNTeDSKzqwvULpeXJmRBJeweFK44XaQi94pcNpg2cNt2eYN+z8rOtt
      s6k0S83puUO9cBaQV6hZZTREIEvNqqRSIN7BrI8ckCw3u8l1KKPCJnjPECl2rOJg
      xKExTjH7G2wu9g3eCjFbHiSvOzBjdlClK2kKHDyx8mYK36gKp3hwDIzHNJKbV2jL
      UFx0dip0W0bgSO8m+37M73b4inEAx8eXfY9H2Bhsb0xORKgfs2Pw1CdThZHQo6qU
      WeGqKDVGew4Ioxro9g9zBJgU5d26PF6PaUg/9UaL6Je8NmEXKCm2K57LzEhRFR9d
      Xb0gLZXDkrwwvFhYFiMD/9Gutk1Hf+jABoVzXQkw94sPoRIfY0JFm1pnLbn/W6k4
      0+fP5Y9MhYml5pgSodkYiVxkPmEVzDb/qhPgKzCYcvgMEE8lf2mPjOxb6l1DjIlz
      1EWjenqUMUPUnPJXnRhMbpbjwELALKr0Kg4mWyVRQvEv/cMxnkS48QM+fg1b0s9L
      GAFa6SwCMHydByFpXuBsW5RfYgliOmAyg2DwLsOiTWCOMo6W00jCbBixoYX7Vjh3
      9rb5GbEC33kxNkkhbnSuAIdDiPinF9HIwabvZcUC+2lNbva2P3S8wptdaWBKC6um
      cZu8ISWGR7Sl1agBKUFyQJjIg/uM/hYls+ckSp3wEfzhjvKmy+ZpzbO5dHTA+MYp
      6fbAXsy5cP74m10Tpf1wzIvjhuWV9hi+pQAniVpTdagPf0gtB8T+BYtrE3JVC+jK
      n8j2PPkpLhnK0jJj5pskfZietN0iBOXt5WfrfqvcbulknA98+ZDZw+kBp8WMOAW3
      lUq0+9LVeACaSB6wrfoLjGInBkDjQKZe2apBo7G+SrqWeV8wOXmG5tPyGi3IFTaH
      m9BjvmQoM9Z7/54lypbflDunsKIiOqtzL3SIsy5SBdTRGQwN878AKcrGDaobqsCC
      TC78bHTM16ToqX2+he5CTc25mutPjQxE46teo7k9i6TWjEnvjdeJ1tAseWjj3fA7
      kG+fqYlS+n+yqfTZ1At8eJfEH/EaV7M+cBHUZJ9KNviXRVMgAzcWkuew2zHxUSa6
      rBg=
      =nn6L
      -----END PGP MESSAGE-----
    mullvad.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1

      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
      =727/
      -----END PGP MESSAGE-----

fastd: # Secret key von gw2 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v1

    hQEMA9c3Y0Thoe2fAQf8C4Yej9/A2nY+CKiG7vKsqANe8sKVDrxOxEoDxqDBChgz
    pbXx4MM6aKjMAJWmGpxEBJEcoC0MfR/RG88vjKGz52Os1/wye0MMElRK5BZbY4zO
    N9QOWCIT/3SSYfgzuBO2I9aVZMewTXntcl4/kqb7czhL+wstS+EbLpdwa7ABtqS+
    29pdhF02puQTjcT+Hg6Gu472Kt9ropWJ0SgtLhiefBBxILKgOxkbHxbKD2kOypAd
    LxOJ6dsDCm0Nb0UJNu304FdDMiIg6tvjJ1cn1Tpmx2Bp+0Zsop7Z16iv/eAx2yTZ
    MRHMRsGfhILpIeConz8e5cW/unq7W+qz7r8SMNS77tJzARUlW3wu3wETlNT51At1
    +wwt4vPSn3R6FaoftMhZnbgG+4FwwVVJUu0oDW1f5RQfJEvWocfDb6rbsgF2wv0k
    qKVZsjqqcy78WkygUaGNglj4yI+HADWkcU29EAcaaJoUIadchhupcpLIugIJuWgh
    /jzbMg==
    =1JEr
    -----END PGP MESSAGE-----
  public: 4033298711b9a5a9862405486e603db0984812e4abb2d85d74b89ab06626ce99
  fqdn: gw2.herford.freifunk.net
