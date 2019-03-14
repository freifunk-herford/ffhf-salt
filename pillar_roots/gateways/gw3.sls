# Gateway 3

dhcp:
  ipv4:
    routers: 10.34.0.3
    domain_name_servers: 10.34.0.3
    ntp_servers: 10.34.0.3
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: fe80::10a4:20ff:feb1:c3da/64
    routers: fe80::10a4:20ff:feb1:c3da/64
    domain_name_servers: fe80::10a4:20ff:feb1:c3da/64

bind:
  master: False
  ipv6:
    listen_on: ::1; fdf3:2049:5152::a22:3; # localhost; freifunk
  ipv4:
    listen_on: 127.0.0.1; 10.34.0.3; # localhost; freifunk

network:
  bridge: # 02 local 42 ist "Wayne" der Rest 10.34.0.2 in hex!
    hwaddress: 02:42:0a:22:00:03 # Die HW-Adresse ist Freifunk-spezifisch
    address: 10.34.0.3 # User Freifunk-Netzwerk IPv4
    netmask: 255.255.0.0
    address6: fdf3:2049:5152::a22:3 # User Freifunk-Netzwerk IPv6
    address6mask: fdf3:2049:5152::a22:3/64
    netmask6: 48
  mesh: # 02 local 00 ist "Wayne" der Rest:10.34.0.2 in hex!
    hwaddress: 02:00:0a:22:00:03
  primary:
    interface: eth0
    address: 89.163.130.241
    address6: 2001:4ba0:fff4:9b::4/64

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
      =7CWE
      -----END PGP MESSAGE-----
    dnn.key: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2
      
      hQEMAzfCuITl4pqUAQf8CyOXy20QSocfcbuECEXn+KAT6eNzSFwwgtbzIvsAHoE6
      I8QqsJNXHnFNWxXTbpOIHJdAfTxshrT/rHIHy5JH5dnKd1iCNMA6CFSWMpuKOF9T
      UCiuLVY39RRrkGnzwdnjEG4CAnKvXcSeO8Wbfl4n32SOg+Tp7YjLRDzz94F8HZv9
      EC85MifmCp3FjUE6HUROyQ6Q/bTBfhJo5UPjdAXXBGwu7AqIJNw9jkbKb0ErewlS
      J4JiPTehSAc9sVtWURQJ9i4Ei71G5Zruxy3y95scv705R6rddEPpZvdYD4Q7Ck3e
      xcCqi1kyn3fzk2BpAqi4ow3jYp3C8ywvY6a63qlj59LqAbRmURvHVyN2HwSKfXS+
      SbN2JRSCVOapRCJP3DeGTlXoCn0YSjP4AMaOlVmfr6q9EQbMSqxfHeRGXFjlWuAy
      nmPQATAaT2eOljM4nsCDg+4F8QzRrCLpPuJQsXDIBDil//UqXX3hHJ6fQCRQe1pu
      RdU288sdFIXpjNbFmBw5j20PFoGqxFsELWI+XMQqA+XQQNorrSZQAUEWHi+tZrR0
      iMoI1mkPgt2cH2LRlDgUBwXvX/FJljQVmAvLclIioNmNuOEkLW59VDaFBG35lYlS
      kjVztm6hFPQCJ2bzu1CcLSZxlT4NZzNvJMzf4eVWcYl5JPPCRUlA5kFLA5Uerpi9
      HLESBG8BX1UYlfUsKMX1bUdoy26CbqkTJlX6/qxD7odKKDnZmv/e/CMTm0EVqAdW
      21QwEZeI7bUkAr4j4GfMrI/HNw86c23qKJhPG+lmOAboJxtP2BmEgrjymsmTFU6Z
      YikQ95Fm3ecEY2OofMKvsNnpem3LzjpmlvUSKRSmydvHLrAleVJ8tWho0cXen5yM
      SxBkB+J02A803u5I00tIN2/QkA+4f16LzuXMEsRMzLquDJUgR5gmB5Kvd97OCdEJ
      9TlOXTRlASdeIiJnyz4qbcdJK7Eh8MPLL8Xw68R6DKZxtC2s7rVDMG058AoE9sO3
      o0SY/8X1rIWGWpuxFBwnPaS7h5OHoF4umdOVs1hFMdNNbM6f+J1kgX472nerA2m9
      6TVKVZMmnGxWbLdp4BoN/piogjXkPjs9rSKssb+hcD7quajoRAoDqiiN0wSGqJfl
      tQRWTzmy6vB2M2HYtKsFgN3s1pn8e5yZTHR1rPCPz51Q1f4whbYVt8k6Y41SlOLq
      M9mFPBTqWOwlYTe08g7SmDAJVpfCE4vsCxfKAdUz8OC64fndmmWNl7Ywow789LvC
      fGHp2OfIJyRze+TXDIDXOD0+w1I4lBW2ZibcJYH/hF41246dF2vu1qLWO2drDk8P
      9kI4n54eQ/Y1ORczkNqsuw+gAfeY9XbZ7OvEzzW4QDW1F5nBhk9zvW7T8skJIVpC
      aw/O6BIO+q/3xYljJms0t1s+YgqPkDjlxvTUxrAJlL6494QALp7QCxTWhoq48RET
      1mOfqIGMKhFf2Wdam6OoHs3Ciw6YwJlLdQb17Meq+a88rn1qHtzOI4YPlWxgHbTf
      vRMd4vhw35/tVvm9OYDcnuLRUJDe1YuHH3/LeQ8sy6lmFCk6foOOBIeHSIG2ihOA
      ir5BCb9S3Qfjzfee/lR609g1YestnkmIEL8D9StmqpFGqc/cyUMpjmj+enoBAIpq
      CJj0QBIjHx0k9f0/MoCPbo88aCvJ+HqGdDt+l7TPtWgutswar4qJ6lCdRSkylYwn
      s8Cowcv4mAeeorkOe/FD9Tt1ubmptr469xjcP+MawXkdaXaFhTB4pX2sYDt7rYdO
      1ot7PoEF2yVwO35YTzKjQclfPH5u78/0X+oiikypvJpp8vHNDPwDBJ57iiqyaNZs
      xmIqGlr2Uy2cF6Te36i4p782bcJCR8366rrYBDPdWSBVq1eZvP7viLnWt/Ip8461
      p1MeAxX6Z8jt2E57jesVucxMBYc/plwn8YA6aEOxGWZLgST62vjbpKfhuE2e9xBy
      LGcm/96uEcURGibBGOORq05IsyEqrbbCSRwKDtsUuoG+OQTavGofwQY5rOkHrNHI
      eXSUY2gsfD7bjm54UeXlnH1o1Qa7XTZY3s2DwCOR6u2dzo/XIX8p8vNuGwwJOTKK
      6jdm/VvK/tQ7YdYm4aEOKN/i05/x9cuJBqFCp3kykChZ/DiJDuK3MPOFiYGFGScb
      Z7kbizWhd5m9UoPxqcg8sNsOqJcX5Mr3rm8u
      =I67A
      -----END PGP MESSAGE-----

fastd: # Secret key von gw3 - nur den string!!!
  secret: |
    -----BEGIN PGP MESSAGE-----

    hQGMAy+gZA9xYWKnAQv9Efr2inW0VGsM8hlNQ07vRm7oJgnFIVhlxlGwK0XNEabm
    xT9zCvw4VW8hIOT4I+krOBeQMkUx7u4LFd6ok/aFxRS62/SpdUxbyyrgyNxA3jlJ
    OHGC4vVGLb0pwRRqJmDd1rP3tEog/OcyFJOIluxqadoeFcgM9NSkVRzSNO01P5L2
    CI8KIgOHNVICcLTMOKLWAf88oNChVxwbIGix+hugMK6gTlLfE9NJZnmtYdQLJMS7
    5p6+GmZVgOZFROSwWE/+Mdhx3l4vY+kUVOqaC77aky1703M3l8COOpeXGaE+fwgJ
    oZ2O9RvJVKyBMMcKOuU5YYmoOXLdUbhIpfgU8fIP1LIupDDfaxcI0Tvy+UIFHn9T
    Q8l7aDvjKfgSKt8CkI1AbGa4dNKW9y+ygsYiR5Hn/Jq3OpTE6LBYUwhkoh+93PjU
    ge0mJSG0sJBvkzP75PKsyu7mkM12o1i0S36VRo8yEIMAxaD1TwCMuPbb6BoGoMOL
    lJj1t/LBc9aZ9bb8Qs180nMBE22S74j/BjOfwjbh85jmWXERN6HHRw+kIpDovLGV
    OVQZvc9f5AK2FqX4Q4LEQ60FWUL3yQYs7acCA0IBOTcE5SJByvcb+QM9GNd6bNiI
    XU8B8ly7nLfAX1ArwMSrnx0BamHv9ogkzgLa0XmT09yj8TLZ
    =aiYB
    -----END PGP MESSAGE-----
  public: 6b9c2bbe6b90fef3c8046c8551a0681a8b3bf24c8fd9e87d12dd1bdcf2f38d1c
  fqdn: gw3.herford.freifunk.net
