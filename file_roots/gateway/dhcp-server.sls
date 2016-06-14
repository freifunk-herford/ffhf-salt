{% set dhcp = salt['grains.filter_by']({
  "Debian": {"pkg": "isc-dhcp-server", "svc": "isc-dhcp-server"}
}, merge=salt['grains.get']('os_family:lookup')) %}

dhcp:
  pkg.installed:
    - name: {{ dhcp.pkg }}
  service.running:
    - name: {{ dhcp.svc }}
    - enable: True
  file.managed:
    - name: /etc/dhcp/dhcpd.conf
    - source: salt://gateway/etc/dhcp/dhcpd.conf
