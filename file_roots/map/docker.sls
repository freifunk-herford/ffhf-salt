{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
docker-repository:
  pkg.installed:
    - pkgs:
        - apt-transport-https
        - ca-certificates
  cmd.run:
    - name: apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    - unless: test -n "$(apt-key list | grep releasedocker)"
  pkgrepo.managed:
    - humanname: Docker Release Tool
    - name: deb https://apt.dockerproject.org/repo ubuntu-xenial main
    - file: /etc/apt/sources.list.d/docker.list

docker-engine:
  pkg.latest:
    - name: docker-engine
    - required:
      - file: /etc/apt/sources.list.d/docker.list

docker-py:
  pkg.installed:
    - name: python-pip
  cmd.run:
    - name: pip install docker-py
    - unless: test -f /usr/local/lib/python2.7/dist-packages/docker/__init__.py
{% endif %}
