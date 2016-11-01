/root/gluon/Dockerfile:
  file.managed:
    - name: /root/gluon/Dockerfile
    - source: salt://gluon/root/gluon-alpine/Dockerfile
    - makedirs: True

/root/gluon/output:
  file.directory:
    - name: /root/gluon/output
    - dirmode: 777
    - makedirs: True

gluon-image:
  dockerng.image_present:
    - name: gluon
    - build: /root/gluon/

gluon-build:
  dockerng.running:
    - name: gluon
    - image: gluon
    - user: root
    - working_dir: /gluon
    - binds: /root/gluon/output:/gluon/output:rw
    - command: make GLUON_TARGET=x86-generic FORCE_UNSAFE_CONFIGURE=1 V=s
    - unless: test -f /root/gluon/output/images/factory/gluon-ffhf-0.0.5-dnn-x86-generic.img.gz
