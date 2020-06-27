# Ookla Speedtest CLI

{% set speedtestcli = salt['grains.filter_by']({
  'Debian': {'pkg': 'speedtest-cli'}
}, default='Debian') %}

{{ speedtestcli.pkg }}:
  pkg.removed:
    - name: {{ speedtestcli.pkg }}

{% set speedtest = salt['grains.filter_by']({
  'Debian': {'pkg': 'speedtest'}
}, default='Debian') %}

{{ speedtest.pkg }}:
  pkg.installed:
    - fromrepo: 'deb https://ookla.bintray.com/debian {{ grains('os:distro') }} main'
    - file: '/etc/apt/sources.list.d/speedtest.list'
    - name: {{ speedtest.pkg }}
