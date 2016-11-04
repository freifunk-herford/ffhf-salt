# Docker Container - Building Gluon

/root/gluon/output:
  file.directory:
    - name: /root/gluon/output
    - dirmode: 777
    - makedirs: True

gluon-build:
  dockerng.running:
    - name: gluon-build
    - image: ubuntu-build-environment
    - user: root
    - working_dir: /gluon
    - binds: /root/gluon/output:/gluon/output:rw
    - command: /bin/sh -c "git clone -b {{ pillar['gluon']['branch'] }} {{ pillar['gluon']['repository'] }} /tmp/gluon && mv /tmp/gluon/* /gluon/ && rm /tmp/gluon -rf && git clone {{ pillar['gluon']['site'] }} /gluon/site && ls -lisah && make update && make GLUON_TARGET={{ pillar['gluon']['target'] }} FORCE_UNSAFE_CONFIGURE=1 V=s"
    - unless: test -f /root/gluon/output/images/factory/gluon-ffhf-*-{{ pillar['gluon']['target'] }}.img.gz
