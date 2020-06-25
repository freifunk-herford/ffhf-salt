# Gemeinsame Daten

dhcp:
  ipv4:
    subnet: '10.34.0.0'
    netmask: '255.255.0.0'
    gw1:
      range_start: '10.34.64.0'
      range_end: '10.34.79.254'
    gw2:
      range_start: '10.34.80.0'
      range_end: '10.34.95.254'
    gw3:
      range_start: '10.34.96.0'
      range_end: '10.34.111.254'
    gw4:
      range_start: '10.34.112.0'
      range_end: '10.34.127.254'
    gw5:
      range_start: '10.34.128.0'
      range_end: '10.34.143.254'
    gw6:
      range_start: '10.34.144.0'
      range_end: '10.34.159.254'
    gw7:
      range_start: '10.34.160.0'
      range_end: '10.34.175.254'
    gw8:
      range_start: '10.34.176.0'
      range_end: '10.34.191.254'
    gw9:
      range_start: '10.34.192.0'
      range_end: '10.34.207.254'
    gw-hf:
      range_start: '10.34.208.0'
      range_end: '10.34.223.254'
  ipv6:
    enable: 'False'
  interface_mtu: '1350'
  default_lease_time: '300'
  max_lease_time: '300'
  min_lease_time: '300'
  log_facility: 'local6'
  domain_search: 'ffhf'

bind:
  zones:
    - 'ffhf'
    - '34.10.in-addr.arpa'
    - '2.5.1.5.9.4.0.2.3.f.d.f.ip6.arpa'
    - 'local-marta-herford.de'
    - 'audioguide.marta'
  trusted:
    - '127.0.0.1'
    - '10.34.0.0/16'
    - '::1'
    - 'fdf3:2049:5152::/48'
  masters: '10.34.0.32; fdf3:2049:5152::a22:20;' # das ist der MAP-Server als einziger DNS-Master ausserhalb der Gateways!
  # Test Daten Dummy DNS Master
  #masters: 10.34.0.2; fdf3:2049:5152::a22:2;

bird:
  myas: '64866' # Freifunk Herford ASN from Freifunk Rheinland

network:
  bridge:
    interface: 'hfBR' # br0
    netmask: '255.255.0.0'
    prefix: 'fdf3:2049:5152::/64'
  batman:
    interface: 'hfBAT' # bat0
  mesh:
    interface: 'hfVPN' # tun0/tap0
  exit:
    interface: 'exitVPN' # tun0/tap0
  intercity:
    interface: 'icVPN' # tun0/tap0

fastd:
  protocol: 'ipv4'
  port: '1244'
  socket: '/var/run/fastd.sock'

alfred:
  socket: '/var/run/alfred.sock'
  sock: '/var/run/alfred.sock'
  sitecode: 'ffhf'
  announce: True

apache:
  documentroot: '/var/www/vnstat'
  serveradmin: 'info@herford.freifunk.net'
  sslcertificatefile: '/etc/ssl/{{ grains['id'] }}/public/cert.pem'
  sslcertificatekeyfile: '/etc/ssl/{{ grains['id'] }}/private/privkey.pem'
  sslcertificatechainfile: '/etc/ssl/{{ grains['id'] }}/intermediate.pem'

openssh:
  sshd_config:
    - 'UsePAM yes'
    - 'PermitRootLogin without-password'
    - 'PubkeyAuthentication yes'
  ssh_auth:
    user:
      root:
        root@ff-salt: # Sven
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDbxiM391fPpi7eomRqvLGzEIv3GCOBNyzBf/m2Hmv0WdU3NaCPDPcODm3TJQ37Q5ABNN94lOtA3i8n1IfhbsT4/RvlKoc8kqXDAKn0I4fUE5uSq1pDQxSLm3fSRRn3O4ppWJIDv2YLz8x/AAsDOebLVMG6dgeCU7Q2OrOmRr7z1qdoHdzSeo0wxydfeYJnT9VrFlLCEXtd+/Lc8y5rk0WsWf8BVPpIZMsXXq9BjPrJfVrWxye/k96lU2dwdStAjIVnEZ9txRgJRFGkNeG/GKuc8Q2png9n/1hFEOow6VQ7afiPDc7c67jxdsfg3Ke0MrlMAw14E4gDQ2atarEKHhVL'
          enc: 'ssh-rsa'
        freifunk@backups.homelinux.org: # Sven
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC1938av1T7ITtiLEvvq7uo/Ybqaz0JLNQ7aeu5tiY+onzg1NugEJYHAWAz8YzSbP3K5gXnLISvgVm/plULThifhKHTxReG9nH0FZGbj4xgCk2rfCdyB6OiE6Do/MriLu3RcyBDBWZOpb+qbOZmD6pYk6HB7hDXibSDFAcDcKHJwx4uHyN2+aMLJu5pE7o8XLIxHDrz/sCvmRgVYo3T2kmwjin1sxnA8q8ivOzsLJjKoAn0ue3PMxx7O3hTxp45GGfErqdquqg6zXWKyJ9Ko0gOxxwXgX0C4Rao1p/H4ELGL1JxpMyPN1efPANdwW5qU2dFVy/nO7yzLG6iwK6M0BhDkLgOwrigcZmuZ1CgsQlyPOdH4HGhTmAuJe7kBJJWM61mMizninTI61Y0P4VvEaPYcZmJoWdlI0rAtWozxm2Dv50NPnVBZR7+sdXgDgPI9QRBA0QtW4fZYimwYARwyLMj1Wb5Xzol+muETFDksScCKo+2l3P8f3XEZgdgzY+wmH2Y26j+BuQGont3N+I0PkuULelnHoJlxBewDyb/u0KJwsYVWvPNJ2zzNVG5owbzT+tk6sCwy/vKUTQXbA9czXqqYJDmCqjF4lgG8Pd3COO4r0QeEVve5ZSDsPqHDhGLcxLQfSH0jaVrG8335I0obYuXo0bJm6yaY5mBdbW7vsvUeQ=='
          enc: 'ssh-rsa'
        sven@s17: # Sven
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDPLQxJE5ujmKxBQlAjjMphHIg/jdw2Vps3UYVTK3ov3N8JRV/sGpAxI61FH6kYGB1JN6GrTW9tkjAa6TZ9nQbBG4plR+oLXqeLWi58hMCbdXGHMvmr0lyhcmxo7Eo7cBE4m13F+hbSY4NIRS1W0wBGQYRfz7p1F2tADPrumPcxhEjZFpYjcumPjHcYL78nimC4f9ycOzTwmZkFRF/BalNBUVrIxH/hKkZvtfEoKVMa0PtawApdD6SuAf0FQbsVwQrbq1vvEBAmgTOX3OoVJOOn8uhBPvYO7ZffmvKI3hFNpN50YjDtDesGj7AyaFlR2Fb/y0ZK8dsptMQHQZaAGYC6k4EWQPslTORw8E2YMRfmfpBBoYZGMNZKSI6zjeougubeKtttGg660kHR6dp+y1KteziigB6L0mB+D/9+WhHUJiHorB3GBsH8ia9JjLnR54v1+3ZGnpXNg0IXVt3wWsu3LDBSbMD7U9k0Vnwsc4oGSgiuAG1faKaMFIdxCfNN/HfQyAGUL7UUryNKNMaLUnHDYPoIkE7v1IvZdT+OfIFoSEk4+Expn0gM+Opnu7qNBhlWRGO0dGp3tPzeSbhpXYf3LahWBclu1+J6YcCZHESw05JQ6XGzFEGqcec9E1THDQEl2P/sJkbo8sIDOBrxtkBz2cxC3Yz/J5CJ+WTDRaFcow=='
          enc: 'ssh-rsa'
        sven@ThinkPad-T430-protected: # Sven
          enc: 'ssh-rsa'
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDFxPbd2/4E9ukHmZt1yAMN6X+mDYORg0lgYle2WjftPhtkz9i9V4T1TecgNwGGl2bDU1p2HxjI30ynauYGHBDVymj7uN2V+OMDiwOAW7m7Bp+fR6gDSMdQYgQhkhmUq8B78f01VjZYu/NoL9ner9W9Y56EdNwW85KoqMw2811PkQH/CxyNLmXHXjOhcHvIjRnFA4BWwNlbqfyUsn22/AxPFL3uDxwg8rtO2GkXILlgTD/sz0jJsN2pQsq7HYKRvoRyTy83b01Dialap+cBM+j9EIirx3riHpBE3T/1/r3VrFDfvwK7OBj/qVt3YGxXE0l67J9N4UNhsK7mW6MhocyZgAK6XzY6qrGbMJ3cDmj4S6KhyB0DgQGw2L3bwpwH0BmMcSBoptwiaw6C50tatatCICVrEKsHhNzCNOHKAbKGCDNyaB7asOcqWkpkSjUcKZemS3jetTKKZ6PJu5chu2EH61ZuZkT1gG7f2W+1zRsgu1PeLsa+oAIxHB91rpS6AqFpoX+VBbGHuLj0mI9S/zytx6NlUcAu+W4uZa80XQSTo2opmOXiRLwSDwWPzEayGkxQSUcWoUuUXbrLq8jabRirfZ0z26DSGEiDEZZbhb1uq67KG6Zack7Fk87bO3Kblf3s4W09rNtyeUndPcHrO3bnwdIFJkZ4F/i14CiRQcwiRw=='
        sven@terra-1526: # Sven
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDTs3KA7WhzDeznjXEoSVZy7ZiZJOo7/nPznYMBmi64/7cXft5onbvZ2gOAOiMHqYE3Wbbg1QtFkdAdudPDAfsaBOojzj0N+WqCpYapOQzhdxBS6DNs4Q9whbvK1NXWnMgsZyQJjdvO9UNdQNm/9bSIssmriSCoxPssZCaZKGv7W1N28fVRDCU9yeRgOdAgBdyzpbRC5reMALEYncClXGPTrTKgl9EEvs9Z2EWTaW8atienJIZVQ2AeLvcBcPZpqNpoW7m3t4AREu2rBjQ305BAAvMi+7aISX4Cyo98fTOD5FuWQdKFtKjK1FpeS9F6MqpnWdtgYUj6WQDzVGlupfQZHGJFffPhorrVk3skbcCnsVc7gHZmDPvVi2+fW1G8JUGT7Vv+l1hMktmHYi/uqrtuPPlapwAVUSj9d2LmQEAyRnKCaeEfgGwpeQfk81e5k+uJm4vtNARXCbs8SSVBib/dpQvzP7XD5x+PVQpWH90/RuVE/4upPhc6eHbrIWA5hbxYV8Hcy8rG2gNxG55rhQAkcX/K9btYWkIfSFJdrUgqOQ2oQQIZWz5AEkgjk1DZ1eq0fdVu6FElGEVeDkSsYgTFv3u7PhE94kwT1RNTiAVWg5VkXigzvNON2hQAdJjcivjM+hGCPOKGV6IaW1O08k8B+/u7BiRljBKpzmGe9gv66w=='
          enc: 'ssh-rsa'
        sven@XinkPad-T61: # Sven
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC9It2o76e4kk2hDwmt9Sxf/hXgm8JlKsx1HUu+rTsUO6vdYiptaypYF0nNKKImK5VEn5RXEcYG0y5829ao4CVYadvZJBbWEv53E2qoyDwwlHWQ1ITOIzGrBc4F2gBQIvsObC0hoPLl+QH0mcMBsqOBfvyhlm1slZdQAPFEUi4bE1SlusKx/fU1Ka3swseuXE5veutg2gqSusw3nW1K8xXJFrmL8+A0PTt1TkB+9j3ZpZQ42BVUZ6hhfEeaiFZAcn8q189o0O+veLbHTdmr142fW0ge7La0YGdzGj/z2C5yH3PvpgIRyFNbCWn4w8W9EDCesmp76FxnRLg/0WrXHx4mFHYbPlEYV+obOasUADUtISjZWBM4n+HAEump8c7IqXkJuiCa/fx9E3w3o6eV8ItCDUVAJs8TbesBGShsy8CaVXmhZMBf/sKaxzokKIYlWHcUFuKWOYFSuh1yCrNvppz03DsF13fp3luuahNMUwfsaS7ZBIOdk9qFHecQT2q0MI0pCb/Ug9WOchx8ck12RjCSJJFZWlaWK7wUf7PiyICHVWzhsb5pnTKG/ugaRlsIYMbJ2gJLg0Y14tzb3eIfOwCmm95f669RTfrrLsBS/VqsOqCqKzTchD6dEeLBL0s0drDmAc3dUapdHWULf0z9NuSBw/F/0WEndf2sQr+94klfvw=='
          enc: 'ssh-rsa'
        sven@s10: # Sven
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+UiTSagsl6Z/Re/LIaAoarxTwN2pLR0AVB9ciSQRBwbcw+nDgc/5wcwoUJHBnpOtST9266b7pkRc8isqgJP9dpLWPfl/HJLoSnuAyz7IUBmO8KG0fL16vDp7dkU/Vl17uuIQTHG2tIvD9g+ezzsfB8kTt+isBJAKagFOgi1Vk20E60P3ErDCcyoDTcB52BCpubh24Hh99Q7/5gZ9HH0HjoivDp/VIZpusOIv8y1JNSkAmreEND35UImXOWTnxWHdeHo8nMU0vJ+77aK2fZYwoB9vYKaMALy0JBB8h8kSONxgTloK8yorUbRPWVveXdSBBQNKHBKG/SNBmep86lZ6L'
          enc: 'ssh-rsa'
        sven@s09: # Sven
          key: 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6Ncid0MsK9bAtLX4jqwADdHMn6P1IbJRiYz3KjVJcziQeSlnNaEtg/aDteW2iEvPYw0PqZpk5XAwVD4RZsMfRFaUop9kIJx1K54Cx2Njo5OkcCBaXeK6cBOgVLXyo5/0OhEApM6zrIgaTtNZjURkLp00lxeBARRXjHE4us7Hxg8tCtar6Gh5K5XzEoBoUhWYAPSjhisyBCSc/eBCPvwtrAiOW5tJ1VfQ+HoJwNxnG+rbieR6TLoIUeye9ZHmMr0eNW7/KeMJdzRo9vtjU53aPH+7SLwkBEdf3HwIbCm3b9VzDDR+/1qg7VvFzj1duzv5iOBdRu3duyicW9NNkUh/1w=='
          enc: 'ssh-rsa'
        sven@osics5: # Sven
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDKQb6sb6Mi+hV/Nwfkn4PRa9n9AXXiVV3zqKDw3kOPPz6z2n/+Ekf6GFefo3yZKmyuHEz5obbh/JmOAQQhdfN5PdpXyrPsWpXLco9it5GMvDbwH99S/JguEGruAasIx0bSWUdbGJJ48F0RQayXHNaBDgJ6UvXOSKyhOBH6+L/QKwmffTieycQzQsf/+2v5gRheIUkOOu8TV1i5UzUYLHB/MaG5K9hvTOShQXorrZynv3aEqc52EDjfv9OODxD9ka+8pcbfKVDxkd8Y0ay6q9ROZrSqS1UPfo81OiSHu7K3YHBMHGLWjsYRp8mTfpPVAz8si70ehcm0Qpoo0lnY6B2v'
          enc: 'ssh-rsa'
        rvincent@yukikaze: # Tobias
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD3PcTmrvdXPm1JwGs9SmI+bMCzMfC15zjsPfE/qajijhzMiJp+tZRj1g2hIWKESxhuTojdeJ1TataUDXk56Y/IRUGoKDqPEh4T7GsMOwBOsAz5lS3OdLpORlmyYWoGkEoOxzuMcPkyvq+xIYn7sB/IbVICwusVAb5Pc3Uv6aq3OIJrQYu/tmom/fI4GzOsYmE/1u/IjM6wUyU+7xYehuaIHb6an2uAXdosV0CmMAu2KgC2k+cWssgZ4DViALzfVICXJd38VI5E8R5AKnmVXHGGZeHe4eoxc1MQucWLS1ioiZaFU9ScIn2fmMJ5oNS0wZFJT3LpqvVLriTLTuPOpby3'
          enc: 'ssh-rsa'
        root@yuumura: # Tobias
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC1FQzlRXikqH0+EQYw0nz62nujHFocwScRup5EM17iqGtxZbJnHkrh+4dqxYz9z5x/tpRbmHmiImpp2kYjJe0hHH+hHX54G5v8YzlC5JDdR5Ps/kHG67h9upJO2Nr3IDEqV3iD9qdniJ4N1N5PjRf9Em8c2cehKuBrGrw0ra2o3a1O5ZU1cNn/jgyIcp6t0VfVx3k692ZeJWH13P4oRxD3qE3NsWVZ6uGRqXfrntmyFzsWnCI88ytH4T5auw+ACcD3oVnp9MJUYnmNpjdXnMKxDvZ0VfIkXGIJVctpksff9FGRyl720lzBYPsRDiRQLQ2udjgGf23/rUXTHWguKxhGbrEP82jlMyuRQKGZtgyl281OLRK/axJuVIKvylONI358kksOCFnFnBA3PzNrwUIwgj+sQNP8c1AMIqloEz3ryYBTHUU+/34bAJgBBoL/n13POMbqeMvYm5c2rtC1tlY42CcjwA29Bc6EltQCErDpnoMIjePN5yjJOUt6BA/WJw6rkGLGFucw55libfMdQIMs0gt2Chazgf+MLX2OCv601mctmPsmZX6rDRsAOhbN74WFE115o0zZLLM7NNliRuYPY/YFdDRvGwpIsSFfYJrwfwxRu16/Px3U7QoXF7npT/yx6wonLeGW9Rg8E+jJz4KhEmGhMKTg9W5pa/t8V0KFpQ=='
          enc: 'ssh-rsa'
        root@lmb: # Luca
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDUp+UFLlr3+pOJzCMb5yRGcK8if0Q8AkZSDHYi3+bC2SKmeb8gDC8e2vauSCiUViJ2hfxRelEXbVn3JmWpii3nREAA7xM2P3k2HzV9jfVzvBeGd/K42tUi4DjHb2mj514tZSFbL1Ans8Yu9CxABdgyRPKX1vWcWEcJFSV3E9g+Un79w/v6CcHI8kwpzDTFnZpAm2nvkw5bMB6OiKrBVTRjqwbqiSHFyaVUZwD+g91mOtxBOs46oDiiuqdCIb6T0HjPFs+bEL71ZXWcLZxHV+sLKMwmaqmpRB1NqtaH8EKsIHafIaxwA7dMuonbdexJ/olXHUmx+zayXHXHvTVtMDHZ'
          enc: 'ssh-rsa'
      nagiosssh:
        nagios@status:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDkHL4how15p4rZsGSPuCxSoXxReYhclFCAV2n1nbJ1KzrfNQU9rZW/E7nrT6S1NprHxV2zqzKzD/2uWIvqT1FMktVsPuRTgFoz0J+AienrWGBhG7/nsuL5DK/KHj3zOTvZjEItH6xqNbb09UW5n+VS7fli4+qBxjdKVTuT0isTkYKjHfQswiEwU9Qj20m033IdlP1zjgKsT0G85pGyD4Vzp4j3XDZ3lUrJUATkn5NVwJ1weEmD4/WQ8gfxucYgsiomsErvOuaI0y2Nj34yjSgo6JRKndny80Kx7J2s84Am2FbvIJ/36u+9P8EDbhN0j3rqk6lyQVpZL2G02I6OartP'
          enc: 'ssh-rsa'
        nagios@mimasu:
          key: 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC3VOahcWQZkO+0mGEUE6BAg21GSCoJ8b5Qh6PSaHMBJ892HVl3Oy5uyxm/lIlef6OcgLN3By+Bz6t9nECF3RyG3OC4iUhc/iU6Zpy7BOE+4WdlcJpycHaiiFiDomSOr6eq9a8wSbNSwcDdsZsJXgGElRfxc+QuoIEAFc7AtLismeaWbSKxQ5XwiJegW6UNQx0kVUFMjhV51EUiiF/MGvGPuUgvjuvIoCz6/9n3xa3U1g1TMyUH+GQ6zSlMInGFWxiAvEdWcUI2Od8kw1bP2Uq5wszWocdj9bbFM6NQ3Vejw8wpFh25BsDVxNtM1PSWIPQ8wgXTgcckNth1CQs32/mD'
          enc: 'ssh-rsa'


