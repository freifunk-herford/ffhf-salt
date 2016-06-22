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
      {% if pillar['bind'].get('master', None) %}
      - file: /var/cache/bind/db.xxxxx
      - file: /var/cache/bind/db.xxxxx.in.adr-arpa
      - file: /var/cache/bind/db.xxxxx.in.adr-arpa
      {% endif %}

{% if pillar['bind'].get('master', None) %}
/etc/bind/named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - source: salt://gateway/etc/bind/named.conf.local
    - defaults:
        acl_internal: {{ pillar['bind']['ipv4']['acl_internal'] }}
        acl_internal_v6: {{ pillar['bind']['ipv6']['acl_internal'] }}
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: {{ bind.pkg }}

/etc/bind/named.conf.options:
  file.managed:
    - name: /etc/bind/named.conf.options
    - source: salt://gateway/etc/bind/named.conf.options
    - template: jinja
    - defaults:
        listen_on: '127.0.0.1; {{ pillar['network']['bridge']['address'] }};'
        listen_on_v6: '::1; {{ pillar['network']['bridge']['address6'] }};'
        allow_recursion: '127.0.0.1; ::1; internal;'
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: {{ bind.pkg }}
{% else %}
/etc/bind/named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - source: salt://gateway/etc/bind/named.conf.local
    - template: jinja
    - defaults:
        acl_internal: {{ pillar['bind']['ipv4']['acl_internal'] }}
        acl_internal_v6: {{ pillar['bind']['ipv6']['acl_internal'] }}
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: {{ bind.pkg }}

/etc/bind/named.conf.options:
  file.managed:
    - name: /etc/bind/named.conf.options
    - source: salt://gateway/etc/bind/named.conf.options
    - template: jinja
    - defaults:
        listen_on: '127.0.0.1; {{ pillar['network']['bridge']['address'] }};'
        listen_on_v6: '::1; {{ pillar['network']['bridge']['address6'] }};'
        allow_recursion: '127.0.0.1; ::1; internal;'
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: {{ bind.pkg }}
{% endif %}

# /etc/default/bind9
