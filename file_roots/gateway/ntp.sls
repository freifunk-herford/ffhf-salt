# NTP (Network Time Protocol)

{% set ntp = salt['grains.filter_by']({
  'Debian': {'pkg': 'ntp', 'srv': 'ntp'}
}, default='Debian') %}

{{ ntp.pkg }}:
  pkg.installed:
    - name: {{ ntp.pkg }}
  service.enabled:
    - name: {{ ntp.srv }}
    - enable: True
    # - watch:
    #   - file: /etc/ntp.conf
    # - unless: test -f /var/run/ntpd.pid
    # - require:
    #   - pkg: {{ ntp.pkg }}

/etc/ntp.conf:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://gateway/etc/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: {{ ntp.pkg }}
    - listen_in:
      - service: {{ ntp.srv }}

# Show Status: ntpq -p
