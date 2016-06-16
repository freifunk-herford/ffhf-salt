# vnStat and vnStati

{% set vnstat = salt['grains.filter_by']({
  'Debian': {'pkg': 'vnstat', 'srv': 'vnstat'}
}, default='Debian') %}

{{ vnstat.pkg }}:
  pkg.installed:
    - name: {{ vnstat.pkg }}
  service.running:
    - name: {{ vnstat.srv }}
    - enable: True
    - watch:
      - file: /etc/vnstat.conf

/etc/vnstat.conf:
  file.managed:
    - name: /etc/vnstat.conf
    - source: salt://gateway/etc/vnstat.conf
    - user: root
    - group: vnstat
    - mode: 644
    - require:
      - pkg: {{ vnstat.pkg }}

{% set vnstati = salt['grains.filter_by']({
  'Debian': {'pkg': 'vnstati'}
}, default='Debian') %}

{{ vnstati.pkg }}:
  pkg.installed:
    - name: {{ vnstati.pkg }}
