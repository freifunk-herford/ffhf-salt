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
    - watch:
        - file: /etc/default/openvpn
        - file: /etc/openvpn/openvpn-updown
        {% if pillar['openvpn']['provider'] == 'mullvad_linux' %}
        - file: /etc/openvpn/ca.crt
        - file: /etc/openvpn/crl.pem
        - file: /etc/openvpn/mullvad.crt
        - file: /etc/openvpn/mullvad.key
        - file: /etc/openvpn/mullvad_linux.conf
        {% endif %}

{% if pillar['openvpn']['provider'] == 'mullvad_linux' %}
/etc/default/openvpn:
  file.replace:
    - name: /etc/default/openvpn
    - pattern: '^AUTOSTART="(.*)"$'
    - repl: 'AUTOSTART="mullvad_linux"'
    - not_found_content: 'AUTOSTART="mullvad_linux"'
    - append_if_not_found: True
    - require:
       - pkg: {{ openvpn.pkg }}

/etc/openvpn/openvpn-updown:
 file.managed:
   - name: /etc/openvpn/openvpn-updown
   - source: salt://gateway/etc/openvpn/openvpn-updown
   - mode: 755
   - require:
      - pkg: {{ openvpn.pkg }}

# mullvadconfig.zip:
#   archive.extracted:
#     - name: /etc/openvpn/
#     - source: salt://gateway/_source/{{ pillar['openvpn']['mullvad_linux']['account'] }}.zip
#     - source_hash: md5={{ pillar['openvpn']['mullvad_linux']['md5'] }}
#     - archive_format: zip
#     - unless: test -f /etc/openvpn/mullvad.key

#mullvad-certificate:
#  file.recurse:
#    - name: /etc/openvpn/
#    - source: salt://gateway/_source/{{ pillar['openvpn']['mullvad_linux']['account'] }}

/etc/openvpn/ca.crt:
  file.managed:
    - name: /etc/openvpn/ca.crt
    - content: {{ pillar['openvpn']['mullvad_linux']['ca_crt'] }}

/etc/openvpn/crl.pem:
  file.managed:
    - name: /etc/openvpn/crl.pem
    - content: {{ pillar['openvpn']['mullvad_linux']['crl_pem'] }}

/etc/openvpn/mullvad.crt:
  file.managed:
    - name: /etc/openvpn/mullvad.crt
    - content: {{ pillar['openvpn']['mullvad_linux']['mullvad_crt'] }}

/etc/openvpn/mullvad.key:
  file.managed:
    - name: /etc/openvpn/mullvad.key
    - content: {{ pillar['openvpn']['mullvad_linux']['mullvad_key'] }}

/etc/openvpn/mullvad_linux.conf:
  file.managed:
    - name: /etc/openvpn/mullvad_linux.conf
    - source: salt://gateway/etc/openvpn/mullvad_linux.conf
    - template: jinja
    - defaults:
        exit: {{ pillar['network']['exit']['interface'] }}
{% endif %}

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
{#% for provider in pillar['openvpn']['provider'] %#}
{#% if provider.get('key', None) %#}
# /etc/openvpn/{#{ provider }#}.conf:
#   file.managed:
#     - name: /etc/openvpn/{#{ provider }#}.conf
#     - template: jinja
#     - defaults:
#         exit: {#{ pillar['network']['exit']['interface'] }#}
#
# {#{ provider }#}-key:
#   file.managed:
#     - name: /etc/openvpn/{#{ provider }#}/{#{ provider }#}.key
#     - content: {#{ pillar['openvpn']['provider'][provider]['key'] }#}
#     - makedirs: True
#
# {#{ provider }#}-crt:
#   file.managed:
#     - name: /etc/openvpn/{#{ provider }#}/{#{ provider }#}.crt
#     - content: {#{ pillar['openvpn']['provider'][provider]['crt'] }#}
#     - makedirs: True
#
# {#{ provider }#}-recurse:
#   file.recurse:
#     - name: /etc/openvpn/{#{ provider }#}
#     - source: salt://gateway/etc/openvpn/{#{ provider }#}
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
