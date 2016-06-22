# Let´s Encrypt

# requirements:
# apt-get install python-virtualenv
# emerge virtualenv
# apt-get install build-essential libssl-dev libffi-dev python-dev

le-cert:
  git.latest:
    - name: https://git.digital-nerv.net/le-cert.git
    - target: /root/scripts/le-cert
    - https_user: public
    - https_pass: {{ pillar['git']['https_pass'] }}
    - force_reset: True
    - submodules: True
    - rev: master
    - force_fetch: True
    - force_reset: True
    - force_checkout: True
  file.directory:
    - name: /root/scripts
    - makedirs: True
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - libssl-dev
        - libffi-dev
        - python
        - python-dev
        - python-virtualenv
        {% endif %}
  virtualenv.managed:
    - cwd: /root/scripts/le-cert
    - name: /root/scripts/le-cert/venv
    - requirements: /root/scripts/le-cert/requirements.txt
    - pip_upgrade: True
    - require:
      - git: le-cert
      - pkg: le-cert
      - file: le-cert
