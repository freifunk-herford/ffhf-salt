# IP Route

{% set iproute = salt['grains.filter_by']({
  'Debian': {'pkg': 'iproute'},
}, default='Debian') %}

{{ iproute.pkg }}:
  pkg.installed:
    - name: {{ iproute.pkg }}

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
