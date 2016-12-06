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
    - name: /home/map/scripts/map/venv3
    - requirements: /home/map/scripts/map/requirements.txt
    - pip_upgrade: True
    - user: map
    - require:
      - pkg: ffmap-backend-prepare
      - file: ffmap-backend-prepare

ffmap-backend-repository:
  git.latest:
    - name: https://github.com/freifunk-herford/ffmap-backend.git
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
        socket: {{ pillar['alfred']['socket'] }}
        data: {{ pillar['meshviewer']['data'] }}
    - mode: 755
    - user: map
    - group: map
    - makedirs: True

/home/map/scripts/update-node.sh:
  file.managed:
    - name: /home/map/scripts/update-node.sh
    - source: salt://map/home/map/scripts/update-node.py
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
    - recurse:
      - user
      - group

update-ffmap-cron:
  cron.present:
    - name: /home/map/scripts/update-ffmap.sh
    - identifier: update-ffmap
    - user: map
    - minute: '*/1'
    - comment: 'Update Map Data every Minute'
    - require:
      - file: /home/map/scripts/update-ffmap.sh
