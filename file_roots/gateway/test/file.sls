# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.file.html

managed:
  file.managed:
    - name: <filename>
    - source: salt://<filename>
    - user: <user>
    - group: <group>
    - mode: 644
    - template: jinja
    - makedirs: True
    - defaults:
      - var1: <variable>
      - var2: <variable>
    - context:
      - var2: <>

directory:
  file.directory:
    - name:
    - user:
    - group:
    - dir_mode: 755
    - file_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

append:
  file.append:
    - name:
    - source: salt://
    - source_hash: md5=
    - text: ''

blockreplace:
  file.blockreplace:
    - name:
    - marker_start:
    - marker_end:
    - content: |
        lalalalla
        lalalalla
    - source:
    - source_hash:
    - append_if_not_found:
    - prepend_if_not_found:

comment:
  file.comment:
    - name:
