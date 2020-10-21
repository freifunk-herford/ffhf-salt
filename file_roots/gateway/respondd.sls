# Respondd

mesh-announce-prepare:
  pkg.installed:
    - pkgs:
        - ethtool
        - python3 

ffnord-mesh-announce:
  git.latest:
    - name: https://github.com/ffnord/mesh-announce.git
    - target: /root/scripts/mesh-announce
    - unless: test -d /root/scripts/mesh-announce
    - require:
      - pkg: mesh-announce-prepare

/etc/systemd/system/respondd.service:
  file.managed:
    - name: /etc/systemd/system/respondd.service
    - source: salt://gateway/etc/systemd/system/respondd.service
    - template: jinja

respondd.service:
  service.running:
    - name: respondd
    - enable: True
    - require:
      - file: /etc/systemd/system/respondd.service
