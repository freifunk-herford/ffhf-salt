# Nagios Plugins

{% set nagiosplugins = salt['grains.filter_by']({
  'Ubuntu': {'pkg': 'nagios-plugins'}
}, default='Ubuntu') %}

pkg-{{ nagiosplugins.pkg }}:
  pkg.installed:
    - name: {{ nagiosplugins.pkg }}

usr-nagiosssh:
  user.present:
    - name: nagiosssh
    - fullname: Nagios
    - createhome: True
    - shell: /bin/sh
