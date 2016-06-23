base:
  '^gw(.*)$':
    - match: pcre
    - gateways.shared
    # Test Daten
    - gateways.peers

  'gw1':
    - gateways.gw1

  'gw2':
    - gateways.gw2

  'gw3':
    - gateways.gw3

  'gw4':
    - gateways.gw4
