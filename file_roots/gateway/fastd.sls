# Fastd VPN (Virtual Private Network)

{% set fastd = salt['grains.filter_by']({
  'Debian': {'pkg': 'fastd', 'srv': 'fastd'}
}, default='Debian') %}

{% if grains['os_family'] == 'Debian' %}
fastd-repository:
  pkgrepo.managed:
    - name: deb https://repo.universe-factory.net/debian/ sid main
    - gpgcheck: 1
    - gpgkey: 0x16EF3F64CB201D9C
    - require_in:
      - pkg: {{ fastd.pkg }}

{{ fastd.pkg }}:
  pkg.installed:
    - name: {{ fastd.pkg }}
  service.running:
    - name: {{ fastd.srv }}
    - enable: True
{% endif %}

# /etc/fastd/
# /etc/default/fastd
