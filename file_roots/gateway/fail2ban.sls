# Apache Web Server

{% set fail2ban = salt['grains.filter_by']({
  'Debian': {'pkg': 'fail2ban', 'srv': 'fail2ban'},
}, default='Debian') %}

{{ fail2ban.pkg }}:
  pkg.installed:
    - name: {{ fail2ban.pkg }}
  service.running:
    - name: {{ fail2ban.srv }}
    - enable: True
