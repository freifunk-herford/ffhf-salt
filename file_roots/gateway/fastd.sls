{% set fastd = salt['grains.filter_by']({
  "Debian": {"pkg": "fastd", "svc": "fastd"}
}, merge=salt['grains.get']('os_family:lookup')) %}

{% if grains['osfamily'] == 'Debian' %}
fastd-repo:
  pkgrepo.managed:
    - name: deb https://repo.universe-factory.net/debian/ sid main
    - gpgcheck: 1
    - gpgkey: 0x16EF3F64CB201D9C
    - require_in:
      - pkg: {{ fastd.pkg }}

fastd:
  pkg.installed:
    - name: {{ fastd.pkg }}
  service.running:
    - name: {{ fastd.svc }}
    - enable: True
{% endif %}
