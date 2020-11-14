# Monitoring Plugins

{% set monitoringplugins = salt['grains.filter_by']({
  'Ubuntu': {'pkg': 'monitoring-plugins'},
  'Debian': {'pkg': 'monitoring-plugins'}
}, default='Debian') %}

pkg-{{ monitoringplugins.pkg }}:
  pkg.installed:
    - name: {{ monitoringplugins.pkg }}

usr-nagiosssh:
  user.present:
    - name: nagiosssh
    - fullname: Nagios
    - createhome: True
    - shell: /bin/sh

/home/nagiosssh/check_service.sh:
  file.managed:
    - name: /home/nagiosssh/check_service.sh
    - source: salt://gateway/home/nagiosssh/check_service.sh
    - mode: 755
    - user: nagiosssh
    - group: nagiosssh

/home/nagiosssh/check_fping.sh:
  file.managed:
    - name: /home/nagiosssh/check_fping.sh
    - source: salt://gateway/home/nagiosssh/check_fping.sh
    - mode: 755
    - user: nagiosssh
    - group: nagiosssh
