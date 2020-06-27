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

pkgrepo-{{ speedtest.pkg }}:
  pkgrepo.managed:
    - name: deb https://ookla.bintray.com/debian {{ grains['oscodename'] }} main
    - distro: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/speedtest.list
    - keyid: 379CE192D401AB61
    - keyserver: keyserver.ubuntu.com
    - refresh_db: True
    - require_in:
      - pkg: {{ speedtest.pkg }}

{{ speedtest.pkg }}:
  pkg.installed:
    - name: {{ speedtest.pkg }}
