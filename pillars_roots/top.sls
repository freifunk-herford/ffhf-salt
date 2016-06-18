base:
  # 'gw-hf.herford.freifunk.net':
  #   - gw-hf.config
  #
  # 'gw1.herford.freifunk.net':
  #   - gw1.config
  #
  # 'gw2.herford.freifunk.net':
  #   - gw2.config
  #
  # 'gw3.herford.freifunk.net':
  #   - gw3.config
  #
  # 'gw4.herford.freifunk.net':
  #   - gw4.config

  'gw*':
    - match: pcre
    - gateways.shared

  'gw1':
    - gateways.gw1

  'gw2':
    - gateways.gw3

  'gw3':
    - gateways.gw3

  'gw4':
    - gateways.gw4
