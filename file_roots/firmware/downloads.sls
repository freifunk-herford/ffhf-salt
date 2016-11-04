# Firmware Downloads

{% set apache = salt['grains.filter_by']({
  'Debian': {'pkg': 'apache2', 'srv': 'apache2'},
}, default='Debian') %}

{% if grains['os_family'] == 'Debian' %}
/var/www/firmware:
  file.directory:
    - name: /var/www/firmware
    - makedirs: True

/etc/apache2/sites-available/firmware.ffhf.conf:
  file.managed:
    - name: /etc/apache2/sites-available/firmware.ffhf.conf
    - source: salt://map/etc/apache2/sites-available/firmware.ffhf.conf

/etc/apache2/sites-enabled/firmware.ffhf.conf:
  file.symlink:
    - name: /etc/apache2/sites-enabled/firmware.ffhf.conf
    - target: /etc/apache2/sites-available/firmware.ffhf.conf
  service.running:
    - name: {{ apache.srv }}
    - enable: True
    - watch:
        - file: /etc/apache2/sites-enabled/firmware.ffhf.conf
{% endif %}
