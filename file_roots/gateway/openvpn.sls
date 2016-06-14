{% set openvpn = salt['grains.filter_by']({
  "Debian": {"pkg": "openvn", "svc": "openvpn"}
}, merge=salt['grains.get']('os_family:lookup')) %}

openvpn:
  pkg.installed:
    - name: {{ openvpn.pkg }}
  service.running:
    - name: {{ openvpn.svc }}
    - enable: True
