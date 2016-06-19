base:
  '^gw(.*)$':
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
