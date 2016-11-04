# Docker Image & Container - UI for Docker

ui-for-docker:
  dockerng.running:
    - name: ui-for-docker
    - image: uifd/ui-for-docker
    - port_bindings: 9000:9000
    - binds: /var/run/docker.sock:/var/run/docker.sock

# docker run -d -p 9000:9000 --name ui-for-docker --privileged -v /var/run/docker.sock:/var/run/docker.sock uifd/ui-for-docker
