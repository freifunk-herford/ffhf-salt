# ECDSA Utils

{% set ecdsautils = salt['grains.filter_by']({
  'Debian': {'pkg': 'ecdsautils'}
}, default='Debian') %}

{% if grains['osrelease'] == '16.04' and grains['os'] == 'Ubuntu' %}
{{ ecdsautils.pkg }}:
  pkg.installed:
    - name: {{ ecdsautils.pkg }}
{% endif %}

# https://wiki.freifunk.net/ECDSA_Util

/root/scripts/sign.sh:
  file.managed:
    - name: /root/scripts/sign.sh
    - source: salt://firmware/root/scripts/sign.sh
    - mode: 755
    - makedirs: True

# https://raw.githubusercontent.com/freifunk-gluon/gluon/master/contrib/sign.sh

# + stable ------+- factory
# |              | 
# |              +- sysupgrade --- stable.manifest
# |
# + beta --------+- factory
# |              |
# |              +- sysupgrade --- beta.manifest
# |
# + experimental +- factory
#                |
#                +- sysupgrade --- experimental.manifest

#Example:
#    $:~# ecdsakeygen -h
#    ecdsautils 0.3.2
#
#    Usage: ecdsakeygen [-s] [-p] [-h]
#            -s      generate a new secret on stdout
#            -p      output public key of secret read from stdin
#            -h      display this short help and exit
#
#    $:~# ecdsakeygen -s > secret
#
#    $:~# cat secret 
#    f8b209e777a4588ae49393a935cc6ac433072d51b988b3ab739114f75c155959
#
#    $:~# ecdsakeygen -p < secret
#    774e8c9af37a8812c35e4b544d7bf58204371c68ebc7144bcc05e035c56816b7
