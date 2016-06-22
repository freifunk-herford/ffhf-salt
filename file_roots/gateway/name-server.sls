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
        listen_on: 'Todo: 127.0.0.1; ...;'
        listen_on_v6: 'Todo: ::1; ...;'
        allow_recursion: 'Todo: 127.0.0.1; ::1; ...;'
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
        listen_on: 'Todo: 127.0.0.1; ...;'
        listen_on_v6: 'Todo: ::1; ...;'
        allow_recursion: 'Todo: 127.0.0.1; ::1; ...;'
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: {{ bind.pkg }}
{% endif %}

# /etc/default/bind9
