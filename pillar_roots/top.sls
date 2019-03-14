# Diese Datei wird nicht genutzt und dient als Beispiel

base:
  '^gw\d.herford.freifunk.net$':
    - match: pcre
    - gateways.shared
    - gateways.peers

  'gw1.herford.freifunk.net':
    - gateways.gw1

  'gw2.herford.freifunk.net':
    - gateways.gw2

  'gw3.herford.freifunk.net':
    - gateways.gw3

  'gw4.herford.freifunk.net':
    - gateways.gw4

  'map.herford.freifunk.net':
    - gateways.shared
    - gateways.peers
    - map.network
    - map.openssh
    - map.fastd
    - map.alfred
    - map.apache
    - map.meshviewer

#  'firmware':
#    - firmware.gluon
