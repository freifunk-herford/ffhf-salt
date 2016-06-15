# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.cron.html

present:
  cron.present:
    - name: <command>
    - identifier: abc
    - user: <user>
    - minute: *
    - hour: *
    - daymonth: *
    - month: *
    - dayweek: *
    - comment: ''
    - commented: False

absent:
  cront.absent:
    - name: <command>
    - identifier: abc

file:
  cron.file:
    - name: salt://<source file>
    - source_hash: md5=
    - user:
    - template: jinja
    - defaults:
      - var1: var1
    - context:
      - var1: xxx
