# Let´s Encrypt

le-cert:
  file.directory:
    - name: /root/scripts
    - makedirs: True
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
    - require:
      - file: le-cert
  pkg.installed:
    - pkgs:
        {% if grains['os_family'] == 'Debian' %}
        - libssl-dev
        - libffi-dev
        - python
        - python-dev
        - python-virtualenv
        {% endif %}
        {% if grains['os_family'] == 'Gentoo' %}
        - dev-lang/python
        - dev-python/virtualenv
        {% endif %}
  virtualenv.managed:
    - name: /root/scripts/le-cert/venv
    - cwd: /root/scripts/le-cert
    - requirements: /root/scripts/le-cert/requirements.txt
    - pip_upgrade: True
    - require:
        - git: le-cert
        - file: le-cert
        - pkg: le-cert

/root/scripts/le-cert/le-cert-calendar.sh:
  file.managed:
    - name: /root/scripts/le-cert/le-cert-calendar.sh
    - mode: 755
    - require:
        - git: le-cert
        - file: le-cert

/root/scripts/le-cert/le-cert-renew.sh:
  file.managed:
    - name: /root/scripts/le-cert/le-cert-renew.sh
    - mode: 755
    - require:
        - git: le-cert
        - file: le-cert

/root/scripts/le-cert/le-cert-tool.sh:
  file.managed:
    - name: /root/scripts/le-cert/le-cert-tool.sh
    - mode: 755
    - require:
        - git: le-cert
        - file: le-cert
