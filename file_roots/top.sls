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
    - gateway.network
    - gateway.ntp
    - gateway.bird
    - gateway.apache
    - gateway.dns-server
    - gateway.dhcp-server
    - gateway.iptables
    - gateway.vnstat
    - gateway.batman
    - gateway.alfred
    - gateway.fastd
    - gateway.openvpn
    - gateway.radvd
    - gateway.tinc
