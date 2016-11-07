# Docker Container - Building Mesh Viewer

/root/meshviewer/build:
  file.directory:
    - name: /root/meshviewer/build
    - dirmode: 777
    - makedirs: True

meshviewer-build:
  dockerng.running:
    - name: meshviewer-build
    - image: ubuntu-build-environment
    - working_dir: /meshviewer
    - binds: /root/meshviewer/build:/meshviewer/build:rw
    - command: /bin/sh -c "git clone -b plumpudding https://github.com/FreiFunkMuenster/meshviewer.git /tmp/meshviewer && mv /tmp/meshviewer/* /meshviewer && rm /tmp/meshviewer -rf && npm install && npm install grunt-cli && nodejs node_modules/.bin/grunt"
    - unless: test -f /root/meshviewer/build/index.html
