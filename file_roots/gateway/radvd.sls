# IPv6 Router Advertisements

{% set radvd = salt['grains.filter_by']({
  'Debian': {'pkg': 'radvd', 'srv': 'radvd'}
}, default='Debian') %}

{{ radvd.pkg }}:
  pkg.installed:
    - name: {{ radvd.pkg }}
  service.running:
    - name: {{ radvd.srv }}
    - enable: True

# /etc/radvd.conf
