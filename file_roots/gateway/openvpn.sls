# OpenVPN (Virtual Private Network)

{% set openvpn = salt['grains.filter_by']({
  'Debian': {'pkg': 'openvpn', 'srv': 'openvpn'}
}, default='Debian') %}

{{ openvpn.pkg }}:
  pkg.installed:
    - name: {{ openvpn.pkg }}
  service.running:
    - name: {{ openvpn.srv }}
    - enable: True

# Add VPN Provider (all)
# /etc/openvpn/<provider>.conf
# https://wiki.freifunk-franken.de/w/Freifunk-Gateway_aufsetzen#Mullvad
{#% for provider, value in pillar['openvpn']['provider'].items() %#}
{#% if value %#}
{#% set providers = providers + value %#}
{#% endif %#}
{#% endfor %#}
{#{ providers|join(' ') }#}
{% set providers = 'mullvad_linux' %}

/etc/default/openvpn:
  file.replace:
    - name: /etc/default/openvpn
    - pattern: '^AUTOSTART="(.*)"$'
    - repl: 'AUTOSTART="{{ providers }}"'
    - not_found_content: 'AUTOSTART="all"'
    - append_if_not_found: True
    - require:
       - pkg: {{ openvpn.pkg }}

{#% for provider in pillar['openvpn']['provider'] %#}
{#% if provider.get('key', None) %#}
# /etc/openvpn/{{ provider }}.conf:
#   file.managed:
#     - name: /etc/openvpn/{{ provider }}.conf
#     - template: jinja
#     - defaults:
#         exit: {{ pillar['network']['exit']['interface'] }}
#
# {{ provider }}-key:
#   file.managed:
#     - name: /etc/openvpn/{{ provider }}/{{ provider }}.key
#     - content: {{ pillar['openvpn']['provider'][provider]['key'] }}
#     - makedirs: True
#
# {{ provider }}-crt:
#   file.managed:
#     - name: /etc/openvpn/{{ provider }}/{{ provider }}.crt
#     - content: {{ pillar['openvpn']['provider'][provider]['crt'] }}
#     - makedirs: True
#
# {{ provider }}-recurse:
#   file.recurse:
#     - name: /etc/openvpn/{{ provider }}
#     - source: salt://gateway/etc/openvpn/{{ provider }}
{#% endif %#}
{#% endfor %#}

/root/scripts/check-openvpn.sh:
  file.managed:
    - name: /root/scripts/check-openvpn.sh
    - source: salt://gateway/root/scripts/check-openvpn.sh
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - template: jinja
    - defaults:
        exit: {{ pillar['network']['exit']['interface'] }}
    - require:
      - pkg: {{ openvpn.pkg }}

# Show Cron: crontab -l
openvpn-cron:
  cron.present:
    - name: /root/scripts/check-openvpn.sh
    - identifier: check-openvpn
    - user: root
    - minute: '*/5'
    - comment: 'Check OpenVPN Connection every 10 Minutes'
    - require:
      - file: /root/scripts/check-openvpn.sh
