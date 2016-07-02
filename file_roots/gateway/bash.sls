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
