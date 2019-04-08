# Net Filter/IP Tables Persistent

{% set iptables = salt['grains.filter_by']({
  'Ubuntu': {'pkg': 'iptables-persistent', 'srv': 'iptables-persistent'},
}, default='Ubuntu') %}

pkg-{{ iptables.pkg }}:
  pkg.installed:
    - name: {{ iptables.pkg }}

{% set netfilter = salt['grains.filter_by']({
  'Ubuntu': {'pkg': 'netfilter-persistent', 'srv': 'netfilter-persistent'},
}, default='Ubuntu') %}

{{ netfilter.pkg }}:
  pkg.installed:
    - name: {{ netfilter.pkg }}
  {% if pillar['iptables'] is defined %}
  service.running:
    - name: {{ netfilter.srv }}
    - enable: True
    - require:
      - pkg: {{ netfilter.pkg }}
  {% endif %}

{% if pillar['iptables'] is defined or pillar['ip6tables'] is defined %}
iptables-save:
  cmd.run:
    - name: netfilter-persistent save
    - require:
      - pkg: {{ netfilter.pkg }}

{% if pillar['iptables'] is defined %}
{% if pillar['iptables']['tables'] is defined %}
{% for table in pillar['iptables']['tables'] %}
{% for chain in pillar['iptables']['tables'][table] %}
{% if pillar['iptables']['tables'][table][chain]['policy'] is defined %}
{% set policy = pillar['iptables']['tables'][table][chain]['policy'] %}
iptables-table-{{ table }}-chain-{{ chain }}-policy-{{ policy }}:
  cmd.run:
    - name: iptables --table {{ table }} -P {{ chain|upper }} {{ policy|upper }}
    - unless: iptables --table {{ table }} --list {{ chain|upper }} | grep "policy {{ policy|upper }}"
    - onchanges_in:
      - cmd: iptables-save
{% endif %}
{% if pillar['iptables']['tables'][table][chain]['rules'] is defined %}
{% for rule in pillar['iptables']['tables'][table][chain]['rules'] %}
{% if chain in ['prerouting', 'input', 'forward', 'output', 'postrouting'] %}
{% set chain = chain|upper %}
{% endif %}
iptables-table-{{ table }}-chain-{{ chain }}-rule-{{ rule }}:
  cmd.run:
    - name: iptables --table {{ table }} -A {{ chain }} {{ rule }}
    - unless: iptables --table {{ table }} -C {{ chain }} {{ rule }}
    - onchanges_in:
      - cmd: iptables-save
{% endfor %}
{% endif %}
{% endfor %}
{% endfor %}
{% endif %}
{% endif %}

{% if pillar['ip6tables'] is defined %}
{% if pillar['ip6tables']['tables'] is defined %}
{% for table in pillar['ip6tables']['tables'] %}
{% for chain in pillar['ip6tables']['tables'][table] %}
{% if pillar['ip6tables']['tables'][table][chain]['policy'] is defined %}
{% set policy = pillar['ip6tables']['tables'][table][chain]['policy'] %}
ip6tables-table-{{ table }}-chain-{{ chain }}-policy-{{ policy }}:
  cmd.run:
    - name: ip6tables --table {{ table }} -P {{ chain|upper }} {{ policy|upper }}
    - unless: ip6tables --table {{ table }} --list {{ chain|upper }} | grep "policy {{ policy|upper }}"
    - onchanges_in:
      - cmd: iptables-save
{% endif %}
{% if pillar['ip6tables']['tables'][table][chain]['rules'] is defined %}
{% for rule in pillar['ip6tables']['tables'][table][chain]['rules'] %}
{% if chain in ['prerouting', 'input', 'forward', 'output', 'postrouting'] %}
{% set chain = chain|upper %}
{% endif %}
ip6tables-table-{{ table }}-chain-{{ chain }}-rule-{{ rule }}:
  cmd.run:
    - name: ip6tables --table {{ table }} -A {{ chain }} {{ rule }}
    - unless: ip6tables --table {{ table }} -C {{ chain }} {{ rule }}
    - onchanges_in:
      - cmd: iptables-save
{% endfor %}
{% endif %}
{% endfor %}
{% endfor %}
{% endif %}
{% endif %}
{% endif %}

# Pillar Example
# --------------
# Todo: Provide Pillar Sample Data
