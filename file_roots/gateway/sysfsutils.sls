# sysfsutils: System Utilities Based on Sysfs

{% set sysfsutils = salt['grains.filter_by']({
  'Debian': {'pkg': 'sysfsutils'},
}, default='Debian') %}

{% if pillar['network']['mesh']['hwaddress'] is defined %}

{{ sysfsutils.pkg }}:
  pkg.installed:
    - name: {{ sysfsutils.pkg }}

/etc/sysfs.d/99-batman-hop-penalty.conf:
  file.managed:
    - name: /etc/sysfs.d/99-batman-hop-penalty.conf
    - contents: class/net/{{ pillar['network']['batman']['interface'] }}/mesh/hop_penalty = 60
    - require:
      - pkg: {{ sysfsutils.pkg }}

/root/scripts/check-sysfs.sh:
  file.managed:
    - name: /root/scripts/check-sysfs.sh
    - source: salt://gateway/root/scripts/check-sysfs.sh
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 755

check-sysfs-cron:
  cron.present:
    - name: /root/scripts/check-sysfs.sh
    - identifier: check-sysfs
    - user: root
    - minute: '*/5'
    - comment: 'Check if hop_penality is set every 5 Minutes'
    - require:
      - file: /root/scripts/check-sysfs.sh

{% endif %}
