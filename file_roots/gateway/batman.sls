# B.A.T.M.A.N. (Better Approach To Mobile Adhoc Networking)

{% set batman = salt['grains.filter_by']({
  'Debian': {'pkg': 'batctl', 'srv': 'batadv-vis'},
}, default='Debian') %}

{{ batman.pkg }}:
  pkg.installed:
    - name: {{ batman.pkg }}
  service.running:
    - name: {{ batman.srv }}
    - require:
      {% if grains['os_family'] == 'Debian' and grains['systemd'] %}
      - file: /lib/systemd/system/batadv-vis.service
      {% endif %}
      - file: /etc/default/batadv-vis
      - file: /etc/init.d/batadv-vis

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
        interface: pillar['network']['batman']['interface']

{% if grains['os_family'] == 'Debian' and grains['systemd'] %}
/lib/systemd/system/batadv-vis.service:
  file.managed:
    - name: /lib/systemd/system/batadv-vis.service
    - source: salt://gateway/lib/systemd/system/batadv-vis.service
    - user: root
    - group: root
    - mode: 644
{% endif %}

# /etc/modules-load.d/salt_managed.conf
batman_adv:
  kmod.present:
    - name: batman_adv
    - persist: True
