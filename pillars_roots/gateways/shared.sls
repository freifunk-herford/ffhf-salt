dhcp:
  subnet: 192.168.33.0
  netmask: 255.255.255.0
  {% if grains['id'] == 'gw1' %}
  range_start: 192.168.33.110
  range_end: 192.168.33.129
  {% elif grains['id'] == 'gw2' %}
  range_start: 192.168.33.130
  range_end: 192.168.33.149
  {% elif grains['id'] == 'gw3' %}
  range_start: 192.168.33.150
  range_end: 192.168.33.169
  {% endif %}
