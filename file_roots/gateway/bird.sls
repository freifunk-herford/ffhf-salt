# BIRD - Internet Routing Daemon

{% set bird = salt['grains.filter_by']({
  'Debian': {'pkg': 'bird', 'srv': 'bird'},
}, default='Debian') %}

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
      - file: /etc/bird.conf

/etc/bird/bird.conf:
  file.managed:
    - name: /etc/bird.conf
    - source: salt://gateway/etc/bird/bird.conf
    - user: root
    - group: root
    - mode: 644
