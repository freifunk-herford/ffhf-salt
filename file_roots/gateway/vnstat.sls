{% set vnstat = salt['grains.filter_by']({
  'Debian': {'pkg': 'vnstat', 'srv': 'vnstat'}
}, default='Debian') %}

{{ vnstat.pkg }}:
  pkg.installed:
    - name: {{ vnstat.pkg }}
  service.running:
    - name: {{ vnstat.srv }}
    - enable: True

# /etc/vnstat.conf
