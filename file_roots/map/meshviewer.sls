meshviewer-repository:
  git.latest:
    - name: https://le.basicartstudios.de/git/meshviewer-build-dnn.git
    - target: /var/www/meshviewer

change-documentroot:
  file.replace:
    - name: /etc/apache2/sites-available/000-default.conf
    - pattern: 'DocumentRoot\ (.*)$'
    - repl: 'DocumentRoot /var/www/meshviewer'
    - not_found_content: 'DocumentRoot /var/www/meshviewer'
    - append_if_not_found: True
    - require:
      - git: meshviewer-repository

change-documentroot-ssl:
  file.replace:
    - name: /etc/apache2/sites-available/default-ssl.conf
    - pattern: 'DocumentRoot\ (.*)$'
    - repl: 'DocumentRoot /var/www/meshviewer'
    - not_found_content: 'DocumentRoot /var/www/meshviewer'
    - append_if_not_found: True
    - require:
      - git: meshviewer-repository

/var/www/meshviewer/config.json:
  file.managed:
    - name: /var/www/meshviewer/config.json
    - source: salt://map/var/www/meshviewer/config.json
