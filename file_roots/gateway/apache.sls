# Apache Web Server

{% set apache = salt['grains.filter_by']({
  'Debian': {'pkg': 'apache2', 'srv': 'apache2'},
}, default='Debian') %}

{{ apache.pkg }}:
  pkg.installed:
    - name: {{ apache.pkg }}
  service.running:
    - name: {{ apache.srv }}
    - enable: True
    - watch:
      - file: change-documentroot
      - file: change-documentroot-ssl

fix-serveradmin:
  file.replace:
    - name: /etc/apache2/sites-available/000-default.conf
    - pattern: 'ServerAdmin\ (.*)$'
    - repl: 'ServerAdmin {{ pillar['apache']['serveradmin'] }}'
    - require:
      - pkg: {{ apache.pkg }}

fix-serveradmin-ssl:
  file.replace:
    - name: /etc/apache2/sites-available/default-ssl.conf
    - pattern: 'ServerAdmin\ (.*)$'
    - repl: 'ServerAdmin {{ pillar['apache']['serveradmin'] }}'
    - require:
      - pkg: {{ apache.pkg }}
