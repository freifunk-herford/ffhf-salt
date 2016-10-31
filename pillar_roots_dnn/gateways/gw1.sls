# Gateway 1

dhcp:
  ipv4:
    routers: 10.34.0.1
    domain_name_servers: 10.34.0.1
    ntp_servers: 10.34.0.1
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::a00:27ff:fe79:5277
    routers: fe80::a00:27ff:fe79:5277
    domain_name_servers: fe80::a00:27ff:fe79:5277

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:1;
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.1;

network:
  bridge:
    hwaddress: 02:42:0a:22:00:01
    address: 10.34.0.1
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:1
    address6mask: fdf3:2049:5152::a22:1/64
    netmask6: 48
  mesh:
    hwaddress: 02:00:0a:22:00:01
  primary: # Test Daten
    interface: eth0
    address: 192.168.0.31
    address6: fe80::a00:27ff:feeb:d6a6/64

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

fastd: # Test Daten
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
  fqdn: gw1.digital-nerv.net
