ffmap-backend-prepare:
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - python3
        - python3-dev
        - python-virtualenv
        {% endif %}
  file.managed:
    - name: /root/scripts/map/requirements.txt
    - source: salt://map/root/scripts/map/requirements.txt
    - makedirs: True

ffmap-backend-venv:
  virtualenv.managed:
    - python: python3
    - cwd: /root/scripts/map
    - name: /root/scripts/map/venv
    - requirements: /root/scripts/map/requirements.txt
    - pip_upgrade: True
    - require:
      - pkg: ffmap-backend-prepare
      - file: ffmap-backend-prepare

ffmap-backend-repository:
  git.latest:
    - name: https://github.com/ffnord/ffmap-backend
    - target: /root/scripts/map/ffmap-backend
    - unless: test -d /root/scripts/map/ffmap-backend
    - require:
      - file: ffmap-backend-prepare

/root/scripts/update-ffmap.sh:
  file.managed:
    - name: /root/scripts/update-ffmap.sh
    - source: salt://map/root/scripts/update-ffmap.sh
    - template: jinja
    - defaults:
        batman: {{ pillar['network']['batman']['interface'] }}
        data: {{ pillar['meshviewer']['data'] }}
    - mode: 755
    - user: root
    - group: root
    - makedirs: True

{{ pillar['meshviewer']['data'] }}:
  file.directory:
    - name: {{ pillar['meshviewer']['data'] }}
    - makedirs: True

update-ffmap-cron:
  cron.present:
    - name: /root/scripts/update-ffmap.sh
    - identifier: update-ffmap
    - user: root
    - minute: '*/1'
    - comment: 'Update Map Data every Minute'
    - require:
      - file: /root/scripts/update-ffmap.sh

# Todo: file.managed /root/script/update-ffmap.sh
# Todo: cron.present /root/script/update-ffmap.sh */1

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
