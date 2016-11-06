# Diese Datei wird nicht genutzt und dient als Beispiel

base:
  '^gw(.*)$':
    - match: pcre
    - gateways.shared
    - gateways.peers

  'gw1':
    - gateways.gw1

  'gw2':
    - gateways.gw2

  'gw3':
    - gateways.gw3

  'gw4':
    - gateways.gw4

  'map':
    - gateways.shared
    - gateways.peers
    - map.network
    - map.meshviewer

  'firmware':
    - firmware.gluon
