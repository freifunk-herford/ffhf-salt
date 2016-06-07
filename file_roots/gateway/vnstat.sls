{% set vnstat = salt['grains.filter_by']({
  "Debian": {"pkg": "vnstat", "svc": "vnstat"}
}) %}

vnstat:
  pkg.installed:
    - name: {{ vnstat.pkg }}
  service.running:
    - name: {{ vnstat.svc }}
    - enable: True
