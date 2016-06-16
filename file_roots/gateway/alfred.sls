# A.L.F.R.E.D. (Almighty Lightweight Fact Remote Exchange Daemon)

{% set alfred = salt['grains.filter_by']({
  'Debian': {'pkg': 'alfred'}
}, default='Debian') %}

{{ alfred.pkg }}:
  pkg.installed:
    - name: {{ alfred.pkg }}

# alfred-json ?
