# haveged - Entropy daemon using the HAVEGE algorithm

{% set haveged = salt['grains.filter_by']({
  'Debian': {'pkg': 'haveged', 'srv': 'haveged'},
}, default='Debian') %}

{{ haveged.pkg }}:
  pkg.installed:
    - name: {{ haveged.pkg }}
  service.running:
    - name: {{ haveged.srv }}
    - enable: True

{% set pattern = '(|#)DAEMON_ARGS="(.*)"' %}
{% set repl = 'DAEMON_ARGS="-w 1024"' %}
/etc/default/haveged:
  file.replace:
    - name: /etc/default/haveged
    - pattern: {{ pattern }}
    - repl: {{ repl }}
    - append_if_not_found: True
    - require:
      - pkg: {{ haveged.pkg }}
    - listen_in:
      - service: {{ haveged.srv }}
