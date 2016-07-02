{% set iptables = salt['grains.filter_by']({
  'Debian': {'pkg': 'iptables-persistent', 'srv': 'iptables-persistent'}
}, default='Debian') %}

{% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}
{% set iptables = salt['grains.filter_by']({
  'Debian': {'pkg': 'netfilter-persistent', 'srv': 'netfilter-persistent'}
}, default='Debian') %}
{% endif %}

{{ iptables.pkg }}:
  pkg.installed:
    - name: {{ iptables.pkg }}
  service.running:
    - name: {{ iptables.srv }}
    - enable: True

# Todo: Send Traffic to fastd offloader
nat-POSTROUTING-ACCEPT-MASQUERADE:
  iptables.append:
    - table: nat
    - save: True
    - family: ipv4
    - chain: POSTROUTING
    - jump: MASQUERADE
    - source: 10.8.0.0/16
    - out-interface: {{ pillar['network']['secondary']['interface'] }}

# Todo: Not Saving iptables
