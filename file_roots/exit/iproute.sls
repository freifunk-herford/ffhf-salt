{% set iproute = salt['grains.filter_by']({
  'Debian': {'pkg': 'iproute'},
}, default='Debian') %}

{{ iproute.pkg }}:
  pkg.installed:
    - name: {{ iproute.pkg }}

# Todo: Send Traffic to fastd offloader
/etc/iproute2/rt_tables:
  file.append:
    - name: /etc/iproute2/rt_tables
    - text: ''
