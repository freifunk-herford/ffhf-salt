{% if grains['os_family'] == 'Debian' %}
dependencies:
  pkg.installed:
    pkgs:
      - git
      - subversion
      - python
      - build-essential
      - gawk
      - unzip
      - libncurses-dev
      - libz-dev
      - libssl-dev
{% endif %}

# sudo apt-get install -y git subversion python build-essential gawk unzip libncurses-dev libz-dev libssl-dev
