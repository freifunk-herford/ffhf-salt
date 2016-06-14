{% set iptables = salt['grains.filter_by']({
  "Debian": {"pkg": "iptables-persistent", "svc": "iptables-persistent"}
}, merge=salt['grains.get']('os_family:lookup')) %}

{% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}

{% set iptables = salt['grains.filter_by']({
  "Debian": {"pkg": "netfilter-persistent", "svc": "netfilter-persistent"}
}) %}

{% endif %}

iptables:
  pkg.installed:
    - name: {{ iptables.pkg }}
  service.running:
    - name: {{ iptables.svc }}
    - enable: True

# /etc/iptables/rules.v4
# /etc/iptables/rules.v6
