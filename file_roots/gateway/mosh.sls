# Mosh (Mobile shell)

{% set mosh = salt['grains.filter_by']({
  'Debian': {'pkg': 'mosh'},
}, default='Debian') %}

{{ mosh.pkg }}:
  pkg.installed:
    - name: {{ mosh.pkg }}
