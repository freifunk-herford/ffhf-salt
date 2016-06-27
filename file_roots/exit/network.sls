# /etc/sysctl.d/99-salt.conf
net.ipv4.ip_forward:
  sysctl.present:
    - value: 1
