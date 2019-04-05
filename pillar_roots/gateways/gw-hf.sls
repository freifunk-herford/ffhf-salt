# Gateway Herford

dhcp:
  ipv4:
    routers: '10.34.0.10'
    domain_name_servers: '10.34.0.10'
    ntp_servers: '10.34.0.10'
  ipv6: # Not used yet
    subnet: 'fe80::/64'
    name_servers: 'fe80::a00:27ff:feee:ec3f'
    routers: 'fe80::a00:27ff:feee:ec3f'
    domain_name_servers: 'fe80::a00:27ff:feee:ec3f'

bind:
  master: False
  ipv6:
    listen_on: '::1; fdf3:2049:5152::a22:10;'
  ipv4:
    listen_on: '127.0.0.1; 10.34.0.10;'

network:
  bridge:
    hwaddress: '02:42:0a:22:00:0a'
    address: '10.34.0.10'
    netmask: '255.255.0.0'
    address6: 'fdf3:2049:5152::a22:10'
    address6mask: 'fdf3:2049:5152::a22:10/64'
    netmask6: '48'
  # mesh:
  #   hwaddress: '02:00:0a:22:00:0a'
  primary:
    interface: 'eth1'
    address: '78.94.9.77'
    # address6: # Der Server hat keine IPv6 Adresse

exit:
  type: 'gre' # Verschiedene Arten sind moeglich "gre" oder "openvpn"
  provider: 'ffrl' # Verschiedene Provider sind moeglich
  ffrl: # Freifunk Rheinland Backbone
    bb-a.ak.ber:
      interface: 'bb-a-ak-ber'
      address: '100.64.4.205'
      address6: '2a03:2260:0:a9::2/64'
      dstaddr: '100.64.4.204'
      netmask: '255.255.255.255'
      # local: '<ipaddress>'
      endoint: '185.66.195.0'
      ttl: '64'
      mtu: '1400'
      mode: 'gre'
    bb-b.ak.ber:
      interface: 'bb-b-ak-ber'
      address6: '2a03:2260:0:aa::2/64'
      netmask: '255.255.255.255'
      endpoint: '185.66.195.1'
      ttl: '64'
      mtu: '1400'
      mode: 'gre'
    bb-a.ix.dus:
      interface: 'bb-a-ix-dus'
      address6: '2a03:2260:0:ab::2/64'
      netmask: '255.255.255.255'
      endpoint: '185.66.193.0'
      ttl: '64'
      mtu: '1400'
      mode: 'gre'
    bb-b.ix.dus:
      interface: 'bb-b-ix-dus'
      address6: '2a03:2260:0:ac::2/64'
      netmask: '255.255.255.255'
      endpoint: '185.66.193.1'
      ttl: '64'
      mtu: '1400'
      mode: 'gre'
    # bb-a.fra3.fra:
    #   interface: 'bb-a-fra3-fra'
    #   endpoint: '185.66.194.0'
    # bb-b.fra3.fra:
    #   interface: 'bb-b-fra3-fra'
    #   endpoint: '185.66.194.1'

openssh:
  sshd_config:
    - 'UsePAM yes'
    - 'PermitRootLogin no'
  ssh_auth:
    user:
      root:
        iwo@1337book.localdomain:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCYyi0aw9S+i1Hye5EE9fX9l+VJhxW4RExw/zzxpB2PeECOMRRoZqhNSntkjuGLCKFf3Pdehcj8h3obGIhbut2p2IUzpa3YQi5VMVyVzRLs0roTq47mUYvV1Prcds3ejHRzrSc1skY5Js7goIOHUfNOPtEJj/QUy8typ9pnoqgzAdcIDSGDnnb3tD12zWKQ3v8byJTYfje5vggU6i0W2xwx2+lGpY0uSruTkeShAM0f1Mc1T9JaWjP2YhUs2YLRo0kj3Gd2FU75jktWq8IJDplW+5JTPW7tAJb+jgGlPtOxcopXvUjyj55EDwub3BzDzO67SWIEQIImKgs9PzRa3VpX'
          enc: 'ssh-rsa'
        sven@s09:
          key: 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6Ncid0MsK9bAtLX4jqwADdHMn6P1IbJRiYz3KjVJcziQeSlnNaEtg/aDteW2iEvPYw0PqZpk5XAwVD4RZsMfRFaUop9kIJx1K54Cx2Njo5OkcCBaXeK6cBOgVLXyo5/0OhEApM6zrIgaTtNZjURkLp00lxeBARRXjHE4us7Hxg8tCtar6Gh5K5XzEoBoUhWYAPSjhisyBCSc/eBCPvwtrAiOW5tJ1VfQ+HoJwNxnG+rbieR6TLoIUeye9ZHmMr0eNW7/KeMJdzRo9vtjU53aPH+7SLwkBEdf3HwIbCm3b9VzDDR+/1qg7VvFzj1duzv5iOBdRu3duyicW9NNkUh/1w=='
          enc: 'ssh-rsa'
        sven@osics5:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDoVluxv7IpZRuWAUsJo+Mqh7pE4r8716t0+enVhOxbEFjIbphQw3EHZe8ciXtImLqZmFuGfMS0ll+UY+yr6VAqy4kFyPC8fFunpKOZilhc7evU5esyRJ1tnltZuASHIHP96UDNkTZJmV0/34Kg6aYand1L5YZ2TSU02LWS5qzAfBrvC1MzkTx5Ny9k56Id07eyTak/xUbq1yHpg1I5XVp0sQKO5H98Pq0V9vRY4ZzzMzE4yw22DpNAwTdtvPcSMMQ/YIJUh0MgcUbrbGNXAfakQtxAu6MxhLhFkjFh2clxfg1F9ecYsLQrVX8lnt/KvTcfziSbM2WWKjoPQtH0jEnM5h+ME2Ve9LOmfewnK/5aesFUzov6dtjOFeCu/Ko0h/xxjM+YUqp3t6sXgj6sB2ba34F94YK5nDPFxEFKJeXSWDn/N08/zhS59j4oyW4BS3jVvIa5wJkGIwyZAF7yQtM8bWmgTa9OTAsriXT8J1CSFCQPMuBRZG8nKN7kXjjM4eE='
          enc: 'ssh-rsa'
        freifunk@backups.homelinux.org:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC1938av1T7ITtiLEvvq7uo/Ybqaz0JLNQ7aeu5tiY+onzg1NugEJYHAWAz8YzSbP3K5gXnLISvgVm/plULThifhKHTxReG9nH0FZGbj4xgCk2rfCdyB6OiE6Do/MriLu3RcyBDBWZOpb+qbOZmD6pYk6HB7hDXibSDFAcDcKHJwx4uHyN2+aMLJu5pE7o8XLIxHDrz/sCvmRgVYo3T2kmwjin1sxnA8q8ivOzsLJjKoAn0ue3PMxx7O3hTxp45GGfErqdquqg6zXWKyJ9Ko0gOxxwXgX0C4Rao1p/H4ELGL1JxpMyPN1efPANdwW5qU2dFVy/nO7yzLG6iwK6M0BhDkLgOwrigcZmuZ1CgsQlyPOdH4HGhTmAuJe7kBJJWM61mMizninTI61Y0P4VvEaPYcZmJoWdlI0rAtWozxm2Dv50NPnVBZR7+sdXgDgPI9QRBA0QtW4fZYimwYARwyLMj1Wb5Xzol+muETFDksScCKo+2l3P8f3XEZgdgzY+wmH2Y26j+BuQGont3N+I0PkuULelnHoJlxBewDyb/u0KJwsYVWvPNJ2zzNVG5owbzT+tk6sCwy/vKUTQXbA9czXqqYJDmCqjF4lgG8Pd3COO4r0QeEVve5ZSDsPqHDhGLcxLQfSH0jaVrG8335I0obYuXo0bJm6yaY5mBdbW7vsvUeQ=='
          enc: 'ssh-rsa'
        felixannen@web.de:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDTPilqWfeYXAz3+MtQvVTrxXtLxyWoQdEDtyFkUVONNlqZ0yZfsKlFbuf10JME5y+Hd9THgiB5xh0Ir8fUJVN6JMCvdaaG293L7VK8tlyogcKbGN3aOdDmI3AsDK1ir4F1ZsbiZr/xcypXdWKCWsqgj2QaOS27oJFYCBlyTmdazPxEP/7BkZvDiFaU08kJuESwtCedvmT1BRNrsm73qsnlxsMI9SIg+tba+GPyQ97G7W864w5iimloNtIuETfIvEFjEZczWBEuLb2+kNkSWjgCguacp6iRyO0+Ho0H7YiLc/xGaCqvyDwNvIuXWfNzcYJcjQQbAxb9Vtu3Dc2Qlaib'
          enc: 'ssh-rsa'
        sven@ThinkPad-T430-protected:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDFxPbd2/4E9ukHmZt1yAMN6X+mDYORg0lgYle2WjftPhtkz9i9V4T1TecgNwGGl2bDU1p2HxjI30ynauYGHBDVymj7uN2V+OMDiwOAW7m7Bp+fR6gDSMdQYgQhkhmUq8B78f01VjZYu/NoL9ner9W9Y56EdNwW85KoqMw2811PkQH/CxyNLmXHXjOhcHvIjRnFA4BWwNlbqfyUsn22/AxPFL3uDxwg8rtO2GkXILlgTD/sz0jJsN2pQsq7HYKRvoRyTy83b01Dialap+cBM+j9EIirx3riHpBE3T/1/r3VrFDfvwK7OBj/qVt3YGxXE0l67J9N4UNhsK7mW6MhocyZgAK6XzY6qrGbMJ3cDmj4S6KhyB0DgQGw2L3bwpwH0BmMcSBoptwiaw6C50tatatCICVrEKsHhNzCNOHKAbKGCDNyaB7asOcqWkpkSjUcKZemS3jetTKKZ6PJu5chu2EH61ZuZkT1gG7f2W+1zRsgu1PeLsa+oAIxHB91rpS6AqFpoX+VBbGHuLj0mI9S/zytx6NlUcAu+W4uZa80XQSTo2opmOXiRLwSDwWPzEayGkxQSUcWoUuUXbrLq8jabRirfZ0z26DSGEiDEZZbhb1uq67KG6Zack7Fk87bO3Kblf3s4W09rNtyeUndPcHrO3bnwdIFJkZ4F/i14CiRQcwiRw=='
          enc: 'ssh-rsa'
        root@ff-salt:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDbxiM391fPpi7eomRqvLGzEIv3GCOBNyzBf/m2Hmv0WdU3NaCPDPcODm3TJQ37Q5ABNN94lOtA3i8n1IfhbsT4/RvlKoc8kqXDAKn0I4fUE5uSq1pDQxSLm3fSRRn3O4ppWJIDv2YLz8x/AAsDOebLVMG6dgeCU7Q2OrOmRr7z1qdoHdzSeo0wxydfeYJnT9VrFlLCEXtd+/Lc8y5rk0WsWf8BVPpIZMsXXq9BjPrJfVrWxye/k96lU2dwdStAjIVnEZ9txRgJRFGkNeG/GKuc8Q2png9n/1hFEOow6VQ7afiPDc7c67jxdsfg3Ke0MrlMAw14E4gDQ2atarEKHhVL'
          enc: 'ssh-rsa'
