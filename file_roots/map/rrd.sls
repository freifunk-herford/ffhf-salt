{% set rrd = salt['grains.filter_by']({
  'Debian': {'pkg': 'rrdtool'}
}, default='Debian') %}

{{ rrd.pkg }}:
  pkg.installed:
    - name: {{ rrd.pkg }}
