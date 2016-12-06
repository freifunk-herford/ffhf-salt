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
        {% if pillar['exit']['provider'] == 'mullvad_linux' %}
        - file: /etc/openvpn/openvpn-updown
        - file: /etc/openvpn/ca.crt
        - file: /etc/openvpn/mullvad.crt
        - file: /etc/openvpn/mullvad.key
        - file: /etc/openvpn/mullvad_linux.conf
        {% endif %}
        {% if pillar['exit']['provider'] == 'dnn_linux' %}
        - file: /etc/openvpn/openvpn-updown
        - file: /etc/openvpn/ca.crt
        - file: /etc/openvpn/dnn.crt
        - file: /etc/openvpn/dnn.key
        - file: /etc/openvpn/dnn_linux.conf
        {% endif %}
    - watch:
        - file: /etc/default/openvpn
        {% if pillar['exit']['provider'] == 'mullvad_linux' %}
        - file: /etc/openvpn/openvpn-updown
        - file: /etc/openvpn/ca.crt
        - file: /etc/openvpn/mullvad.crt
        - file: /etc/openvpn/mullvad.key
        - file: /etc/openvpn/mullvad_linux.conf
        {% endif %}
        {% if pillar['exit']['provider'] == 'dnn_linux' %}
        - file: /etc/openvpn/openvpn-updown
        - file: /etc/openvpn/ca.crt
        - file: /etc/openvpn/dnn.crt
        - file: /etc/openvpn/dnn.key
        - file: /etc/openvpn/dnn_linux.conf
        {% endif %}

{% if pillar['exit']['provider'] == 'mullvad_linux' %}
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

/etc/openvpn/ca.crt:
  file.managed:
    - name: /etc/openvpn/ca.crt
    - source: salt://gateway/etc/openvpn/mullvad/ca.crt
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/crl.pem:
  file.managed:
    - name: /etc/openvpn/crl.pem
    - source: salt://gateway/etc/openvpn/mullvad/crl.pem
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/mullvad.crt:
  file.managed:
    - name: /etc/openvpn/mullvad.crt
    - contents_pillar: exit:mullvad_linux:mullvad.crt
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/mullvad.key:
  file.managed:
    - name: /etc/openvpn/mullvad.key
    - contents_pillar: exit:mullvad_linux:mullvad.key
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/mullvad_linux.conf:
  file.managed:
    - name: /etc/openvpn/mullvad_linux.conf
    - source: salt://gateway/etc/openvpn/mullvad_linux.conf
    - template: jinja
    - defaults:
        exit: {{ pillar['network']['exit']['interface'] }}

/etc/openvpn/dnn_linux.conf:
  file.absent:
    - name: /etc/openvpn/dnn_linux.conf

/etc/openvpn/dnn.key:
  file.absent:
    - name: /etc/openvpn/dnn.key

/etc/openvpn/dnn.crt:
  file.absent:
    - name: /etc/openvpn/dnn.crt
{% endif %}

{% if pillar['exit']['provider'] == 'dnn_linux' %}
/etc/openvpn/mullvad_linux.conf:
  file.absent:
    - name: /etc/openvpn/mullvad_linux.conf

/etc/openvpn/mullvad.key:
  file.absent:
    - name: /etc/openvpn/mullvad.key

/etc/openvpn/mullvad.crt:
  file.absent:
    - name: /etc/openvpn/mullvad.crt

/etc/default/openvpn:
  file.replace:
    - name: /etc/default/openvpn
    - pattern: '^AUTOSTART="(.*)"$'
    - repl: 'AUTOSTART="dnn_linux"'
    - not_found_content: 'AUTOSTART="dnn_linux"'
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

/etc/openvpn/ca.crt:
  file.managed:
    - name: /etc/openvpn/ca.crt
    - source: salt://gateway/etc/openvpn/dnn/ca.crt
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/crl.pem:
  file.absent:
    - name: /etc/openvpn/crl.pem

/etc/openvpn/dnn.crt:
  file.managed:
    - name: /etc/openvpn/dnn.crt
    - contents_pillar: exit:dnn_linux:dnn.crt
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/dnn.key:
  file.managed:
    - name: /etc/openvpn/dnn.key
    - contents_pillar: exit:dnn_linux:dnn.key
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/dnn_linux.conf:
  file.managed:
    - name: /etc/openvpn/dnn_linux.conf
    - source: salt://gateway/etc/openvpn/dnn_linux.conf
    - template: jinja
    - defaults:
        exit: {{ pillar['network']['exit']['interface'] }}
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

/root/scripts/check-openvpn.sh
  file.absent:
    - name: /root/scripts/check-openvpn.sh

openvpn-cron:
  cron.absent:
    - name: /root/scripts/check-openvpn.sh
    - identifier: check-openvpn

{% endif %}
