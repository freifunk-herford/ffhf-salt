{% set openvpn = salt['grains.filter_by']({
  "Debian": {"pkg": "openvn", "svc": "openvpn"}
}) %}

openvpn:
  pkg.installed:
    - name: {{ openvpn.pkg }}
  service.running:
    - name: {{ openvpn.svc }}
    - enable: True
