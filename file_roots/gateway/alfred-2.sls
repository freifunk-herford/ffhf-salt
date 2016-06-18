# A.L.F.R.E.D. (Almighty Lightweight Fact Remote Exchange Daemon)

{% set alfred = salt['grains.filter_by']({
  'Debian': {'pkgs': ['alfred', 'alfred-json', 'batadv-vis']}
}, default='Debian') %}

alfred:
  pkg.installed:
    - pkgs:
        {% for pkg in alfred.pkgs %}
        - {{ pkg }}
        {% endfor %}
    - require:
      - sls: gateway.batman

alfred.service:
  # % if grains['os_family'] == 'Debian' and grains['systemd'] %}
  # module.wait:
  #     - name: service.systemctl_reload
  #     - watch:
  #       - file: /lib/systemd/system/alfred.service
  # % endif %}
  service.running:
    - name: alfred
    - enable: True
    - watch:
      {% if grains['os_family'] == 'Debian' and salt['grains.get']('systemd', None) %}
      - file: /lib/systemd/system/alfred.service
      {% endif %}
      - file: /etc/default/alfred
      - file: /etc/init.d/alfred
    - require:
      {% if grains['os_family'] == 'Debian' and salt['grains.get']('systemd', None) %}
      - file: /lib/systemd/system/alfred.service
      {% endif %}
      - file: /etc/default/alfred
      - file: /etc/init.d/alfred
      - pkg: {{ alfred.pkg }}
      - sls: gateway.batman

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
        interface: {{ pillar['network']['alfred']['interface'] }}
        batman_interface: {{ pillar['network']['batman']['interface'] }}

{% if grains['os_family'] == 'Debian' and salt['grains.get']('systemd', None) %}
/lib/systemd/system/alfred.service:
  file.managed:
    - name: /lib/systemd/system/alfred.service
    - source: salt://gateway/lib/systemd/system/alfred.service
    - user: root
    - group: root
    - mode: 644
{% endif %}

batadv-vis.service:
  # % if grains['os_family'] == 'Debian' and grains['systemd'] %}
  # module.wait:
  #     - name: service.systemctl_reload
  #     - watch:
  #       - file: /lib/systemd/system/batadv-vis.service
  # % endif %}
  service.running:
    - name: batadv-vis
    - enable: True
    - watch:
      {% if grains['os_family'] == 'Debian' and salt['grains.get']('systemd', None) %}
      - file: /lib/systemd/system/batadv-vis.service
      {% endif %}
      - file: /etc/default/batadv-vis
      - file: /etc/init.d/batadv-vis
    - require:
      {% if grains['os_family'] == 'Debian' and salt['grains.get']('systemd', None) %}
      - file: /lib/systemd/system/batadv-vis.service
      {% endif %}
      - file: /etc/default/batadv-vis
      - file: /etc/init.d/batadv-vis
      - pkg: alfred
      - sls: gateway.batman

/etc/init.d/batadv-vis:
  file.managed:
    - name: /etc/init.d/batadv-vis
    - source: salt://gateway/etc/init.d/batadv-vis
    - user: root
    - group: root
    - mode: 755

/etc/default/batadv-vis:
  file.managed:
    - name: /etc/default/batadv-vis
    - source: salt://gateway/etc/default/batadv-vis
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        interface: {{ pillar['network']['batman']['interface'] }}

{% if grains['os_family'] == 'Debian' and salt['grains.get']('systemd', None) %}
/lib/systemd/system/batadv-vis.service:
  file.managed:
    - name: /lib/systemd/system/batadv-vis.service
    - source: salt://gateway/lib/systemd/system/batadv-vis.service
    - user: root
    - group: root
    - mode: 644
{% endif %}

# alfred-json ?
