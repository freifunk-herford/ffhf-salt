{% set dhcp = salt['grains.filter_by']({
  "Debian": {"pkg": "isc-dhcp-server"}
}, merge=salt['grains.get']('os_family:lookup')) %}

batman:
  pkg.installed:
    - name: {{ batman.pkg }}
