# Freifunk Herford SaltStack Configuration

* https://freifunk-muensterland.de/wiki/doku.php?id=technik:gateway
* http://wiki.freifunk.net/Hamburg/Gateway
* https://gluon-gateway-doku.readthedocs.io/de/latest/index.html
* https://wiki.freifunk-franken.de/w/Freifunk-Gateway_aufsetzen
* https://www.open-mesh.org/projects/batman-adv/wiki/Troubleshooting

gw1.ffhf
exitVPN -> Mullvad (openvpn)
hfBAT (batman)
hfVPN (fastd)
gw1.ffhf
exitVPN -> ?
hfBAT (batman)
hfVPN (fastd)
gw1.ffhf
exitVPN -> ?
hfBAT (batman)
hfVPN (fastd)
ffhf
firmware
ns1.ffhf

AXFR
--

## A.L.F.R.E.D.

    Usage: alfred [options]
    client mode options:
      -s, --set-data [data type]          sets new data to distribute from stdin
                                          for the supplied data type (0-255)
      -r, --request [data type]           collect data from the network and prints
                                          it on the network
      -d, --verbose                       Show extra information in the data output
      -V, --req-version                   specify the data version set for -s
      -M, --modeswitch master             switch daemon to mode master
                       slave              switch daemon to mode slave
      -I, --change-interface [interface]  change to the specified interface(s)

    server mode options:
      -i, --interface                     specify the interface (or comma separated list of interfaces) to listen on
      -b                                  specify the batman-adv interface
                                          configured on the system (default: bat0)
                                          use 'none' to disable the batman-adv
                                          based best server selection
      -m, --master                        start up the daemon in master mode, which
                                          accepts data from slaves and syncs it with
                                          other masters

      -u, --unix-path [path]              path to unix socket used for client-server
                                          communication (default: "/var/run/alfred.sock")
      -c, --update-command                command to call on data change
      -v, --version                       print the version
      -h, --help                          this help

## B.A.T.M.A.N.

    batctl -m bat0 if add br0

    modinfo batman_adv
    lsmod | grep batman_adv

    Usage: batadv-vis [options]
      -i, --interface             specify the batman-adv interface configured on the system (default: bat0)
      -s, --server                start up in server mode, which regularly updates vis data from batman-adv
      -f, --format <format>       specify the output format for client mode (either "json", "jsondoc" or "dot")
      -u, --unix-path <path>      path to unix socket used for alfred server communication (default: "/var/run/alfred.sock")
      -v, --version               print the version
      -h, --help                  this help

## Minion Installation

Debian

    sudo apt-get install curl
    curl -L https://bootstrap.saltstack.com -o bootstrap-salt.sh
    sudo sh bootstrap-salt.sh -A yuumura.digital-nerv.net -i <minion_id>
    sudo apt-get install python-gnupg

RedHat

    sudo yum install curl
    curl -L https://bootstrap.saltstack.com -o bootstrap-salt.sh
    sudo sh bootstrap-salt.sh -A yuumura.digital-nerv.net -i <minion_id>
    sudo yum install python-gnupg

Gentoo

    mkdir -p /etc/portage/package.accept_keywords/app-admin
    echo "app-admin/salt ~amd64" > /etc/portage/package.accept_keywords/app-admin/salt
    mkdir -p /etc/portage/package.accept_keywords/dev-python
    echo "dev-python/m2crypto ~amd64" > /etc/portage/package.accept_keywords/dev-python/m2crypto
    emerge -av app-admin/salt
    emerge -av net-misc/curl
    curl -L https://bootstrap.saltstack.com -o bootstrap-salt.sh
    sh bootstrap-salt.sh -A yuumura.digital-nerv.net -i <minion_id>
    mkdir -p /etc/portage/package.accept_keywords
    nano /etc/portage/package.accept_keywords/dev-python
    echo "dev-python/python-gnupg ~amd64" > /etc/portage/package.accept_keywords/dev-python/python-gnupg
    emerge -av dev-python/python-gnupg

Minion (Documentation)[http://docs.saltstack.com/en/latest/ref/configuration/minion.html]

## Structure

    states
      top.sls
          base:
            'minion*':
              * formula
    pillars
      top.sls
          base:
            'minion*':
              * formula

Top File (Documentation)[http://docs.saltstack.com/en/latest/ref/states/top.html]

## States

File Suffix .sls

Example:

    apache:                 # ID Declaration
      pkg:                  # State Declaration
        * installed         # Function Declaration

## Grains

List Minion Grains:

    salt '*' grains.ls
    salt '*' grains.items sanitize=True

## GPG Encryption

Render (Documentation)[http://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html]

Generate Key:

    gpg --gen-key --homedir /etc/salt/gpgkeys

Export Key:

    gpg --armor --homedir /etc/salt/gpgkeys --armor --export saltstack > saltstack.gpg

Import Key:

    gpg --import saltstack.gpg

Trust Key:

    gpg --edit-key saltstack
    $ trust
    $ 5
    $ quit

Encrypt:

    echo -n "supersecret" | gpg --homedir ~/.gnupg --armor --encrypt -r saltstack

## Authorize Minions

List all Minion keys:

    salt-key -L

Accept all Minion keys:

    salt-key -A

Delete a Minion key by given ID:

    salt-key -d <minion_id>

## External Authentification

	wget https://raw.githubusercontent.com/saltstack/salt/develop/salt/auth/mysql.py --output-document=/usr/lib64/python2.7/site-packages/salt/auth

## Run Salt

Examples:

    salt -G 'virtual:physical' test.ping
    salt -G 'os:Gentoo' test.version
    salt '*' state.highstate test=True
    salt '*' state.sls testing

## Job Managment

	salt-run jobs.lookup_jid <jid>

## Syncing Grains

Syncing grains can be done a number of ways, they are automatically synced when state.highstate is called, or (as noted above) the grains can be manually synced and reloaded by calling the saltutil.sync_grains or saltutil.sync_all functions.

## Clear Salt Logs

    salt '*' state.sls dnn.clear-salt --state-output=changes --hide-timeout

## List Active jobs

    salt-run jobs.active
