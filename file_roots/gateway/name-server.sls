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
      {% for zone in pillar['bind']['zones'] %}
      - file: /etc/bind/db.{{ zone }}
      {% endfor %}
      {% endif %}

/etc/bind/named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - source: salt://gateway/etc/bind/named.conf.local
    - template: jinja
    - defaults:
        master: {{ pillar['bind'].get('master', None) }}
        masters: {{ pillar['bind']['masters'] }}
        trusted: {{ pillar['bind']['trusted'] }}
        zones: {{ pillar['bind']['zones'] }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: {{ bind.pkg }}
    - watch_in:
      - service: {{ bind.srv }}

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
    - watch_in:
      - service: {{ bind.srv }}

{% if pillar['bind'].get('master', None) %}
{% for zone in pillar['bind']['zones'] %}
/etc/bind/db.{{ zone }}:
  file.managed:
    - name: /etc/bind/db.{{ zone }}
    - source: salt://gateway/etc/bind/db.{{ zone }}
    # - unless: test -f /etc/bind/db.{{ zone }}
    - watch_in:
      - service: {{ bind.srv }}
{% endfor %}
{% else %}

{% endif %}
