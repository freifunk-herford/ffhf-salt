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

# /etc/openvpn/

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
