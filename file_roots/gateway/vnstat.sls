# vnStat & vnStati

{% set vnstat = salt['grains.filter_by']({
  'Debian': {'pkg': 'vnstat', 'srv': 'vnstat'}
}, default='Debian') %}

{{ vnstat.pkg }}:
  pkg.installed:
    - name: {{ vnstat.pkg }}
  service.running:
    - name: {{ vnstat.srv }}
    - enable: True
    - watch:
      - file: /etc/vnstat.conf
      - cmd: init-vnstat-{{ pillar['network']['primary']['interface'] }}
      - cmd: init-vnstat-{{ pillar['network']['bridge']['interface'] }}
      {% if pillar['network']['mesh']['hwaddress'] is defined %}
      - cmd: init-vnstat-{{ pillar['network']['batman']['interface'] }}
      - cmd: init-vnstat-{{ pillar['network']['mesh']['interface'] }}
      {% endif %}
      {% if pillar['exit']['type'] != 'gre' %}
      - cmd: init-vnstat-{{ pillar['network']['exit']['interface'] }}
      {% endif %}

/etc/vnstat.conf:
  file.managed:
    - name: /etc/vnstat.conf
    - source: salt://gateway/etc/vnstat.conf
    - user: root
    - group: vnstat
    - mode: 644
    - template: jinja
    - defaults:
        primary: {{ pillar['network']['primary']['interface'] }}
    - require:
      - pkg: {{ vnstat.pkg }}

init-vnstat-{{ pillar['network']['primary']['interface'] }}:
  cmd.run:
    - name: |
        if [ -n "$(ip a | grep {{ pillar['network']['primary']['interface'] }})" ]; then vnstat -u -i {{ pillar['network']['primary']['interface'] }}; fi
    - unless: test -f /var/lib/vnstat/{{ pillar['network']['primary']['interface'] }}
    - runas: vnstat
    - require:
      - pkg: {{ vnstat.pkg }}

init-vnstat-{{ pillar['network']['bridge']['interface'] }}:
  cmd.run:
    - name: |
        if [ -n "$(ip a | grep {{ pillar['network']['bridge']['interface'] }})" ]; then vnstat -u -i {{ pillar['network']['bridge']['interface'] }}; fi
    - unless: test -f /var/lib/vnstat/{{ pillar['network']['bridge']['interface'] }}
    - runas: vnstat
    - require:
      - pkg: {{ vnstat.pkg }}

{% if pillar['network']['mesh']['hwaddress'] is defined %}

init-vnstat-{{ pillar['network']['batman']['interface'] }}:
  cmd.run:
    - name: |
        if [ -n "$(ip a | grep {{ pillar['network']['batman']['interface'] }})" ]; then vnstat -u -i {{ pillar['network']['batman']['interface'] }}; fi
    - unless: test -f /var/lib/vnstat/{{ pillar['network']['batman']['interface'] }}
    - runas: vnstat
    - require:
      - pkg: {{ vnstat.pkg }}

init-vnstat-{{ pillar['network']['mesh']['interface'] }}:
  cmd.run:
    - name: |
        if [ -n "$(ip a | grep {{ pillar['network']['mesh']['interface'] }})" ]; then vnstat -u -i {{ pillar['network']['mesh']['interface'] }}; fi
    - unless: test -f /var/lib/vnstat/{{ pillar['network']['mesh']['interface'] }}
    - runas: vnstat
    - require:
      - pkg: {{ vnstat.pkg }}

{% endif %}

{% if pillar['exit']['type'] != 'gre' %}

init-vnstat-{{ pillar['network']['exit']['interface'] }}:
  cmd.run:
    - name: |
        if [ -n "$(ip a | grep {{ pillar['network']['exit']['interface'] }})" ]; then vnstat -u -i {{ pillar['network']['exit']['interface'] }}; fi
    - unless: test -f /var/lib/vnstat/{{ pillar['network']['exit']['interface'] }}
    - runas: vnstat
    - require:
      - pkg: {{ vnstat.pkg }}

{% endif %}

# /var/lib/vnstat:
#   file.directory:
#     - name: /var/lib/vnstat
#     - user: vnstat
#     - group: vnstat
#     - file_mode: 644
#     - recurse:
#         - mode
#         - user
#         - group
#     - require:
#       - pkg: {{ vnstat.pkg }}

{% set vnstati = salt['grains.filter_by']({
  'Debian': {'pkg': 'vnstati'}
}, default='Debian') %}

{{ vnstati.pkg }}:
  pkg.installed:
    - name: {{ vnstati.pkg }}

/var/www/vnstat:
  file.directory:
    - name: /var/www/vnstat

/root/scripts/update-vnstat-graphs.sh:
  file.managed:
    - name: /root/scripts/update-vnstat-graphs.sh
    - source: salt://gateway/root/scripts/update-vnstat-graphs.sh
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - require:
      - pkg: {{ vnstat.pkg }}
      - pkg: {{ vnstati.pkg }}

# Show Cron: crontab -l
vnstat-cron:
  cron.present:
    - name: /root/scripts/update-vnstat-graphs.sh
    - identifier: update-vnstati-graphs
    - user: root
    - minute: '*/5'
    - comment: 'Update vnStat Graphs every 5 Minutes'
    - require:
      - file: /var/www/vnstat
      - file: /root/scripts/update-vnstat-graphs.sh

# change-documentroot:
#   file.replace:
#     - name: /etc/apache2/sites-available/000-default.conf
#     - pattern: 'DocumentRoot\ (.*)$'
#     - repl: 'DocumentRoot /var/www/vnstat'
#     - not_found_content: 'DocumentRoot /var/www/vnstat'
#     - append_if_not_found: True
#     - require:
#       - file: /var/www/vnstat
#
# change-documentroot-ssl:
#   file.replace:
#     - name: /etc/apache2/sites-available/default-ssl.conf
#     - pattern: 'DocumentRoot\ (.*)$'
#     - repl: 'DocumentRoot /var/www/vnstat'
#     - not_found_content: 'DocumentRoot /var/www/vnstat'
#     - append_if_not_found: True
#     - require:
#       - file: /var/www/vnstat

{% set apache = salt['grains.filter_by']({
  'Debian': {'pkg': 'apache2', 'srv': 'apache2'},
}, default='Debian') %}

{% if grains['os_family'] == 'Debian' %}
/etc/apache2/sites-available/{{ grains['id'] }}.ffhf.conf:
  file.managed:
    - name: /etc/apache2/sites-available/{{ grains['id'] }}.ffhf.conf
    - source: salt://gateway/etc/apache2/sites-available/gw.ffhf.conf
    - template: jinja

/etc/apache2/sites-enabled/{{ grains['id'] }}.ffhf.conf:
  file.symlink:
    - name: /etc/apache2/sites-enabled/{{ grains['id'] }}.ffhf.conf
    - target: /etc/apache2/sites-available/{{ grains['id'] }}.ffhf.conf
  service.running:
    - name: {{ apache.srv }}
    - enable: True
    - watch:
      - file: /etc/apache2/sites-enabled/{{ grains['id'] }}.ffhf.conf
{% endif %}

{% if grains['os_family'] == 'Debian' %}
# /etc/apache2/sites-available/{{ grains['id'] }}.ffhf.conf:
#   apache.configfile:
#     - name: /etc/apache2/sites-available/{{ grains['id'] }}.ffhf.conf
#     - config:
#       - VirtualHost:
#         this: '*:80'
#         ServerName:
#           - {{ grains['id'] }}.ffhf
#         ServerAlias:
#           - {{ grains['id'] }}.*
#         DocumentRoot: /var/www/vnstat
#         Directory:
#           this: /var/www/vnstat
#           Order: Deny,Allow
#           Allow from: all
#           AllowOverride: All
{% endif %}
