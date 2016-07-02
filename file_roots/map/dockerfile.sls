/root/meshviewer/Dockerfile:
  file.managed:
    - name: /root/meshviewer/Dockerfile
    - source: salt://map/root/meshviewer/Dockerfile
    - makedirs: True

/root/meshviewer/build/config.json:
  file.managed:
    - name: /root/meshviewer/build/config.json
    - source: salt://map/root/meshviewer/build/config.json
    - makedirs: True

/root/meshviewer/build:
  file.directory:
    - name: /root/meshviewer/build
    - dirmode: 777
    - makedirs: True

meshviewer-image:
  dockerng.image_present:
    - name: meshviewer
    - build: /root/meshviewer/

meshviewer-build:
  dockerng.running:
    - name: meshviewer
    - image: meshviewer
    - user: root
    - working_dir: /meshviewer
    - binds: /root/meshviewer/build:/meshviewer/build:rw
    - command: node_modules/.bin/grunt
    - unless: test -f /root/meshviewer/build/index.html

# docker start meshviewer
# docker exec -i -t meshviewer /bin/bash
