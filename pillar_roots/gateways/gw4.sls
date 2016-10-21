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
    hwaddress: 02:42:0a:22:00:04
  primary: # Test Daten
    interface: enp0s3
    address: 192.168.0.34
    address6: fe80::a00:27ff:feee:3b00/64

openvpn:
  provider: dnn_linux # mullvad_linux
  mullvad_linux: # Test Daten
    mullvad.crt: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      hQEMAzfCuITl4pqUAQgApiRwmsJKr+wDcrq7Kp0QV2fDKc40FRLeVe9YkrYWIyLx
      96vIsIwnvRLlticRGmnrrKtQWoqysHbsqafp5NYlc+5YeeKpy25gRIEADvx8D7lV
      HoF/kIRbLgTsLXxTXkcdm8VsZbeDfnKU/z0UXJwBfVrtcMHs8hkPiD+Bb6ixlTJf
      McMoKw+DZgTOzgNvqatx06CJsgQkRXBRcX/7WhyH9k3uxLHX05mjIy7Q0LT0i46Q
      3Di6pgnD33YdWhm6zPgg7n55NDoiHdSgD4az71vdyWCCCwR3gtorMXWzrKxfjYgA
      1PA1gTnmWblJFis4pO3OfbtJIzyUkBwodXysEZccFNLrAZTD5RqnBeHD9zIRlzxj
      /X24+Bwn5VbidTF7NE9fBwPn4l8rwJssMuAZ1YBdvCqHmuiJWBlDytqWR+aOhghG
      /VhdsohhBywkKza772al5lRo/lbB0GqD96Cv6mKeMC9kem7kH+drAyXUxDRhtklB
      gM3OGxax/bjj+Kem2loVJ0tE4MQ5l7KMEOttLj++FVcf4LQtJl+6C+FCECgmu6Ps
      jFvr83ufPH0Y9ZSel+iOpS0CWoQlzBODAfb/58z9+vjarWeIXQBHTyh7MWU+xqWu
      r6iUf2Vd4O7jdynqtKAPYp42z5zen2WycJvrLWXmXNEDZ3fRDyanaEXndjE2kwQ1
      3b3fKHVfSEaw8l+SPf7cUEWJ3KxG0NjpCTmiTjH3DdNT6okNDHglN3TD1xfJE3dr
      DBTXMmMdEbslJj2bQiofG1jvrBG54TK97uFindlH/Eg//BgRpDyvQotCqKkHjKvw
      1zAnhUK2fPLtXuH1FiVKl8fRHxkkl/Pb0Hg/jt/LRFl8f0qY5g2XNsmnfiyM4/h5
      cj0Fkbz3D2XqufaekooYvIfgn0x4MYjwzBdaZJO6CyGTmT9Rmr6X+kK6rcGWmicX
      qp/BMghKv50YPPHiyF3Zq0S5Y+13r+9F9oqLBhVjJbaf624/cUTvnA382fRHgDfm
      nrZ47lDoImVHGi6RUwQxDQEIJoXDvzpAcGiVSa/xMfxNHkJPx6ylhwme2cEQY5KY
      ql8H5bhFNClNwAgDyUt009r+x22dL0na1TP8Vbs15LJKjE2ln2GeYyca63P/G3i2
      w1iyljT66mdGnc79IFwiXKQuWxhLsD8FvcKsdobC+Gela7C2ln1ysreH2/2eaKz7
      cLSpsDjk+rJll9aOCenEEL40qN9PAfQwpg1njpty3LNKQ9uUvtlLJ77QvWXwwTqy
      ynh6W1jwY/pjbcmwxyFvJHJ4f0RaXBg3zF+W1a297+GiS7UyJeNlKJPvuFbwACsK
      Uw/wQMZpmIPdVBLvhhO2VLjJAm0E5TtjNgvSu91/6wOj8dS+1IXfwI0JyhibYS9e
      YZPP5TH7e5Fl9qCB0FX4K33RJdjUBI5H1amu5C+m/yrr1jL7ecqtJcKgDquDEkzb
      TCfd7dhvQYZ0KRlJiWdRbKQ8mnPu7zMETJZMhh60TSCYMUNFMslKm2XVP+GJbshj
      Tp8wPmLl2hsrLvoWgBfGe+db+n1B6a36ZzSz0WHMfFX/OwlJS/pdZA4invmoCqA8
      vtIJplN7zdN+GWNMlO7lrmP2g1yN1qw3ldHBhqJwRIJg4sPkmWUNH+H7EZRSj2Y8
      iPkJSmtw5yzhjDEl91aKq6sLDT22wiQK3aY8ub1QTLPTt8z70WwTev/vxxT7Z+S8
      3F3EYCpE1fnR2KkMSrwv1qSFR5//SJt6v0rA6h1H1OIDaO9C2iMf9WTGPanx6Zyi
      fQpmlgcN3gyx6WYM+dp2fGsgjuZSjOpp9m6pKlyIOkqS1JzpJJQ4svTd9XS/ZYku
      9ewH9FiJ+UpXv/Y9JHLTYnpiFl9vTyCh4KCZrANwSuv7X+7s+DlWDf4D7cdDA9mQ
      bUeQci6ZyuNNBHW4FmcAgEe6VNaevAsvdlvYQLZ788IAvwxD+KSZ4O129ZXZzsu3
      EJ1dWO+nklIBy80wQzxOrTzYnsEz/919h22CEv67+dAzKhzdMI6AwNlPGfZ7MGED
      zXJifUby8Tx5v3qazHtbUGYQebGhCFNaZR/6yjAl6iNi1CTrFijvP2HKgJNE/Gj7
      1NiRAU/a0Ng3x3zCNdcJhc2SJ9jR13pIDrORai8zVHvaZNoc9AXHcUiijjnNhtrr
      kKY4b4H/+c7UQ1YOad4fLvWIOGLkxKaNOVppP/8D17ScyYUSd93/N3OMRvI1m+Os
      slJp5ZaQzRa9UzCmFpBADjUakddXtzPfFAr2edHXGVGMfYAIv6Z9dc9WIcNeF0MV
      92AyjIyAVMbN+I2nFxlX+IBAoT5bE3oOG9YL5AP3z60x88Gl6FNa2F48+R54p8xb
      Wiy/TQI0neSQJtTfJzpveUjlmbidf15nEBM0ztqhgXC2Q+KzmQPhM/V3Xy4M+za0
      fKWM91FeP+GdynbdV7/qxpt9pTlL4v/9sl9IRszo3CWu33ta+A6ADl/jy0q3abX0
      nOa0ddWt8jBRaX8vMO5Hwf5zK8ax2UNlvsvhazj1O8OVM9l7oJ1Y8GL9dWnnBeO2
      XLTpvgqFkY7nAWn7EIGQ6XYo+uO+9qCWGSeXIuHXApquyrTX+Nr2z4xkLdA9vYBR
      GFumEqQq1W+UkTo9XRCVSEEDBtCUZTobtI2KBl9OSNJmkURtyPgj8Ek1BfUB8FaO
      VpxmSTGVzvVJk5u0Ami9dSQuo1B9l55G8hohZv9fBnERuSzo1oLSMy2yaVMXc5rC
      +uja7LQC6L63X6rSB8WOCT+ABBy6buOStd+Gj9GxFXmg5mwJF07EO8yiNCBBzyt9
      4/74eFrDRbAAbh8szzqm/G/XSQiHBb7wUZEkSBufs0NvWDEUAzQ7yBXdXdzspXqi
      j9slESZAGNcJEUXwQNeMtZMRVDzbpr5FAYjinBr6+4Gc7eZUbpBpIOs8dC1+/Nsr
      XhF13eLxJNmE1yXAwqqX4cgVMuQ7T9gwQAoZ/e5dx14euaRDwHL3N6MaRsjdZSaB
      fpkV5JcAsTqGaNgJie+BM4wvS6ZclIQ72UCF+wuEL8wMgEraJuWpqDgaB7EbqFc0
      RjApD8jISe0MrB380wngpGnp6F1Au+Z6J1T9nGlQ63pT/6WXcaMEKnUgO4giiHSX
      JA9Y5/6SK47Trb27V3u+ZxK4JdMPCtLuDXU55ogjSvexugxBW/X73wH8KZ5VOtXD
      OKZ37xjv9MjlGjgY+0iduhv2ruJYuq6SVqmc1f0MEbzHQPrzJbfqTXtXDUqvuPeX
      5GcK/Tmwwi3E2xOQsCmjtulyhnvTkTAHWRFVhdka1DU3g/zvmulcSsatH4CGYEu8
      JEf5lxa31ifaG34+PaxosVjwI5Qf4UecFZFJW4jpcERND45/EkqgK5D+19JEj1IC
      aQ2AJBapfFSEHLYPC/qsDxUUxo3jaVPCLZZjm1UmXC7hj2pA55kxaMOboqmImhMh
      8xpgAk25S/Zj0rBVOmAb9a8FmgaOYZm7N5wa5gkX7mtmOb33+g7WEvrwx+q72YHw
      AS6NyNQJPwrhAkfh5FYq3WhFdkaL2zcqfXTrwmixMBDMgIP+zhHJr1jxcAIvPH19
      sl3BGPVe2AuYnCsh7TpgEjtUuLcQsgrp5V4aE39uRifvocq04u4qTfObS1catdi4
      NtEivZuu7GjmbcIvCILmuNizhP62rsK7DpFRZpS5M8BQYkTaWvNa4DIcshjhi/HQ
      Q6OpNj6ClD9xzJWo52kM85waFNf2RjtbM+znkDnsnuu15Mv0xoj6u6Cj1loJtjIe
      uN29EDnlO518eG8ScfTmzCXzrOzPMe5f7cKf0XtHpj79hFYVZ0NDwjV5ljmtb4wq
      DanYxgHVG28fH58GZIZjWHBOeN0tSHSjQ49UtcLW4NCIzuo4ksecsVTAK/5zway4
      TBkDWXZKzsrdQ496vBb16yqL528PvwtS4D51a1u5Q9ucsPxKe57EsT49E9oPURvP
      pHXSsq/SFfVaW5vQMMuuN6kYFuzaiNjTVxnjpcjFgUj1/XxHcAZL/1D4ZmdbMw9L
      =SyNE
      -----END PGP MESSAGE-----
    mullvad.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      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
      RSDv4LxHPuD8i42aQN93a1g+qiK5m8NS0h/bng==
      =EAzn
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

fastd: # Test Daten
  secret: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v2

    hQEMAzfCuITl4pqUAQgAp/I+VHUZZSy3zMqf4bUWz5AylTL3Gcm5PJ+DdvYqJRpP
    SSOvqwJE+rZ/T94if0Hqkmmk/IagkeDpj6wJADvBI5N40AZznp1clmWNbH2JkN8/
    EltQrxG2dcBDQVfGqKsr09flgPfObtXBXggPefbjpTGUFqxH5z6KqswWZ9xKWMdF
    It/LavtBiQ/clBQm1T459TAfUucfZfBwBo+472DE/GR7FEpUiiggOsXZgMBy7r5X
    qEJd+AoOCJqfCqaczoOnR7UTf0qGsUvK46R+dv9t5GlPv/2pEgUKj7bHfPCZ1SAV
    rW13SXs47lW0rnoPAWdo1Dg3SJT+lM33HfgyExW/+tJ0AVaBNNneALC8M3WPClnQ
    p0o0iTRcblmX8lPk8apqgZ+TdWIWW+HYgJeySV9Jd+uwUOyqA+lSTUj4xCLuwhha
    ysLnbbREpB/Brjg0dyliG0cF71MJwXOXrdlooMIz11/UnQ5htmJy1iUr16Rks4Ef
    4a5gaEw=
    =w/3W
    -----END PGP MESSAGE-----
  public: 871bde12620761fd7480a27874b572bde730a6a541e1057f7b2caf8bb8277c9a
  fqdn: gw4.digital-nerv.net
