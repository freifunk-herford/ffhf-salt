# Freifunk Herford SaltStack Configuration

* Test

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
