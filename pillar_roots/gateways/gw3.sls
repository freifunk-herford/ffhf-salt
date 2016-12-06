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
    Version: GnuPG v1
    
    hQEMA9c3Y0Thoe2fAQgAqtNAkOMXtsWkzfb/kuku2FI2sRQ11mRvMB/1jKnEyupm
    lFGE7l3upq7ZV27j/Bt0StyWaUOBvXFHVWwySgJPIBewRY7jMOWz/kf/FYqhHGWl
    mmB0+o8k9c7R6U6WIZQDyV+MaZMy8n31AWbDHP579AGvxyeab00gOlKRrawWYs/Q
    k9xN6FkMrWh2iLNcC3ScQXcDEokJgDSFruvnqCxf//thgL+jWMWOikIdA0lPPheG
    r5Kxu3WlYvjFSNE6j2dB8JBX+uf0YguBS1wXanYBJpyR0rbOJOAaJ5a0sKcN4ayW
    q93xyVSqniompATt59/mrCc9P6NdAVxaAj0wMObZDtJzAbB0sY8pA+PZ5wPib5oP
    SxH1ASY2c7EOKM1VHVJyED5W9Ut8XpLmo8O1tFGMelGb8+SdsyVkwC/lsoIogjIJ
    21X7wWZgsYaQDOGL5RdpMWbCg3z28os+pblGciOrOmRPhQYLJlM0tKXrVJiVGRwW
    IA3SQw==
    =Rbsb
    -----END PGP MESSAGE-----
  public: 6b9c2bbe6b90fef3c8046c8551a0681a8b3bf24c8fd9e87d12dd1bdcf2f38d1c
  fqdn: gw3.herford.freifunk.net
