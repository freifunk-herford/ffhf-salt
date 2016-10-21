{% set iproute = salt['grains.filter_by']({
  'Debian': {'pkg': 'iproute'},
}, default='Debian') %}

{{ iproute.pkg }}:
  pkg.installed:
    - name: {{ iproute.pkg }}

# Todo: Send Traffic to fastd offloader
# /etc/iproute2/rt_tables:
#   file.append:
#     - name: /etc/iproute2/rt_tables
#     - text: |
#         #
#         # ffhf exit table
#         61  ffhfexit

# /etc/rc.local:
#   file.managed:
#     - name: /etc/rc.local
#     - source: salt://exit/etc/rc.local
#     - template: jinja
#     - defaults:
#         primary: {{ pillar['network']['primary']['interface'] }}
#         secondary: {{ pillar['network']['secondary']['interface'] }}
#         vpn: {{ pillar['network']['vpn']['interface'] }}
#   cmd.run:
#     - name: sh /etc/rc.local
#     - unless: test -n "$(ip rule show | grep 61)"
#     - require:
#       - file: /etc/rc.local

#allow-hotplug enp0s8
#iface enp0s8 inet dhcp
#   post-up ip route change default via 10.34.0.3
