# BGP Routing (Border Gateway Protocol)

{% set bird = salt['grains.filter_by']({
  'Debian': {'pkg': 'bird', 'srv': 'bird'},
}, default='Debian') %}

# bird-repository:
#   pkgrepo.managed:
#     - ppa: cz.nic-labs/bird
#     - keyid_ppa: True
#     - require_in:
#       - pkg: {{ bird.pkg }}

{{ bird.pkg }}:
  pkg.installed:
    - name: {{ bird.pkg }}
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
