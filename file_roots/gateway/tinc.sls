# tinc VPN (Virtual Private Network)

{% set tinc = salt['grains.filter_by']({
  'Debian': {'pkg': 'tinc'},
}, default='Debian') %}

{{ tinc.pkg }}:
  pkg.installed:
    - name: {{ tinc.pkg }}
