# Freifunk API

# http://ffflash.readthedocs.io/en/latest/

ffflash-prepare:
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - python
        - python-dev
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
    - python: python
    - cwd: /home/map/scripts/map
    - name: /home/map/scripts/map/venv
    - requirements: /home/map/scripts/map/ffflash/requirements.txt
    - pip_upgrade: True
    - user: map
    - require:
      - pkg: ffflash-prepare
      - git: ffflash-repository
