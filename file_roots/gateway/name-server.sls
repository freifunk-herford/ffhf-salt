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
      - file: /etc/bind/db.{{ pillar['bind']['zone'] }}
      - file: /etc/bind/db.{{ pillar['bind']['ipv4']['zone_reverse'] }}
      - file: /etc/bind/db.{{ pillar['bind']['ipv6']['zone_reverse'] }}
      {% endif %}

/etc/bind/named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - source: salt://gateway/etc/bind/named.conf.local
    - template: jinja
    - defaults:
        master: {{ pillar['bind'].get('master', None) }}
        masters: {{ pillar['bind']['masters'] }}
        zone: {{ pillar['bind']['zone'] }}
        zone_reverse: {{ pillar['bind']['ipv4']['zone_reverse'] }}
        zone_reverse_v6: {{ pillar['bind']['ipv6']['zone_reverse'] }}
        trusted_v6: {{ pillar['bind']['ipv6']['trusted'] }}
        trusted: {{ pillar['bind']['ipv4']['trusted'] }}
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
        listen_on: 127.0.0.1; {{ pillar['network']['bridge']['address'] }};
        listen_on_v6: ::1; {{ pillar['network']['bridge']['address6'] }};
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: {{ bind.pkg }}

{% if pillar['bind'].get('master', None) %}
/etc/bind/db.{{ pillar['bind']['zone'] }}:
  file.managed:
    - name: /etc/bind/db.{{ pillar['bind']['zone'] }}
    - source: salt://gateway/etc/bind/db.{{ pillar['bind']['zone'] }}
    # - unless: test -f /etc/bind/db.{{ pillar['bind']['zone'] }}

/etc/bind/db.{{ pillar['bind']['ipv4']['zone_reverse'] }}:
  file.managed:
    - name: /etc/bind/db.{{ pillar['bind']['ipv4']['zone_reverse'] }}
    - source: salt://gateway/etc/bind/db.{{ pillar['bind']['ipv4']['zone_reverse'] }}
    # - unless: test -f /etc/bind/db.{{ pillar['bind']['ipv4']['zone_reverse'] }}

/etc/bind/db.{{ pillar['bind']['ipv6']['zone_reverse'] }}:
  file.managed:
    - name: /etc/bind/db.{{ pillar['bind']['ipv6']['zone_reverse'] }}
    - source: salt://gateway/etc/bind/db.{{ pillar['bind']['ipv6']['zone_reverse'] }}
    # - unless: test -f /etc/bind/db.{{ pillar['bind']['ipv6']['zone_reverse'] }}
{% else %}

{% endif %}
