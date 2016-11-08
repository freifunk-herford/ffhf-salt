# A.L.F.R.E.D. - Almighty Lightweight Fact Remote Exchange Daemon

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
    # - require:
    #   - sls: gateway.batman
    #   - sls: gateway.fastd
{% endif %}

{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
alfred:
  pkg.installed:
    - sources:
        - alfred: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/alfred_2016.0-0ffmwu0~trusty_amd64.deb
        - alfred-json: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred-json/alfred-json_0.3.1-0ffmwu1~trusty_amd64.deb
        - batadv-vis: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/batadv-vis_2016.0-0ffmwu0~trusty_amd64.deb
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
    - require:
      {% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
      - file: /lib/systemd/system/batadv-vis.service
      {% endif %}
      - file: /etc/default/alfred
      - pkg: alfred

alfred-group:
  group.present:
    - name: alfred

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
      # - sls: gateway.fastd
    - require:
      {% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
      - file: /lib/systemd/system/alfred.service
      {% endif %}
      - file: /etc/default/alfred
      - pkg: alfred
      # - sls: gateway.fastd

{% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
/lib/systemd/system/batadv-vis.service:
  file.managed:
    - name: /lib/systemd/system/batadv-vis.service
    - source: salt://gateway/lib/systemd/system/batadv-vis.service
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /lib/systemd/system/batadv-vis.service
{% endif %}

{% if grains['os_family'] == 'Debian' and grains['init'] == 'systemd' %}
/lib/systemd/system/alfred.service:
  file.managed:
    - name: /lib/systemd/system/alfred.service
    - source: salt://gateway/lib/systemd/system/alfred.service
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /lib/systemd/system/alfred.service
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
        socket: {{ pillar['alfred']['socket'] }}
        args: ''
    {% if pillar['alfred'].get('master') %}
    - context:
        args: '-m'
    {% endif %}

/root/scripts/check-alfred.sh:
  file.managed:
    - name: /root/scripts/check-alfred.sh
    - source: salt://gateway/root/scripts/check-alfred.sh
    - makedirs: True
    - user: root
    - group: root
    - mode: 755

check-alfred-cron:
  cron.present:
    - name: /root/scripts/check-alfred.sh
    - identifier: check-alfred
    - user: root
    - minute: '*/5'
    - comment: 'Check if A.L.F.R.E.D. is running every 5 Minutes'
    - require:
      - file: /root/scripts/check-alfred.sh

alfred-announce-prepare:
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - ethtool
        {% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
        - virtualenv
        {% endif %}
        - python3
        - python3-dev
        - python-virtualenv
        {% endif %}
  file.managed:
    - name: /root/scripts/announce/requirements.txt
    - source: salt://gateway/root/scripts/announce/requirements.txt
    - makedirs: True

alfred-announce-venv:
  virtualenv.managed:
    - python: python3
    - cwd: /root/scripts/announce
    - name: /root/scripts/announce/venv
    - requirements: /root/scripts/announce/requirements.txt
    - pip_upgrade: True
    - require:
      - pkg: alfred-announce-prepare
      - file: alfred-announce-prepare

ffnord-alfred-announce:
  git.latest:
    - name: https://github.com/freifunk-mwu/ffnord-alfred-announce.git
    - target: /root/scripts/announce/ffnord-alfred-announce
    - unless: test -d /root/scripts/announce/ffnord-alfred-announce
    - require:
      - file: alfred-announce-prepare

alfred-announce-cron:
  cron.present:
    - name: /root/scripts/alfred-announce.sh
    - identifier: alfred-announce
    - user: root
    - minute: '*/1'
    - comment: 'A.L.F.R.E.D. Announce every Minute'
    - require:
      - file: /root/scripts/alfred-announce.sh

/root/scripts/announce/alfred-announce.sh:
  file.managed:
    - name: /root/scripts/alfred-announce.sh
    - source: salt://gateway/root/scripts/alfred-announce.sh
    - makedirs: True
    - user: root
    - group: root
    - mode: 755
    - template: jinja
    - defaults:
        bridge: {{ pillar['network']['bridge']['interface'] }}
        batman: {{ pillar['network']['batman']['interface'] }}
        mesh: {{ pillar['network']['mesh']['interface'] }}
        socket: {{ pillar['alfred']['socket'] }}
        sitecode: {{ pillar['alfred']['sitecode'] }}
