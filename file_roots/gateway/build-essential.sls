# Build Essential

{% set buildessential = salt['grains.filter_by']({
  'Debian': {'pkg': 'build-essential'},
}, default='Debian') %}

{{ buildessential.pkg }}:
  pkg.installed:
    - name: {{ buildessential.pkg }}
