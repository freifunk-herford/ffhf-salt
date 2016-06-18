# Fastd VPN (Virtual Private Network)

{% set fastd = salt['grains.filter_by']({
  'Debian': {'pkg': 'fastd', 'srv': 'fastd'}
}, default='Debian') %}

{% if grains['os_family'] == 'Debian' %}
fastd-repository:
  pkgrepo.managed:
    - name: deb https://repo.universe-factory.net/debian/ sid main
    - keyid: 16EF3F64CB201D9C
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: {{ fastd.pkg }}

{{ fastd.pkg }}:
  pkg.latest:
    - name: {{ fastd.pkg }}
    - refresh: True
    - unless: test -f /usr/sbin/fastd
  service.running:
    - name: {{ fastd.srv }}
    - enable: True
    - watch:
      - file: /etc/fastd/fastd.conf
{% endif %}

# /etc/fastd/
# /etc/default/fastd

# /etc/fastd/peers (put in git?)

/etc/fastd/fastd.conf:
  file.managed:
    - name: /etc/fastd/fastd.conf
    - source: salt://gateway/etc/fastd/fastd.conf
    - template: jinja
    - defaults:
        interface: {{ pillar['network']['vpn']['interface'] }}
        bind: 'ipv4_address:1244'

/etc/fastd/secret.conf:
  file.append:
    - name: /etc/fastd/secret.conf
    - text: secret {{ pillar['fastd']['secret'] }};
