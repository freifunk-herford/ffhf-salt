{% set dhcp = salt['grains.filter_by']({
  "Debian": {"pkg": "isc-dhcp-server"}
}) %}

batman:
  pkg.installed:
    - name: {{ batman.pkg }}
