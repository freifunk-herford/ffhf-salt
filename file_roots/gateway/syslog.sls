# Logging

{% set syslog = salt['grains.filter_by']({
  'Debian': {'pkg': 'rsyslog', 'srv': 'rsyslog'}
}, default='Debian') %}

{{ syslog.pkg }}:
  pkg.installed:
    - name: {{ syslog.pkg }}
  service.running:
    - name: {{ syslog.srv }}
    - enable: True
    - watch:
      - file: /etc/rsyslog.d/50-default.conf

/etc/rsyslog.d/50-default.conf:
  file.managed:
    - name: /etc/rsyslog.d/50-default.conf
    - source: salt://gateway/etc/rsyslog.d/50-default.conf

/etc/rsyslog.d/99-blackhole.conf:
  file.managed:
    - name: /etc/rsyslog.d/99-blackhole.conf
    - contents: |
        # This file is managed by Salt, do not edit.
        local6.*	/dev/null
