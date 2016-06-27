/root/gluon/Dockerfile:
  file.managed:
    - name: /root/gluon/Dockerfile
    - source: salt://gluon/root/gluon/Dockerfile
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
    - working_dir: /home/gluon/gluon
    - binds: /root/gluon/output:/home/gluon/gluon/output:rw
    - command: time make GLUON_TARGET=x86-generic V=s
    - unless: test -f /root/gluon/output/images/factory/gluon-ffhf-0.0.4-dnn-x86-generic.img.gz
