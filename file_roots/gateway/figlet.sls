# figlet - display large characters made up of ordinary screen characters

{% set figlet = salt['grains.filter_by']({
  'Debian': {'pkg': 'figlet'},
}, default='Debian') %}

{{ figlet.pkg }}:
  pkg.installed:
    - name: {{ figlet.pkg }}

/etc/update-motd.d/00-ffhf-header:
  file.managed:
    - name: /etc/update-motd.d/00-ffhf-header
    - mode: 755
    - user: root
    - group: root
    - makedirs: True
