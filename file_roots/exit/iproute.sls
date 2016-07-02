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

#allow-hotplug enp0s8
#iface enp0s8 inet dhcp
#   post-up ip route change default via 10.34.0.3
