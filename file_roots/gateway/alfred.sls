# A.L.F.R.E.D. (Almighty Lightweight Fact Remote Exchange Daemon)

{% set alfred = salt['grains.filter_by']({
  'Debian': {'pkg': 'alfred', 'srv': 'alfred'}
}, default='Debian') %}

{{ alfred.pkg }}:
  pkg.installed:
    - name: {{ alfred.pkg }}
  service.running:
    - name: {{ alfred.srv }}
    - require:
      {% if grains['os_family'] == 'Debian' and grains['systemd'] %}
      - file: /lib/systemd/system/alfred.service
      {% endif %}
      - file: /etc/default/alfred
      - file: /etc/init.d/alfred

/etc/init.d/alfred:
  file.managed:
    - name: /etc/init.d/alfred
    - source: salt://gateway/etc/init.d/alfred
    - user: root
    - group: root
    - mode: 755

/etc/default/alfred:
  file.managed:
    - name: /etc/default/alfred
    - source: salt://gateway/etc/default/alfred
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        interface: pillar['network']['alfred']['interface']
        batman_interface: pillar['network']['batman']['interface']

{% if grains['os_family'] == 'Debian' and grains['systemd'] %}
/lib/systemd/system/alfred.service:
  file.managed:
    - name: /lib/systemd/system/alfred.service
    - source: salt://gateway/lib/systemd/system/alfred.service
    - user: root
    - group: root
    - mode: 644
{% endif %}

# alfred-json ?
