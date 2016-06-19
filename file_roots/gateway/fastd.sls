# Fastd VPN (Virtual Private Network)

{% set fastd = salt['grains.filter_by']({
  'Debian': {'pkg': 'fastd', 'srv': 'fastd'}
}, default='Debian') %}

{% if grains['os_family'] == 'Debian' %}
fastd-repository:
  pkgrepo.managed:
    - name: deb https://repo.universe-factory.net/debian/ sid main
    - file: /etc/apt/sources.list.d/repo.universe-factory.net.list
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
        address: {{ pillar['network']['primary']['address'] }}
        address6: {{ pillar['network']['primary']['address6'] }}

/etc/fastd/secret.conf:
  file.managed:
    - name: /etc/fastd/secret.conf
    - contents: secret "{{ pillar['fastd']['secret'] }}";

/etc/fastd/peers/{{ grains['id'] }}:
  file.managed:
    - name: /etc/fastd/peers/{{ grains['id'] }}
    - contents: key "{{ pillar['fastd']['public'] }}";
    - makedirs: True
