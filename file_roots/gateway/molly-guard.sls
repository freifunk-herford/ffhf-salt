# Molly-Guard

{% set molly = salt['grains.filter_by']({
  'Debian': {'pkg': 'molly-guard'},
}, default='Debian') %}

{{ molly.pkg }}:
  pkg.installed:
    - name: {{ molly.pkg }}
