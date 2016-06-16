# requirements:
# apt-get install python-virtualenv
# emerge virtualenv
# sudo apt-get install build-essential libssl-dev libffi-dev python-dev

/root/scripts/le-cert:
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
  cmd.run:
    - name: |
        virtualenv venv
        source venv/bin/activate; pip install --upgrade pip
        source venv/bin/activate; pip install --upgrade -r requirements.txt
        chmod -x *.py
        chmod +x *.sh
    - cwd: /root/scripts/le-cert
    - unless: test -d /root/scripts/le-cert/venv
#  cmd.run:
#    - name: git submodule update --init --recursive
#    - cwd: /root/scripts/le-cert
#    - unless: test -f /root/scripts/le-cert/acme-tiny/acme_tiny.py
