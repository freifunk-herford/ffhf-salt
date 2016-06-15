# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.network.html

# /etc/network/interfaces
lo:
  network.managed:
#    - name: lo
    - enabled: True # auto lo
    - type: eth
    - proto: loopback # iface lo inet loopback

enp0s3:
  network.managed:
#    - name: enp0s3
    - enabled: True # auto enp0s3
    - type: eth
    - proto: dhcp # iface enp0s3 inet dhcp

# /etc/hostname
system:
  network.system:
    - enabled: True
    - hostname: ubuntu-xenial
    - apply_hostname: True
