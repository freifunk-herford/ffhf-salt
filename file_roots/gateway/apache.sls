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
      - file: fix-serveradmin
      - file: fix-serveradmin-ssl
    - require:
      - pkg: {{ apache.pkg }}

{% if grains['os_family'] == 'Debian' %}
change-documentroot:
  file.replace:
    - name: /etc/apache2/sites-available/000-default.conf
    - pattern: 'DocumentRoot\ (.*)$'
    - repl: 'DocumentRoot {{ pillar['apache']['documentroot'] }}'
    - not_found_content: 'DocumentRoot {{ pillar['apache']['documentroot'] }}'
    - require:
      - pkg: {{ apache.pkg }}

change-documentroot-ssl:
  file.replace:
    - name: /etc/apache2/sites-available/default-ssl.conf
    - pattern: 'DocumentRoot\ (.*)$'
    - repl: 'DocumentRoot {{ pillar['apache']['documentroot'] }}'
    - not_found_content: 'DocumentRoot {{ pillar['apache']['documentroot'] }}'
    - require:
      - pkg: {{ apache.pkg }}

fix-serveradmin:
  file.replace:
    - name: /etc/apache2/sites-available/000-default.conf
    - pattern: 'ServerAdmin\ (.*)$'
    - repl: 'ServerAdmin {{ pillar['apache']['serveradmin'] }}'
    - not_found_content: 'ServerAdmin {{ pillar['apache']['serveradmin'] }}'
    - require:
      - pkg: {{ apache.pkg }}

fix-serveradmin-ssl:
  file.replace:
    - name: /etc/apache2/sites-available/default-ssl.conf
    - pattern: 'ServerAdmin\ (.*)$'
    - repl: 'ServerAdmin {{ pillar['apache']['serveradmin'] }}'
    - not_found_content: 'ServerAdmin {{ pillar['apache']['serveradmin'] }}'
    - require:
      - pkg: {{ apache.pkg }}
{% endif %}
