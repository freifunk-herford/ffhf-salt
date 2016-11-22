# Freifunk API

# http://ffflash.readthedocs.io/en/latest/

ffflash-prepare:
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - python3
        - python3-dev
        - python-virtualenv
        {% endif %}
  file.managed:
    - name: /var/www/meshviewer/freifunk-api/herford.json
    - source: salt://map/var/www/meshviewer/freifunk-api/herford.json
    - user: map
    - group: map
    - makedirs: True

# https://freifunk.net/api-generator/

ffflash-repository:
  git.latest:
    - name: https://github.com/spookey/ffflash.git
    - target: /home/map/scripts/map/ffflash
    - unless: test -d /home/map/scripts/map/ffflash
    - user: map

ffflash-venv:
  virtualenv.managed:
    - python: python3
    - cwd: /home/map/scripts/map
    - name: /home/map/scripts/map/venv3
    - requirements: /home/map/scripts/map/ffflash/requirements.txt
    - pip_upgrade: True
    - user: map
    - require:
      - pkg: ffflash-prepare
      - git: ffflash-repository
