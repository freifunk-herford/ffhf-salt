# OpenVPN - Virtual Private Network

{% set openvpn = salt['grains.filter_by']({
  'Debian': {'pkg': 'openvpn', 'srv': 'openvpn'}
}, default='Debian') %}

{% if pillar['exit']['type'] == 'openvpn' %}

{{ openvpn.pkg }}:
  pkg.installed:
    - name: {{ openvpn.pkg }}
  service.running:
    - name: {{ openvpn.srv }}
    - enable: True
    - require:
      - file: /etc/default/openvpn
      - file: /etc/openvpn/openvpn-updown
      {% if pillar['exit']['provider'] == 'pia_linux' %}
      - file: /etc/openvpn/pia_linux.conf
      - file: /etc/openvpn/pia_ca.crt
      - file: /etc/openvpn/pia_userpass.txt
      {% elif pillar['exit']['provider'] == 'mullvad_linux' %}
      - file: /etc/openvpn/mullvad_linux.conf
      - file: /etc/openvpn/mullvad_ca.crt
      - file: /etc/openvpn/mullvad_userpass.txt
      {% endif %}
      - pkg: {{ openvpn.pkg }}

{{ openvpn.srv }}@{{ pillar['exit']['provider'] }}:
  service.running:
    - name: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}
    - enable: True

{% set pattern = '^(|#)AUTOSTART="(.*)"$' %}
{% set repl = 'AUTOSTART="%s"' % pillar['exit']['provider'] %}
/etc/default/openvpn:
  file.replace:
    - name: /etc/default/openvpn
    - pattern: {{ pattern }}
    - repl: {{ repl }}
    - append_if_not_found: True
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}

/etc/openvpn/openvpn-updown:
  file.managed:
    - name: /etc/openvpn/openvpn-updown
    - source: salt://gateway/etc/openvpn/openvpn-updown
    - mode: 755
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}

{% if pillar['exit']['provider'] == 'pia_linux' %}
/etc/openvpn/pia_ca.crt:
  file.managed:
    - name: /etc/openvpn/pia_ca.crt
    - source: salt://gateway/etc/openvpn/pia_ca.crt
    - mode: 600
    - user: root
    - group: root
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}

/etc/openvpn/pia_userpass.txt:
  file.managed:
    - name: /etc/openvpn/pia_userpass.txt
    - contents_pillar: exit:pia_linux:pia_userpass.txt
    - mode: 600
    - user: root
    - group: root
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}

/etc/openvpn/pia_linux.conf:
  file.managed:
    - name: /etc/openvpn/pia_linux.conf
    - source: salt://gateway/etc/openvpn/pia_linux.conf
    - template: jinja
    - defaults:
        exit: {{ pillar['network']['exit']['interface'] }}
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}
{% endif %}

{% if pillar['exit']['provider'] == 'mullvad_linux' %}
/etc/openvpn/mullvad_ca.crt:
  file.managed:
    - name: /etc/openvpn/mullvad_ca.crt
    - source: salt://gateway/etc/openvpn/mullvad_ca.crt
    - mode: 600
    - user: root
    - group: root
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}

/etc/openvpn/mullvad_userpass.txt:
  file.managed:
    - name: /etc/openvpn/mullvad_userpass.txt
    - contents_pillar: exit:mullvad_linux:mullvad_userpass.txt
    - mode: 600
    - user: root
    - group: root
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}

/etc/openvpn/mullvad_linux.conf:
  file.managed:
    - name: /etc/openvpn/mullvad_linux.conf
    - source: salt://gateway/etc/openvpn/mullvad_linux.conf
    - template: jinja
    - defaults:
        exit: {{ pillar['network']['exit']['interface'] }}
    - require:
      - pkg: {{ openvpn.pkg }}
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}
{% endif %}

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
    - watch_in:
      - service: {{ openvpn.srv }}@{{ pillar['exit']['provider'] }}

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

{% else %}

{{ openvpn.pkg }}:
  pkg.removed:
    - name: {{ openvpn.pkg }}

/etc/openvpn:
  file.absent:
    - name: /etc/openvpn

/root/scripts/check-openvpn.sh:
  file.absent:
    - name: /root/scripts/check-openvpn.sh

openvpn-cron:
  cron.absent:
    - name: /root/scripts/check-openvpn.sh
    - identifier: check-openvpn

{% endif %}
