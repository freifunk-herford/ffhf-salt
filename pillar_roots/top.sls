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

  'gw5':
    - gateways.gw5

  'gw6':
    - gateways.gw6

  'gw7':
    - gateways.gw7

  'gw8':
    - gateways.gw8

  'gw9':
    - gateways.gw9

  'gw-hf':
    - gateways.shared
    - gateways.gw-hf

  'map':
    - gateways.shared
    - gateways.peers
    - map.network
    - map.fastd
    - map.alfred
    - map.apache
    - map.meshviewer

  'firmware':
    - firmware.gluon
