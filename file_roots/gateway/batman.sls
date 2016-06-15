{% set batman = salt['grains.filter_by']({
  'Debian': {'pkg': 'batctl'}
}, default='Debian') %}

{{ batman.pkg }}:
  pkg.installed:
    - name: {{ batman.pkg }}
