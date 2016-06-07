base:
  '^gw*.herford.freifunk.net$':
    - match: pcre
    - ffhf.openssh

  gw1.herford.freifunk.net:
    - gateway.batman
    - gateway.fastd
    - gateway.iptables
    - gateway.dhcp-server
