# DNS Server (Domain Name System)

{% set bind = salt['grains.filter_by']({
  'Debian': {'pkg': 'bind9', 'srv': 'bind9'},
}, default='Debian') %}

{{ bind.pkg }}:
  pkg.installed:
    - name: {{ bind.pkg }}
  service.running:
    - name: {{ bind.srv }}
    - enable: True
    - watch:
      - file: /etc/bind/named.conf.local
      - file: /etc/bind/named.conf.options

/etc/bind/named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - source: salt://gateway/etc/bind/named.conf.local
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: {{ bind.pkg }}

/etc/bind/named.conf.options:
  file.managed:
    - name: /etc/bind/named.conf.options
    - source: salt://gateway/etc/bind/named.conf.options
    - user: root
    - group: root
    - require:
       - pkg: {{ bind.pkg }}

# /etc/default/bind9
