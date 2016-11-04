# Mesh Viewer

meshviewer-repository:
  git.latest:
    - name: https://le.basicartstudios.de/git/meshviewer-build-dnn.git
    - target: /var/www/meshviewer

# change-documentroot:
#   file.replace:
#     - name: /etc/apache2/sites-available/000-default.conf
#     - pattern: 'DocumentRoot\ (.*)$'
#     - repl: 'DocumentRoot /var/www/meshviewer'
#     - not_found_content: 'DocumentRoot /var/www/meshviewer'
#     - append_if_not_found: True
#     - require:
#       - git: meshviewer-repository
#
# change-documentroot-ssl:
#   file.replace:
#     - name: /etc/apache2/sites-available/default-ssl.conf
#     - pattern: 'DocumentRoot\ (.*)$'
#     - repl: 'DocumentRoot /var/www/meshviewer'
#     - not_found_content: 'DocumentRoot /var/www/meshviewer'
#     - append_if_not_found: True
#     - require:
#       - git: meshviewer-repository

change-documentroot:
  file.replace:
    - name: /etc/apache2/sites-available/000-default.conf
    - pattern: 'DocumentRoot\ (.*)$'
    - repl: 'DocumentRoot /var/www/html'
    - not_found_content: 'DocumentRoot /var/www/html'

change-documentroot-ssl:
  file.replace:
    - name: /etc/apache2/sites-available/default-ssl.conf
    - pattern: 'DocumentRoot\ (.*)$'
    - repl: 'DocumentRoot /var/www/html'
    - not_found_content: 'DocumentRoot /var/www/html'

/var/www/meshviewer/config.json:
  file.managed:
    - name: /var/www/meshviewer/config.json
    - source: salt://map/var/www/meshviewer/config.json

{% set apache = salt['grains.filter_by']({
  'Debian': {'pkg': 'apache2', 'srv': 'apache2'},
}, default='Debian') %}

{% if grains['os_family'] == 'Debian' %}
/etc/apache2/sites-available/map.ffhf.conf:
  file.managed:
    - name: /etc/apache2/sites-available/map.ffhf.conf
    - source: salt://map/etc/apache2/sites-available/map.ffhf.conf

/etc/apache2/sites-enabled/map.ffhf.conf:
  file.symlink:
    - name: /etc/apache2/sites-enabled/map.ffhf.conf
    - target: /etc/apache2/sites-available/map.ffhf.conf
  service.running:
    - name: {{ apache.srv }}
    - enable: True
    - watch:
        - file: /etc/apache2/sites-enabled/map.ffhf.conf
{% endif %}

{% if grains['os_family'] == 'Debian' %}
# /etc/apache2/sites-available/map.ffhf.conf:
#   apache.configfile:
#     - name: /etc/apache2/sites-available/map.ffhf.conf
#     - config:
#       - VirtualHost:
#         this: '*:80'
#         ServerName:
#           - map.ffhf
#         ServerAlias:
#           - map.*
#         DocumentRoot: /var/www/meshviewer
#         Directory:
#           this: /var/www/meshviewer
#           Order: Deny,Allow
#           Allow from: all
#           AllowOverride: All
{% endif %}

# Todo: add email-contact obfuscation
