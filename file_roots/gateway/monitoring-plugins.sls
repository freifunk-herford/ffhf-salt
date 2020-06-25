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
