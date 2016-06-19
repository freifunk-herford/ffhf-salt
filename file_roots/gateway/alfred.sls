# A.L.F.R.E.D. (Almighty Lightweight Fact Remote Exchange Daemon)

{% set alfred = salt['grains.filter_by']({
  'Debian': {'pkgs': ['alfred', 'alfred-json', 'batadv-vis']}
}, default='Debian') %}

{% if grains['os'] == 'Ubuntu' and grains['osrelease'] != '16.04' %}
alfred:
  pkg.installed:
    - pkgs:
        {% for pkg in alfred.pkgs %}
        - {{ pkg }}
        {% endfor %}
    - refresh: True
    - install_recommends: False
    # - refresh: True
    # - fromrepo: freifunk-mwu-repository
    - require:
      - sls: gateway.batman
      - sls: gateway.fastd
{% endif %}

{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
alfred:
  pkg.installed:
    - sources:
        - alfred: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/alfred_2016.0-0ffmwu0~trusty_amd64.deb
        - alfred-json: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred-json/alfred-json_0.3.1-0ffmwu1~trusty_amd64.deb
        - batadv-vis: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/batadv-vis_2016.0-0ffmwu0~trusty_amd64.deb

# alfred:
#   pkg.installed:
#     - source: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/alfred_2016.0-0ffmwu0~trusty_amd64.deb
#     - source_hash: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/alfred_2016.0-0ffmwu0~trusty.dsc
#     - version: 2016.0-0ffmwu0~trusty
#
# alfred-json:
#   pkg.installed:
#     - source: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred-json/alfred-json_0.3.1-0ffmwu1~trusty_amd64.deb
#     - source_hash: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred-json/alfred-json_0.3.1-0ffmwu1~trusty.dsc
#     - version: 0.3.1-0ffmwu1~trusty
#
# batadv-vis:
#   pkg.installed:
#     - source: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/batadv-vis_2016.0-0ffmwu0~trusty_amd64.deb
#     - source_hash: md5=cc5890f6ab718fb3a806a8eea59babba
#     - version: 2016.0-0ffmwu0~trusty
{% endif %}

batadv-vis.service:
  service.running:
    - name: batadv-vis
    - enable: True
    - init_delay: 30
    - watch:
      {% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
      - file: /lib/systemd/system/batadv-vis.service
      {% endif %}
      - file: /etc/default/alfred
      # - file: /etc/init.d/batadv-vis
      # - service: alfred
    - require:
      {% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
      - file: /lib/systemd/system/batadv-vis.service
      {% endif %}
      - file: /etc/default/alfred
      - pkg: alfred
      # - file: /etc/init.d/alfred
      # - service: fastd
      # - service: alfred
      # - sls: gateway.batman

alfred.service:
  service.running:
    - name: alfred
    - enable: True
    - init_delay: 10
    - watch:
      {% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
      - file: /lib/systemd/system/alfred.service
      {% endif %}
      - file: /etc/default/alfred
      - sls: gateway.fastd
      # - file: /etc/init.d/alfred
      # - service: fastd
    - require:
      {% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
      - file: /lib/systemd/system/alfred.service
      {% endif %}
      - file: /etc/default/alfred
      - pkg: alfred
      - sls: gateway.fastd
      # - file: /etc/init.d/alfred
      # - service: fastd
      # - sls: gateway.batman

{% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
/lib/systemd/system/batadv-vis.service:
  file.managed:
    - name: /lib/systemd/system/batadv-vis.service
    - source: salt://gateway/lib/systemd/system/batadv-vis.service
    - user: root
    - group: root
    - mode: 644
    # - unless: test -f /lib/systemd/system/batadv-vis.service
{% endif %}

{% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
/lib/systemd/system/alfred.service:
  file.managed:
    - name: /lib/systemd/system/alfred.service
    - source: salt://gateway/lib/systemd/system/alfred.service
    - user: root
    - group: root
    - mode: 644
    # - unless: test -f /lib/systemd/system/alfred.service
{% endif %}

/etc/default/alfred:
  file.managed:
    - name: /etc/default/alfred
    - source: salt://gateway/etc/default/alfred
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        interface: {{ pillar['network']['bridge']['interface'] }}
        batmanif: {{ pillar['network']['batman']['interface'] }}

alfred-announce:
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - python3
        - python3-dev
        - python-virtualenv
        {% endif %}
  file.managed:
    - name: /root/scripts/announce/requirements.txt
    - source: salt://gateway/root/scripts/announce/requirements.txt
    - makedirs: True
  virtualenv.managed:
    - python: python3
    - cwd: /root/scripts/announce
    - name: /root/scripts/announce/venv
    - requirements: /root/scripts/announce/requirements.txt
    - pip_upgrade: True
    # - watch:
    #   - git: ffnord-alfred-announce
    - require:
      - pkg: alfred-announce
      - file: alfred-announce
      # - git: ffnord-alfred-announce
      # - file: /root/scripts/announce/requirements.txt
  # cmd.run:
  #   - cwd: /root/scripts/announce
  #   - name: |
  #       virtualenv venv -p python3
  #       source venv/bin/activate; pip install --upgrade pip -r requirments.txt
  #   - require:
  #     - pkg: alfred-announce
  #     - file: /root/scripts/announce/requirements.txt
  #     - git: ffnord-alfred-announce
  #   - unless: test -d /root/scripts/announce/venv
  #   - watch:
  #     - git: ffnord-alfred-announce
  #     - pkg: alfred-announce

# /root/scripts/announce/requirements.txt:
#   file.managed:
#     - name: /root/scripts/announce/requirements.txt
#     - content: |
#         netinterfaces
#         py-cpuinfo
#     - makedirs: True

ffnord-alfred-announce:
  git.latest:
    - name: https://github.com/freifunk-mwu/ffnord-alfred-announce.git
    - target: /root/scripts/announce/ffnord-alfred-announce
    - unless: test -d /root/scripts/announce/ffnord-alfred-announce
    - require:
      - file: alfred-announce
    #   - file: /root/scripts/announce/requirements.txt

# source /root/scripts/announce/venv/bin/activate; \
# announce.sh \
# -i {{ pillar['network']['bridge']['interface'] }} \
# -b {{ pillar['network']['batman']['interface'] }} \
# -f {{ pillar['network']['vpn']['interface'] }} \
# -u /var/run/alfred.sock \
# -s ffhf
