# NTP (Network Time Protocol)

{% set ntp = salt['grains.filter_by']({
  'Debian': {'pkg': 'ntp', 'srv': 'ntp'}
}, default='Debian') %}

{{ ntp.pkg }}:
  pkg.installed:
    - name: {{ ntp.pkg }}
  service.running:
    - name: {{ ntp.srv }}
    - watch:
      - file: /etc/ntp.conf

/etc/ntp.conf:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://gateway/etc/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: {{ ntp.pkg }}
