# Logging

{% set syslog = salt['grains.filter_by']({
  'Debian': {'pkg': 'rsyslog', 'srv': 'rsyslog'}
}, default='Debian') %}

{{ syslog.pkg }}:
  pkg.installed:
    - name: {{ syslog.pkg }}
  service.running:
    - name: {{ syslog.srv }}
