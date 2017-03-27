# Portainer - Simple management UI for Docker

portainer:
  dockerng.running:
    - name: portainer
    - image: portainer/portainer
    - port_bindings: 9000:9000
    - binds: /var/run/docker.sock:/var/run/docker.sock

# docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
