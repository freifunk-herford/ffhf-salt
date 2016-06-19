# requirements:
# apt-get install python-virtualenv
# emerge virtualenv
# sudo apt-get install build-essential libssl-dev libffi-dev python-dev

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
  # cmd.run:
  #   - name: |
  #       virtualenv venv
  #       source venv/bin/activate; pip install --upgrade pip -r requirements.txt
  #       chmod -x *.py
  #       chmod +x *.sh
  #   - cwd: /root/scripts/le-cert
  #   - unless: test -d /root/scripts/le-cert/venv
#  cmd.run:
#    - name: git submodule update --init --recursive
#    - cwd: /root/scripts/le-cert
#    - unless: test -f /root/scripts/le-cert/acme-tiny/acme_tiny.py
