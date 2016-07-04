# DHCP Server (Dynamic Host Configuration Protocol)

{% set dhcp = salt['grains.filter_by']({
  'Debian': {
    'pkg': 'isc-dhcp-server',
    'srv': 'isc-dhcp-server',
    'srv6': 'isc-dhcp6-server'
  },
}, default='Debian') %}

# IPv4
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
        range_start: {{ pillar['dhcp']['ipv4']['range_start'] }}
        range_end: {{ pillar['dhcp']['ipv4']['range_end'] }}
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

 # IPv6
{% if pillar['dhcp']['ipv6']['enable'] == True %}
{% if grains['os_family'] == 'Debian' %}
deploy-isc-dhcp6-server-default:
  file.managed:
    - name: /etc/default/isc-dhcp6-server
    - source: salt://gateway/etc/default/isc-dhcp6-server
    - user: root
    - group: root
    - mode: 644

deploy-isc-dhcp6-server-init:
  file.managed:
    - name: /etc/init.d/isc-dhcp6-server
    - source: salt://gateway/etc/init.d/isc-dhcp6-server
    - user: root
    - group: root
    - mode: 755
{% endif %}

{% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
/lib/systemd/system/isc-dhcp6-server.service:
  file.managed:
    - name: /lib/systemd/system/isc-dhcp6-server.service
    - source: salt://gateway/lib/systemd/system/isc-dhcp6-server.service
    - user: root
    - group: root
    - mode: 644
{% endif %}

{{ dhcp.srv6 }}:
  service.running:
    - name: {{ dhcp.srv6 }}
    - enable: True
    - watch:
      - file: /etc/dhcp/dhcpd6.conf
      {% if grains['os_family'] == 'Debian' %}
      - file: /etc/default/isc-dhcp6-server
      {% endif %}
    - require:
       - pkg: {{ dhcp.pkg }}
       {% if grains['os_family'] == 'Debian' %}
       - file: deploy-isc-dhcp6-server-init
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
       - file: deploy-isc-dhcp6-server-default
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
{% endif%}
