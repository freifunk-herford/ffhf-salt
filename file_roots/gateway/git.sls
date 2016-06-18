# git Version Control System

{% set git = salt['grains.filter_by']({
  'Debian': {'pkg': 'git'},
}, default='Debian') %}

{{ git.pkg }}:
  pkg.installed:
    - name: {{ git.pkg }}
