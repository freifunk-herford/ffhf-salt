# wget - retrieves files from the web

{% set wget = salt['grains.filter_by']({
  'Debian': {'pkg': 'wget'},
}, default='Debian') %}

{{ wget.pkg }}:
  pkg.installed:
    - name: {{ wget.pkg }}
