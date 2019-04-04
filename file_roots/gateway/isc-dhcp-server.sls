# DHCP Server (Dynamic Host Configuration Protocol)

{% set dhcp = salt['grains.filter_by']({
  'Debian': {
    'pkg': 'isc-dhcp-server',
    'srv': 'isc-dhcp-server',
  },
}, default='Debian') %}

{% set dhcp6 = { 'srv': 'isc-dhcp6-server' } %}}

# IPv4
{{ dhcp.pkg }}:
  pkg.installed:
    - name: {{ dhcp.pkg }}
  service.running:
    - name: {{ dhcp.srv }}
    - enable: True
    # - watch:
    #   - file: /etc/dhcp/dhcpd.conf
    #   {% if grains['os_family'] == 'Debian' %}
    #   - file: /etc/default/isc-dhcp-server
    #   {% endif %}
    # - require:
    #   - sls: gateway.network

{% if grains['os_family'] == 'Debian' %}
/etc/default/isc-dhcp-server:
  file.replace:
    - name: /etc/default/isc-dhcp-server
    - pattern: '^INTERFACES="(.*)"$'
    - repl: 'INTERFACES="{{ pillar['network']['bridge']['interface'] }}"'
    - not_found_content: 'INTERFACES="{{ pillar['network']['bridge']['interface'] }}"'
    - append_if_not_found: True
    - require:
      - pkg: {{ dhcp.pkg }}
    - listen_in:
      - service: {{ dhcp.srv }}
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
# IPv6
{% if pillar['dhcp']['ipv6']['enable'] == True %}
{% if grains['os_family'] == 'Debian' %}
# /etc/default/isc-dhcp6-server:
#   file.managed:
#     - name: /etc/default/isc-dhcp6-server
#     - source: salt://gateway/etc/default/isc-dhcp6-server
#     - user: root
#     - group: root
#     - mode: 644

/etc/init.d/isc-dhcp6-server:
  file.managed:
    - name: /etc/init.d/isc-dhcp6-server
    - source: salt://gateway/etc/init.d/isc-dhcp6-server
    - user: root
    - group: root
    - mode: 755
{% endif %}

{% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
/etc/systemd/system/isc-dhcp6-server.service:
  file.managed:
    - name: /etc/systemd/system/isc-dhcp6-server.service
    - source: salt://gateway/etc/systemd/system/isc-dhcp6-server.service
    - unless: /lib/systemd/system/isc-dhcp6-server.service
    - user: root
    - group: root
    - mode: 644
{% endif %}

{{ dhcp.srv6 }}:
  service.running:
    - name: {{ dhcp.srv6 }}
    - enable: True
    # - watch:
    #   - file: /etc/dhcp/dhcpd6.conf
    #   {% if grains['os_family'] == 'Debian' %}
    #   - file: /etc/default/isc-dhcp6-server
    #   {% endif %}
    - require:
      - pkg: {{ dhcp.pkg }}
      {% if grains['os_family'] == 'Debian' %}
      - file: /etc/init.d/isc-dhcp6-server
      {% endif %}
      {% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
      - file: /lib/systemd/system/isc-dhcp6-server.service
      {% endif %}

{% if grains['os_family'] == 'Debian' %}
/etc/default/isc-dhcp6-server:
  file.replace:
    - name: /etc/default/isc-dhcp-server
    - pattern: '^INTERFACES="(.*)"$'
    - repl: 'INTERFACES="{{ pillar['network']['bridge']['interface'] }}"'
    - not_found_content: 'INTERFACES="{{ pillar['network']['bridge']['interface'] }}"'
    - append_if_not_found: True
    - require:
      - pkg: {{ dhcp.pkg }}
      # - file: /etc/default/isc-dhcp6-server
    - listen_in:
      - service: {{ dhcp6.srv }}
{% endif %}

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
      - service: {{ dhcp6.srv }}
{% endif%}
