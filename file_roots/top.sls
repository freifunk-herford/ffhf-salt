# Diese Datei ist die States Top Datei auf dem Freifunk Herford Salt Master 

base:
  '^gw\d$':
    - match: pcre
    - gateway

  'gw-hf':
    - gateway

  'map':
    - map

  'firmware':
    - firmware
