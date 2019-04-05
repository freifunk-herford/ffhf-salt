# OpenSSH - OpenBSD Secure Shell server

{% set openssh = salt['grains.filter_by']({
  'Debian': {'pkg': 'openssh-server', 'srv': 'ssh'}
}, default='Debian') %}

{{ openssh.pkg }}:
  pkg.installed:
    - name: {{ openssh.pkg }}
  service.running:
    - name: {{ openssh.srv }}
    - enable: True
    - require:
      - pkg: {{ openssh.pkg }}

{% for item in pillar['openssh']['sshd_config'] %}
{% set pattern = '^(|#)%s(.*)$' % item.split()[0] %}
{% set repl = item %}
/etc/ssh/sshd_config-{{ item }}:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: {{ pattern }}
    - repl: {{ repl }}
    - append_if_not_found: True
    - listen_in:
      - service: {{ openssh.srv }}
{% endfor %}

{% if pillar['openssh'].get('ssh_auth') %}
{% for user in pillar['openssh']['ssh_auth']['user'] %}
{% for comment in pillar['openssh']['ssh_auth']['user'][user] %}
ssh_auth-{{ user }}-{{ comment }}:
  ssh_auth.present:
    - user: {{ user }}
    - name: {{ pillar['openssh']['ssh_auth']['user'][user][comment]['key'] }}
    - enc: {{ pillar['openssh']['ssh_auth']['user'][user][comment]['enc'] }}
    - comment: {{ comment }}
    - config: {{ pillar['openssh']['ssh_auth'].get('config', '.ssh/authorized_keys') }}
{% endfor %}
{% endfor %}
{% endif %}
