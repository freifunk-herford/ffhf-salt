# Map User Account

user-map:
  user.present:
    - name: map
    - fullname: Freifunk Map
    - createhome: True
    - home: /home/map
    - remove_groups: True
    - groups:
        - alfred

/etc/sudoers.d/map:
  file.managed:
    - name: /etc/sudoers.d/map
    - contents: 'map ALL = NOPASSWD: /usr/sbin/batctl'
    - mode: '0440'
