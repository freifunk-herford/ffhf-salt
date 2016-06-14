{% set vnstat = salt['grains.filter_by']({
  "Debian": {"pkg": "vnstat", "svc": "vnstat"}
}, merge=salt['grains.get']('os_family:lookup')) %}

vnstat:
  pkg.installed:
    - name: {{ vnstat.pkg }}
  service.running:
    - name: {{ vnstat.svc }}
    - enable: True
