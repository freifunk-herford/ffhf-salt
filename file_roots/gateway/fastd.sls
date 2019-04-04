# Fastd - Fast and Secure Tunneling Daemon

{% set fastd = salt['grains.filter_by']({
  'Debian': {'pkg': 'fastd', 'srv': 'fastd'}
}, default='Debian') %}

{% if pillar['fastd']['secret'] is defined %}

{{ fastd.pkg }}:
  pkg.installed:
    - name: {{ fastd.pkg }}
    - refresh: True
  service.running:
    - name: {{ fastd.srv }}
    - init_delay: 120
    - enable: True
    # - watch:
    #   - file: /etc/fastd/{{ grains['id'] }}/fastd.conf
    #   - file: /etc/fastd/{{ grains['id'] }}/secret.conf
    #   - file: /etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}
    - require:
      - file: /etc/fastd/{{ grains['id'] }}/fastd.conf
      - file: /etc/fastd/{{ grains['id'] }}/secret.conf
      - file: /etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}
    - require:
      - pkg: {{ fastd.pkg }}

{% set pattern = '^(|#)AUTOSTART="(.*)"$' %}
{% set repl = 'AUTOSTART="%s"' % grains['id'] %}
/etc/default/fastd:
  file.replace:
    - name: /etc/default/fastd
    - pattern: {{ pattern }}
    - repl: {{ repl }}
    - append_if_not_found: True
    - require:
      - pkg: {{ fastd.pkg }}
    - listen_in:
      - service: {{ fastd.srv }}

/etc/fastd/{{ grains['id'] }}/fastd.conf:
  file.managed:
    - name: /etc/fastd/{{ grains['id'] }}/fastd.conf
    - source: salt://gateway/etc/fastd/gw/fastd.conf
    - template: jinja
    - defaults:
        port: {{ pillar['fastd']['port'] }}
        socket: {{ pillar['fastd']['socket'] }}
        interface: {{ pillar['network']['mesh']['interface'] }}
        address: {{ pillar['network']['primary']['address'] }}
    - makedirs: True
    - listen_in:
      - service: {{ fastd.srv }}

/etc/fastd/{{ grains['id'] }}/secret.conf:
  file.managed:
    - name: /etc/fastd/{{ grains['id'] }}/secret.conf
    - source: salt://gateway/etc/fastd/gw/secret.conf
    - template: jinja
    - defaults:
        secret: {{ pillar['fastd']['secret'] }}
    - makedirs: True
    - listen_in:
      - service: {{ fastd.srv }}

{% for peer, data in pillar['peers'].items() %}
{% if peer != grains['id'] %}
/etc/fastd/{{ grains['id'] }}/peers/{{ peer }}:
  file.managed:
    - name: /etc/fastd/{{ grains['id'] }}/peers/{{ peer }}
    - source: salt://gateway/etc/fastd/gw/peers/peer
    - template: jinja
    - defaults:
        protocol: {{ pillar['fastd']['protocol'] }}
        fqdn: {{ data.fqdn }}
        port: {{ pillar['fastd']['port'] }}
        key: {{ data.key }}
    - makedirs: True
    - listen_in:
      - service: {{ fastd.srv }}
{% endif %}
{% endfor %}

/etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}-absent:
  file.absent:
    - name: /etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}

{% endif %}
