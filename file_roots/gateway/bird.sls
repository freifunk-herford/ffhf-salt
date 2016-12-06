# BIRD - Internet Routing Daemon

{% set bird = salt['grains.filter_by']({
  'Debian': {'pkg': 'bird', 'srv': 'bird'},
}, default='Debian') %}

{% set bird6 = salt['grains.filter_by']({
  'Debian': {'pkg': 'bird6', 'srv': 'bird6'},
}, default='Debian') %}

{% if pillar['exit']['type'] == 'gre' %}

{{ bird.pkg }}:
  {% if grains['os'] == 'Ubuntu' and grains['osrelease'] != '16.04' %}
  pkgrepo.managed:
    - ppa: cz.nic-labs/bird
    - keyid_ppa: True
    - require_in:
      - pkg: {{ bird.pkg }}
  {% endif %}
  pkg.installed:
    - name: {{ bird.pkg }}
    {% if grains['os'] == 'Ubuntu' and grains['osrelease'] != '16.04' %}
    - fromrepo: trusty
    - skip_verify: True
    - skip_suggestions: True
    - install_recommends: False
    - refresh: True
    {% endif %}
    - unless: test -f /usr/sbin/bird
  service.running:
    - name: {{ bird.srv }}
    - enable: True
    - watch:
      - file: /etc/bird/bird.conf

/etc/bird/bird.conf:
  file.managed:
    - name: /etc/bird/bird.conf
    - source: salt://gateway/etc/bird/bird.conf
    - user: root
    - group: root
    - mode: 644

{{ bird6.pkg }}:
  {% if grains['os'] == 'Ubuntu' and grains['osrelease'] != '16.04' %}
  pkgrepo.managed:
    - ppa: cz.nic-labs/bird
    - keyid_ppa: True
    - require_in:
      - pkg: {{ bird6.pkg }}
  {% endif %}
  pkg.installed:
    - name: {{ bird6.pkg }}
    {% if grains['os'] == 'Ubuntu' and grains['osrelease'] != '16.04' %}
    - fromrepo: trusty
    - skip_verify: True
    - skip_suggestions: True
    - install_recommends: False
    - refresh: True
    {% endif %}
    - unless: test -f /usr/sbin/bird6
  service.running:
    - name: {{ bird6.srv }}
    - enable: True
    - watch:
      - file: /etc/bird/bird6.conf

/etc/bird/bird6.conf:
  file.managed:
    - name: /etc/bird/bird6.conf
    - source: salt://gateway/etc/bird/bird6.conf
    - user: root
    - group: root
    - mode: 644

{% else %}

{{ bird.pkg }}:
  pkg.removed:
    - pkg: {{ bird.pkg }}

{{ bird6.pkg }}:
  pkg.removed:
    - pkg: {{ bird6.pkg }}

/etc/bird:
  file.absent:
    - name: /etc/bird

/etc/bird.conf:
  file.absent:
    - name: /etc/bird.conf

/etc/bird6.conf:
  file.absent:
    - name: /etc/bird6.conf

{% endif %}
