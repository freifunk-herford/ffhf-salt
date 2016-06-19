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

fastd:
  pkg.latest:
    - name: {{ fastd.pkg }}
    - refresh: True
    - unless: test -f /usr/sbin/fastd
  service.running:
    - name: {{ fastd.srv }}
    - enable: True
    - watch:
      - file: /etc/fastd/{{ grains['id'] }}/fastd.conf
      - file: /etc/fastd/{{ grains['id'] }}/secret.conf
      - file: /etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}
    - require:
      - file: /etc/fastd/{{ grains['id'] }}/fastd.conf
      - file: /etc/fastd/{{ grains['id'] }}/secret.conf
      - file: /etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}

fastd-first-run:
  cmd.run:
    - name: sleep 20; service fastd restart
    - unless: test -n "$(ifconfig | grep hfBAT)"
{% endif %}

/etc/fastd/{{ grains['id'] }}/fastd.conf:
  file.managed:
    - name: /etc/fastd/{{ grains['id'] }}/fastd.conf
    - source: salt://gateway/etc/fastd/gw/fastd.conf
    - template: jinja
    - defaults:
        interface: {{ pillar['network']['vpn']['interface'] }}
        address: {{ pillar['network']['primary']['address'] }}
        address6: {{ pillar['network']['primary']['address6'] }}
    - makedirs: True

/etc/fastd/{{ grains['id'] }}/secret.conf:
  file.managed:
    - name: /etc/fastd/{{ grains['id'] }}/secret.conf
    - contents: secret "{{ pillar['fastd']['secret'] }}";
    - makedirs: True

/etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}:
  file.managed:
    - name: /etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}
    - contents: |
        remote ipv4 "{{ grains['id'] }}" port 1244;
        key "{{ pillar['fastd']['public'] }}";
    - makedirs: True
