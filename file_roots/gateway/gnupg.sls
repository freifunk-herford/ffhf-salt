# GNU privacy guard - a free PGP replacement

{% set gnupg = salt['grains.filter_by']({
  'Debian': {'pkg': 'gnupg'},
}, default='Debian') %}

{{ gnupg.pkg }}:
  pkg.installed:
    - name: {{ gnupg.pkg }}
