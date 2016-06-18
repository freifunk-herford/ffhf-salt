# B.A.T.M.A.N. (Better Approach To Mobile Adhoc Networking)

{% set batman = salt['grains.filter_by']({
  'Debian': {'pkgs': ['batctl', 'batman-adv-dkms']},
}, default='Debian') %}

{% if grains['os'] == 'Ubuntu' and grains['osrelease'] != '16.04' %}
freifunk-mwu-repository:
  pkgrepo.managed:
    - ppa: freifunk-mwu/freifunk-ppa
    - keyid_ppa: True
    - require_in:
      - pkg: batman

batman:
  pkg.latest:
    - pkgs:
      {% for pkg in batman.pkgs %}
      - {{ pkg }}
      {% endfor %}
    - refresh: True
    - unless: test -f /usr/sbin/batctl
{% endif %}

{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '16.04' %}
batman:
  pkg.installed:
    - sources:
      - batctl: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/b/batctl/batctl_2016.0-0ffmwu0~trusty_amd64.deb
      - batman-adv-dkms: http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/b/batman-adv-kernelland/batman-adv-dkms_2016.0-0ffmwu0~trusty_all.deb
{% endif %}

# /etc/modules-load.d/salt_managed.conf
batman_adv:
  kmod.present:
    - name: batman_adv
    - persist: True

{% set sysfsutils = salt['grains.filter_by']({
  'Debian': {'pkg':'sysfsutils'},
}, default='Debian') %}

{{ sysfsutils.pkg }}:
  pkg.installed:
    - name: {{ sysfsutils.pkg }}

/etc/sysfs.d/99-batman-hop-penalty.conf:
  file.managed:
    - name: /etc/sysfs.d/99-batman-hop-penalty.conf
    - contents: class/net/hfBAT/mesh/hop_penalty = 60
    - require:
      - pkg: {{ sysfsutils.pkg }}

# http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/alfred_2016.0-0ffmwu0~trusty_amd64.deb
# http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred/batadv-vis_2016.0-0ffmwu0~trusty_amd64.deb
# http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred-json/alfred-json_0.3.1-0ffmwu1~trusty_amd64.deb
# http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/b/batctl/batctl_2016.0-0ffmwu0~trusty_amd64.deb
# http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/b/batman-adv-kernelland/batman-adv-dkms_2016.0-0ffmwu0~trusty_all.deb
# http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/t/tinc/tinc_1.0.26-0ffmwu0~trusty_amd64.deb
