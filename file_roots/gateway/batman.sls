# B.A.T.M.A.N. (Better Approach To Mobile Adhoc Networking)

{% set batman = salt['grains.filter_by']({
  'Debian': {'pkg': 'batctl'},
}, default='Debian') %}

{{ batman.pkg }}:
  pkg.installed:
    - name: {{ batman.pkg }}

# batadv-vis ?

# modinfo batman_adv
# lsmod | grep batman_adv
# /etc/modules-load.d/salt_managed.conf
batman_adv:
  kmod.present:
    - name: batman_adv
    - persist: True
