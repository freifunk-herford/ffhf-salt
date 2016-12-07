# Bash - Bourne Again Shell

{% set bash = salt['grains.filter_by']({
  'Debian': {'pkg': 'bash'},
}, default='Debian') %}

{{ bash.pkg }}:
  pkg.installed:
    - name: {{ bash.pkg }}

root:
  user.present:
    - name: root
    - shell: /bin/bash

/root/.bash_profile:
  file.append:
    - name: /root/.bash_profile
    - text: |
        if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
    - makedirs: True

/root/.bash_aliases:
  file.append:
    - name: /root/.bash_aliases
    - text: |
        # Some more alias to avoid making mistakes:
        alias rm='rm -i'
        alias cp='cp -i'
        alias mv='mv -i'
        # Some comfort
        alias lc="awk '{ nlines++ } END { print nlines }'"
    - makedirs: True
