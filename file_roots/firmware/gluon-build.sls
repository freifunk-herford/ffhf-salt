
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
    - command: /bin/sh -c "git clone -b {{ pillar['gluon']['branch'] }} {{ pillar['gluon']['repository'] }} /tmp/gluon && mv /tmp/gluon/* /gluon/ && rm /tmp/gluon -rf && git clone {{ pillar['gluon']['site'] }} /gluon/site && ls -lisah && make update{% for target in pillar['gluon']['targets'] %} && make -j{{ pillar['gluon'].get('cpus', 1) }} GLUON_TARGET={{ target }} FORCE_UNSAFE_CONFIGURE=1 V=s{% endfor %} && make manifest GLUON_BRANCH=stable"
    - unless: test -d /root/gluon/output/images/factory
