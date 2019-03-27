# etc Keeper

{% set etckeeper = salt['grains.filter_by']({
  'Debian': {'pkg': 'etckeeper'},
}, default='Debian') %}

{{ etckeeper.pkg }}:
  pkg.installed:
    - name: {{ etckeeper.pkg }}
    # - require:
    #   - sls: gateway.git

/etc/etckeeper/etckeeper.conf:
   file.replace:
    - name: /etc/etckeeper/etckeeper.conf
    - pattern: '^VCS="(.*)"$'
    - repl: 'VCS="git"'
    - not_found_content: 'VCS="git"'
    - append_if_not_found: True
    - require:
      - pkg: {{ etckeeper.pkg }}

etckeeper-init:
  cmd.run:
    - cwd: /etc
    - name: etckeeper init
    - unless: test -d /etc/.git
    - require:
      - file: /etc/etckeeper/etckeeper.conf

/etc/.git/config:
  file.append:
    - name: /etc/.git/config
    - text: |
        [user]
            email = root@localhost
            name = root
