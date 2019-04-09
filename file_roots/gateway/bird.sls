# BIRD - Internet Routing Daemon

{% set bird = salt['grains.filter_by']({
  'Debian': {'pkg': 'bird', 'srv': 'bird'},
}, default='Debian') %}

{% set bird6 = salt['grains.filter_by']({
  'Debian': {'srv': 'bird6'},
}, default='Debian') %}

{% if pillar['exit']['type'] == 'gre' %}

{{ bird.pkg }}:
  pkg.installed:
    - name: {{ bird.pkg }}
  service.running:
    - name: {{ bird.srv }}
    - enable: True

/etc/bird/bird.conf:
  file.managed:
    - name: /etc/bird/bird.conf
    - source: salt://gateway/etc/bird/bird.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - listen_in:
      - service: {{ bird.srv }}

/etc/bird/ffrl_{{ grains['host'] }}_upstream.conf:
  file.managed:
    - name: /etc/bird/ffrl_{{ grains['host'] }}_upstream.conf
    - source: salt://gateway/etc/bird/ffrl_{{ grains['host'] }}_upstream.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - listen_in:
      - service: {{ bird.srv }}

{{ bird6.srv }}:
  service.running:
    - name: {{ bird6.srv }}
    - enable: True
    - require:
      - pkg: {{ bird.pkg }}

/etc/bird/bird6.conf:
  file.managed:
    - name: /etc/bird/bird6.conf
    - source: salt://gateway/etc/bird/bird6.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - listen_in:
      - service: {{ bird6.srv }}

/etc/bird/ffrl_{{ grains['host'] }}_upstream.conf:
  file.managed:
    - name: /etc/bird/ffrl_{{ grains['host'] }}_upstream.conf
    - source: salt://gateway/etc/bird/ffrl_{{ grains['host'] }}_upstream6.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - listen_in:
      - service: {{ bird.srv }}

{% else %}

{{ bird.pkg }}:
  pkg.removed:
    - pkg: {{ bird.pkg }}

/etc/bird:
  file.absent:
    - name: /etc/bird

{% endif %}
