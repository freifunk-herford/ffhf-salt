# DHCP Server (Dynamic Host Configuration Protocol)

{% set dhcp = salt['grains.filter_by']({
  'Debian': {
    'pkg': 'isc-dhcp-server',
    'srv': 'isc-dhcp-server'
  },
}, default='Debian') %}

{{ dhcp.pkg }}:
  pkg.installed:
    - name: {{ dhcp.pkg }}
  service.running:
    - name: {{ dhcp.srv }}
    - enable: True

{% if pillar['dhcp']['ipv6']['enable'] == True %}
{{ dhcp.srv }}6:
  service.running:
    - name: {{ dhcp.srv }}6
    - enable: True
    - require:
      - pkg: {{ dhcp.pkg }}
{% endif %}

# Todo: Interface for IPv6
{% if pillar['dhcp']['ipv6']['enable'] == True %}
{% set pattern = '^(|#)INTERFACESv6="(.*)$"'%}
{% set repl = 'INTERFACESv6="%s"' % pillar['network']['bridge']['interface'] %}
{% endif %}}

{% set pattern = '^(|#)INTERFACESv4="(.*)$"'%}
{% set repl = 'INTERFACESv4="%s"' % pillar['network']['bridge']['interface'] %}
/etc/default/isc-dhcp-server:
  file.replace:
    - name: /etc/default/isc-dhcp-server
    - pattern: {{ pattern }}
    - repl: {{ repl }}
    - append_if_not_found: True
    - require:
      - pkg: {{ dhcp.pkg }}
    - listen_in:
      - service: {{ dhcp.srv }}
      {% if pillar['dhcp']['ipv6']['enable'] == True %}
      - service: {{ dhcp.srv }}6
      {% endif %}}

/etc/dhcp/dhcpd.conf:
  file.managed:
    - name: /etc/dhcp/dhcpd.conf
    - source: salt://gateway/etc/dhcp/dhcpd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        subnet: {{ pillar['dhcp']['ipv4']['subnet'] }}
        netmask: {{ pillar['dhcp']['ipv4']['netmask'] }}
        range_start: {{ salt['pillar.get']('dhcp:ipv4:' + salt['grains.get']('id', "") + ':range_start', "") }}
        range_end: {{ pillar['dhcp']['ipv4'][grains.id]['range_end'] }}
        routers: {{ pillar['dhcp']['ipv4']['routers'] }}
        domain_name_servers: {{ pillar['dhcp']['ipv4']['domain_name_servers'] }}
        interface_mtu: {{ pillar['dhcp']['interface_mtu'] }}
        default_lease_time: {{ pillar['dhcp']['default_lease_time'] }}
        max_lease_time: {{ pillar['dhcp']['max_lease_time'] }}
        min_lease_time: {{ pillar['dhcp']['min_lease_time'] }}
        log_facility: {{ pillar['dhcp']['log_facility'] }}
        server_name: {{ grains['id'] }}
        ntp_servers: {{ pillar['dhcp']['ipv4']['ntp_servers'] }}
        domain_search: {{ pillar['dhcp']['domain_search'] }}
    - require:
      - pkg: {{ dhcp.pkg }}
    - listen_in:
      - service: {{ dhcp.srv }}

{% if pillar['dhcp']['ipv6']['enable'] == True %}
/etc/dhcp/dhcpd6.conf:
  file.managed:
    - name: /etc/dhcp/dhcpd6.conf
    - source: salt://gateway/etc/dhcp/dhcpd6.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        subnet: {{ pillar['dhcp']['ipv6']['subnet'] }}
        server_name: {{ grains['id'] }}
        ntp_servers: {{ pillar['dhcp']['ipv4']['ntp_servers'] }}
        name_servers: {{ pillar['dhcp']['ipv6']['domain_name_servers'] }}
        domain_search: {{ pillar['dhcp']['domain_search'] }}
    - require:
      - pkg: {{ dhcp.pkg }}
    - listen_in:
      - service: {{ dhcp6.srv }}6
{% endif %}
