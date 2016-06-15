# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.host.html

# /etc/hosts

localhost:
  host.present:
    - ip:
      - 127.0.0.1
    - names:
      - localhost

localhost-absent:
  host.absent:
    - ip:
      - 127.0.1.1
    - names:
      - localhost

ubuntu-xenial:
  host.present:
    - ip:
      - 127.0.1.1
    - names:
      - ubuntu-xenial
      - ubuntu-xenial.digital-nerv.net
      - m2.dev.digital-nerv.net

ubuntu-xenial-absent:
  host.absent:
    - ip:
      - 127.0.0.1
    - names:
      - ubuntu-xenial
      - ubuntu-xenial.digital-nerv.net
      - m2.dev.digital-nerv.net
