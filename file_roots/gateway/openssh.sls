# OpenSSH - OpenBSD Secure Shell server

{% set ssh = salt['grains.filter_by']({
  'Debian': {'pkg': 'openssh-server', 'srv': 'ssh'}
}, default='Debian') %}

ssh:
  pkg.installed:
    - name: {{ ssh.pkg }}
  service.running:
    - name: {{ ssh.srv }}
    - enable: True
  file.managed:
    - name: /root/.ssh/authorized_keys
    - source: salt://gateway/root/.ssh/authorized_keys
    - source_hash: md5=???
    - user: root
    - group: root
    - mode: 600
    - dir_mode: 700
    - makedirs: True
    - require:
      - pkg: {{ ssh.pkg }}
