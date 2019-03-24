# IP Route

{% set iproute = salt['grains.filter_by']({
  'Debian': {'pkg': 'iproute2'},
}, default='Debian') %}

{{ iproute.pkg }}:
  pkg.installed:
    - name: {{ iproute.pkg }}

# ip route consults /etc/iproute2/rt_tables for a table identifier.
# If it finds no identifier, it complains that it cannot find a reference to such a table.
# If a table identifier is found, then the corresponding routing table is displayed.
/etc/iproute2/rt_tables:
  file.append:
    - name: /etc/iproute2/rt_tables
    - text: |
        #
        # icvpn table
        23  icvpn
        #
        # local community table
        41  ffhf
        #
        # internet exit table
        61  ffinetexit

# should be put in interfaces
# pre-up
# up
# post-down
# down
/etc/rc.local:
  file.managed:
    - name: /etc/rc.local
    - source: salt://gateway/etc/rc.local
    - template: jinja
    - defaults:
        primary: {{ pillar['network']['primary']['interface'] }}
        bridge: {{ pillar['network']['bridge']['interface'] }}
        exit: {{ pillar['network']['exit']['interface'] }}
        intercity: {{ pillar['network']['intercity']['interface'] }}
  cmd.run:
    - name: sh /etc/rc.local
    - unless: test -n "$(ip rule show | grep 61)"
    - require:
      - file: /etc/rc.local

{% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}

{% set rclocal = salt['grains.filter_by']({
  'Debian': {'pkg': 'rc-local', 'srv': 'rc-local'},
}, default='Debian') %}

{{ rclocal.srv }}:
  service.enabled:
    - name: {{ rclocal.srv }}

{% endif %}
