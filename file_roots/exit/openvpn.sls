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
    - require:
        - file: /etc/openvpn/server.conf
        - file: /etc/openvpn/dh2048.pem
        - file: /etc/openvpn/exit.crt
        - file: /etc/openvpn/exit.key
        - file: /etc/openvpn/ca.crt
    - watch:
        - file: /etc/openvpn/server.conf
        - file: /etc/openvpn/dh2048.pem
        - file: /etc/openvpn/exit.crt
        - file: /etc/openvpn/exit.key
        - file: /etc/openvpn/ca.crt

/etc/openvpn/server.conf:
  file.managed:
    - name: /etc/openvpn/server.conf
    - source: salt://exit/etc/openvpn/server.conf
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/dh2048.pem:
  file.managed:
    - name: /etc/openvpn/dh2048.pem
    - contents_pillar: openvpn:dh2048.pem
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/exit.crt:
  file.managed:
    - name: /etc/openvpn/exit.crt
    - source: salt://exit/etc/openvpn/exit.crt
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/exit.key:
  file.managed:
    - name: /etc/openvpn/exit.key
    - contents_pillar: openvpn:exit.key
    - mode: 600
    - user: root
    - group: root

/etc/openvpn/ca.crt:
  file.managed:
    - name: /etc/openvpn/ca.crt
    - source: salt://exit/etc/openvpn/ca.crt
    - mode: 600
    - user: root
    - group: root
