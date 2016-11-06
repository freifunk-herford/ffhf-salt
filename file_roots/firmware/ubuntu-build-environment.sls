# Docker Image - Ubuntu Build Envirenment

/root/docker/ubuntu-build-environment/Dockerfile:
  file.managed:
    - name: /root/docker/ubuntu-build-environment/Dockerfile
    - source: salt://firmware/root/docker/ubuntu-build-environment/Dockerfile
    - makedirs: True

build-environment-image:
  dockerng.image_present:
    - name: ubuntu-build-environment
    - build: /root/docker/ubuntu-build-environment/
    - require:
       - file: /root/docker/ubuntu-build-environment/Dockerfile

# docker build -t alpine-build-environment:latest -f /root/docker/alpine-build-environment/Dockerfile .
