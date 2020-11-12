# fping - a program to send ICMP echo probes to network hosts, similar to ping

{% set fping = salt['grains.filter_by']({
  'Debian': {'pkg': 'fping'},
}, default='Debian') %}

{{ fping.pkg }}:
  pkg.installed:
    - name: {{ fping.pkg }}
