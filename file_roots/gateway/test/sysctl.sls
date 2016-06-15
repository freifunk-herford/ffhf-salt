# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.sysctl.html

# /etc/sysctl.d/99-salt.conf
net.ipv4.ip_forward:
  sysctl.present:
    - value: 1
