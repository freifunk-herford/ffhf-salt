# B.A.T.M.A.N. (Better Approach To Mobile Adhoc Networking)

{% set batman = salt['grains.filter_by']({
  'Debian': {'pkg': 'batctl'},
}, default='Debian') %}

{{ batman.pkg }}:
  pkg.installed:
    - name: {{ batman.pkg }}

# /etc/modules-load.d/salt_managed.conf
batman_adv:
  kmod.present:
    - name: batman_adv
    - persist: True
