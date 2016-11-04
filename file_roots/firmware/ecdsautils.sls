# ECDSA Utils

{% set rrd = salt['grains.filter_by']({
  'Debian': {'pkg': 'ecdsautils'}
}, default='Debian') %}

{% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}
{{ ecdsautils.pkg }}:
  pkg.installed:
    - name: {{ ecdsautils.pkg }}
{% endif %}

# https://wiki.freifunk.net/ECDSA_Util
