# Mesh Viewer

meshviewer-repository:
  git.latest:
    - name: https://github.com/freifunk-herford/meshviewer-build.git
    - target: /var/www/meshviewer

/var/www/meshviewer/config.json:
  file.managed:
    - name: /var/www/meshviewer/config.json
    - source: salt://map/var/www/meshviewer/config.json
    - user: map
    - group: map

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
