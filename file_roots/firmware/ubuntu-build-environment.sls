# Docker Image - Ubuntu Build Envirenment

/root/docker/ubuntu-build-environment/Dockerfile:
  file.managed:
    - name: /root/gluon/Dockerfile
    - source: salt://firmware/root/docker/ubuntu-build-environment/Dockerfile
    - makedirs: True

gluon-image:
  dockerng.image_present:
    - name: ubuntu-build-environment
    - build: /root/docker/ubuntu-build-environment/

# docker build -t alpine-build-environment:latest -f /root/docker/alpine-build-environment/Dockerfile .
