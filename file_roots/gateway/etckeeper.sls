# etc Keeper

{% set etckeeper = salt['grains.filter_by']({
  'Debian': {'pkg': 'etckeeper'},
}, default='Debian') %}

{{ etckeeper.pkg }}:
  pkg.installed:
    - name: {{ etckeeper.pkg }}
    - require:
      - sls: gateway.git

/etc/etckeeper/etckeeper.conf:
   file.replace:
   - name: /etc/etckeeper/etckeeper.conf
   - pattern: '^VCS="(.*)"$'
   - repl: 'VCS="git"'
   - append_if_not_found: True
   - require:
      - pkg: {{ etckeeper.pkg }}

etckeeper-init:
  cmd.run:
    - cwd: /etc
    - name: |
        etckeeper init
        git config user.email {{ pillar['git']['user']['email'] }}
        git config user.name {{ pillar['git']['user']['name'] }}
    - unless: test -d /etc/.git
    - require:
      - file: /etc/etckeeper/etckeeper.conf
