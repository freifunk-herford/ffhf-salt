# NetFilter Persistent

{% set iptables = salt['grains.filter_by']({
  'Ubuntu': {'pkg': 'iptables-persistent', 'srv': 'iptables-persistent'},
}, default='Ubuntu') %}

{{ iptables.pkg }}:
  pkg.installed:
    - name: {{ iptables.pkg }}

{% set netfilter = salt['grains.filter_by']({
  'Ubuntu': {'pkg': 'netfilter-persistent', 'srv': 'netfilter-persistent'},
}, default='Ubuntu') %}

{{ netfilter.pkg }}:
  pkg.installed:
    - name: {{ netfilter.pkg }}
  {% if pillar['netfilter'] is defined %}
  service.running:
    - name: {{ netfilter.srv }}
    - enable: True
    - require:
      - pkg: {{ netfilter.pkg }}
  {% endif %}

{% if pillar['netfilter'] is defined %}
netfilter-persistent-save:
  cmd.run:
    - name: netfilter-persistent save
    - require:
      - pkg: {{ netfilter.pkg }}

{% if pillar['netfilter']['tables'] is defined %}
{% for table, rules in pillar['netfilter']['tables'].items() %}
{% for rule in rules %}
table-{{ table }}-rule-{{ rule }}:
  cmd.run:
    - name: iptables --table {{ table }} {{ rule }}
    - unless: iptables --list-rules --table {{ table }} | grep -e  "{{ rule }}"
    - onchanges_in:
      - cmd: netfilter-persistent-save
{% endfor %}
{% endfor %}
{% endif %}
{% endif %}

# Pillar Example
# --------------
# Todo: Provide Pillar Sample Data
