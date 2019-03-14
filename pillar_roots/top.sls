# Diese Datei wird nicht genutzt und dient als Beispiel

base:
  '^gw\d$':
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
    - map.openssh
    - map.fastd
    - map.alfred
    - map.apache
    - map.meshviewer

  'firmware':
    - firmware.gluon
