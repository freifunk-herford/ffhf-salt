base:
  # '^gw*.herford.freifunk.net$':
  #   - match: pcre
  #   - ffhf.openssh
  #
  # gw1.herford.freifunk.net:
  #   - gateway.batman
  #   - gateway.fastd
  #   - gateway.iptables
  #   - gateway.dhcp-server

  'gw*':
    - match: pcre
    - gateway.bird
    - gateway.dns-server
    - gateway.dhcp-server
    - gateway.iptables
    - gateway.vnstat
    - gateway.batman
    - gateway.fastd
    - gateway.openvpn
    - gateway.radvd
