# Freifunk Map Backend

ffmap-backend-prepare:
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - python3
        - python3-dev
        - python-virtualenv
        {% endif %}
  file.managed:
    - name: /home/map/scripts/map/requirements.txt
    - source: salt://map/home/map/scripts/map/requirements.txt
    - user: map
    - group: map
    - makedirs: True

ffmap-backend-venv:
  virtualenv.managed:
    - python: python3
    - cwd: /home/map/scripts/map
    - name: /home/map/scripts/map/venv
    - requirements: /home/map/scripts/map/requirements.txt
    - pip_upgrade: True
    - user: map
    - require:
      - pkg: ffmap-backend-prepare
      - file: ffmap-backend-prepare

ffmap-backend-repository:
  git.latest:
    - name: https://github.com/ffnord/ffmap-backend
    - target: /home/map/scripts/map/ffmap-backend
    - unless: test -d /home/map/scripts/map/ffmap-backend
    - user: map
    - require:
      - file: ffmap-backend-prepare

/home/map/scripts/update-ffmap.sh:
  file.managed:
    - name: /home/map/scripts/update-ffmap.sh
    - source: salt://map/home/map/scripts/update-ffmap.sh
    - template: jinja
    - defaults:
        batman: {{ pillar['network']['batman']['interface'] }}
        data: {{ pillar['meshviewer']['data'] }}
    - mode: 755
    - user: map
    - group: map
    - makedirs: True

/home/map/scripts/map/aliases.json:
  file.managed:
    - name: /home/map/scripts/map/aliases.json
    - source: salt://map/home/map/scripts/map/aliases.json
    - user: map
    - group: map
    - makedirs: True

{{ pillar['meshviewer']['data'] }}:
  file.directory:
    - name: {{ pillar['meshviewer']['data'] }}
    - user: map
    - group: map
    - makedirs: True

update-ffmap-cron:
  cron.present:
    - name: /home/map/scripts/update-ffmap.sh
    - identifier: update-ffmap
    - user: map
    - minute: '*/1'
    - comment: 'Update Map Data every Minute'
    - require:
      - file: /home/map/scripts/update-ffmap.sh

# Todo: file.managed /home/map/script/update-ffmap.sh
# Todo: cron.present /home/map/script/update-ffmap.sh */1

# venv/bin/python backend.py -a aliases.json -m hfBAT -d data

# usage: backend.py [-h] [-a FILE [FILE ...]] [-m MESH [MESH ...]] -d DEST_DIR
#                   [-V MAC [MAC ...]] [-p DAYS] [--with-rrd]
#
# optional arguments:
#   -h, --help            show this help message and exit
#   -a FILE [FILE ...], --aliases FILE [FILE ...]
#                         Read aliases from FILE
#   -m MESH [MESH ...], --mesh MESH [MESH ...]
#                         Use given batman-adv mesh interface(s) (defaultsto
#                         bat0); specify alfred unix socket like
#                         bat0:/run/alfred0.sock.
#   -d DEST_DIR, --dest-dir DEST_DIR
#                         Write output to destination directory
#   -V MAC [MAC ...], --vpn MAC [MAC ...]
#                         Assume MAC addresses are part of vpn
#   -p DAYS, --prune DAYS
#                         forget nodes offline for at least DAYS
#   --with-rrd            enable the rendering of RRD graphs (cpu intensive)
