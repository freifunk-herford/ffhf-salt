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
    - require:
      - sls: gateway.batman
{% endif %}

{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
alfred:
  pkg.installed:
    - sources:
      - alfred: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/alfred_2016.0-0ffmwu0~trusty_amd64.deb
      - alfred-json: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred-json/alfred-json_0.3.1-0ffmwu1~trusty_amd64.deb
      - batadv-vis: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/batadv-vis_2016.0-0ffmwu0~trusty_amd64.deb
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
        python3
        python-virtualenv
  cmd.run:
    - cwd: /root/scripts/announce
    - name: |
        virtualenv -p python3
        source venv/bin/activate; pip install --upgrade pip -r requirments.txt
    - require:
      - pkg: alfred-announce
      - file: /root/scripts/announce/requirements.txt
      - git: ffnord-alfred-announce

/root/scripts/announce/requirements.txt:
  file.managed:
    - name: /root/scripts/announce/requirements.txt
    - content: |
        netinterfaces
        py-cpuinfo
    - makedirs: True

ffnord-alfred-announce:
  git.latest:
    - cwd: /root/scripts/announce
    - name: https://github.com/freifunk-mwu/ffnord-alfred-announce.git
    - target: /root/scripts/announce/ffnord-alfred-announce
    - unless: test -d /root/scripts/announce/ffnord-alfred-announce
    - require:
      - file: /root/scripts/announce/requirements.txt

# announce.sh \
# -i {{ pillar['network']['bridge']['interface'] }} \
# -b {{ pillar['network']['batman']['interface'] }} \
# -f {{ pillar['network']['vpn']['interface'] }} \
# -u /var/run/alfred.sock \
# -s ffhf
