# PSMisc - Utilities that use the proc file system

{% set psmisc = salt['grains.filter_by']({
  'Debian': {'pkg': 'psmisc'},
}, default='Debian') %}

{{ psmisc.pkg }}:
  pkg.installed:
    - name: {{ psmisc.pkg }}
