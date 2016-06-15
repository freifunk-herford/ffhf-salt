# Network Interface DHCP

{% if grains['os_family'] == 'Debian' %}
# /etc/network/interfaces
{{ pillar['network']['interface'] }}:
  network.managed:
   - name: {{ pillar['network']['interface'] }}
   - enabled: True
   - type: eth
   - proto: none
   - ipaddr: {{ pillar['network']['ipaddr'] }}
{% endif %}

# Network Bridge

# Forwarding
# IPv4
# Affects:  /etc/sysctl.d/99-salt.conf
# Validate: sysctl net.ipv4.ip_forward
net.ipv4.ip_forward:
  sysctl.present:
    - value: 1

# IPv6
# Affects:  /etc/sysctl.d/99-salt.conf
# Validate: sysctl net.ipv6.conf.all.forwarding
net.ipv6.conf.all.forwarding:
  sysctl.present:
    - value: 1
