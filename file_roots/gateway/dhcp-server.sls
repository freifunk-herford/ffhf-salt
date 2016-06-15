{% set dhcp = salt['grains.filter_by']({
  'Debian': {'pkg': 'isc-dhcp-server', 'srv': 'isc-dhcp-server'},
}, default='Debian') %}

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

{{ dhcp.pkg }}:
  pkg.installed:
    - name: {{ dhcp.pkg }}
  service.running:
    - name: {{ dhcp.srv }}
    - enable: True
    - watch:
      - file: /etc/dhcp/dhcpd.conf
      {% if grains['os_family'] == 'Debian' %}
      - file: /etc/default/isc-dhcp-server
      {% endif %}

/etc/dhcp/dhcpd.conf:
  file.managed:
    - name: /etc/dhcp/dhcpd.conf
    - source: salt://gateway/etc/dhcp/dhcpd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        subnet: {{ pillar['dhcp']['subnet'] }}
        netmask: {{ pillar['dhcp']['netmask'] }}
        range_start: {{ pillar['dhcp']['range_start'] }}
        range_end: {{ pillar['dhcp']['range_end'] }}
    - require:
       - pkg: {{ dhcp.pkg }}

{% if grains['os_family'] == 'Debian' %}
/etc/default/isc-dhcp-server:
  file.replace:
    - name: /etc/default/isc-dhcp-server
    - pattern: '^INTERFACES="(.*)"$'
    - repl: 'INTERFACES="{{ pillar['dhcp']['interfaces'] }}"'
    - append_if_not_found: True
    - require:
       - pkg: {{ dhcp.pkg }}
{% endif %}
