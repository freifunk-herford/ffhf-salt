# Network

{% if grains['os_family'] == 'Debian' %}
/etc/network/interfaces.d/br0:
  file.managed:
    - name: /etc/network/interfaces.d/br0
    - source: salt://gateway/etc/network/interfaces.d/br0
    - template: jinja
    - defaults:
        address: {{ pillar['network']['bridge']['ipv4']['address'] }}
        netmask: {{ pillar['network']['bridge']['ipv4']['netmask'] }}
        address6: {{ pillar['network']['bridge']['ipv6']['address'] }}
        netmask6: {{ pillar['network']['bridge']['ipv6']['netmask'] }}
    - user: root
    - group: root
    - mode: 644

/etc/network/interfaces.d/bat0:
  file.managed:
    - name: /etc/network/interfaces.d/bat0
    - source: salt://gateway/etc/network/interfaces.d/bat0
    - user: root
    - group: root
    - mode: 644

networking:
  service.running:
    - enable: True
    - watch:
      - file: /etc/network/interfaces.d/br0
      - file: /etc/network/interfaces.d/bat0
{% endif %}

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
