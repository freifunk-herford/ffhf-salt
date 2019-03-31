# haveged

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
{% set repl = 'DAEMON_ARGS="%s"' % '-w 1024' %}}
/etc/default/haveged:
  file.replace:
    - name: /etc/default/haveged
    - pattern: {{ pattern }}
    - repl: {{ repl }}
    - append_if_not_found: True
    - watch_in:
      - service: {{ haveged.srv }}
    - require:
      - pkg: {{ haveged.pkg }}
