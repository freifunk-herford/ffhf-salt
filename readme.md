# Freifunk Herford SaltStack Configuration

Anleitung unter https://le.basicartstudios.de/docs/ffhf-salt lesen.

## Initialisierung des Gatways

	Hostnamen setzten:

		/etc/hostname

	Hostdatei bearbeiten:

		/etc/hosts

	resolv.conf prüfen:

		/etc/resolv.conf

	Salt Minion Installation mit GPG:

		sudo add-apt-repository ppa:saltstack/salt
		sudo apt-get update
		sudo apt-get install salt-minion python-gnupg

		/etc/salt/minion

		id: ändern
		master: ändern

		service salt-minion restart

	Minion auf dem Master anehmen:

		salt-key -A

## Aktueller Stand

salt highstate muss 2 mal durchlaufen, beim 3ten mal sollte alles passen.

im zweiten durchlauf werden von vnstat noch die datenbanken angelegt
fastd neugestartet damit alfred läuft

dns server noch nicht eingerichtet
dhcp server noch nicht eingerichtet

netzwerk infrastruktur muss noch angepasst werden

--alle daten sind bisher fake daten und sensible daten müssen dann noch mit gpg verschlüsselt werden--

--die mullvad zertifikate sind nicht verschlüsselt (fake daten) da muss noch eine lösung kommen wie die gelagert werden--

tinc war nicht konfiguriert bisher

bird war nicht konfiguriert bisher

## Missing Steps

	# hier die Config fuer einen slave von ns1 = map
	# master ist /var/lib/bind
	# slave  ist /var/cache/bind

	// logging nach local5 - die ipv6-errors nerver in daemon.log
	logging {
	  channel my_syslog {
	    syslog local5;
	    // critical error warning notice info debug [level] dynamic
	    severity info;
	  };
	  category default { my_syslog; };
	};

## Todo

* ffnord-alfred-announce braucht ethtool??
* ~~erstes ethernet inteface mit jinja finden und addressen lesen.
* openssh authorized keys (docs) in init.sls einbinden.
* ntp.conf deutsche server?
* ip rule in interfaces??
* iptables (docs) Regeln Prüfen abgleichen
* fastd ~~Schlüssel GPG~~ (docs) rsync peers
* bird.conf (docs)
* /etc/radvd.conf
	fuer jedes Gatewys anders ist RDNSS
	infrastruktur lesen
* fastd first run alfred
* fastd peers
	rsync -a gw1.herford.freifunk.net:/etc/fastd/hfVPN/peers/ /etc/fastd/hfVPN/peers/
* /etc/radvd.conf Prefix (docs)
* dhcp-server
	* /etc/init/isc-dhcp6-server.conf?
	* ~~/etc/dhcp/dhcpd.conf~~
	* /etc/dhcp/dhcpd6.conf
	* dhcp bugfix? Bugfix for https://bugs.launchpad.net/ubuntu/+source/isc-dhcp/+bug/1186662 nach https://gluon-gateway-doku.readthedocs.org/de/latest/configuration/daemons/ddi.html

			apt-get install acl
			service isc-dhcp-server stop
			setfacl -dm u:dhcpd:rwx /var/lib/dhcp
			setfacl -m u:dhcpd:rwx /var/lib/dhcp
			service isc-dhcp-server start

* dns master/~~slave~~ config files (docs) pillar flag
* openvpn mullvad
 	* ~~pillar flag config certs~~ (docs)
	* ~~chmod +x /etc/openvpn/openvpn-updown~~
	* mullvad extern rsync oder zip mit gpg?
* tinc config (docs)
* apache le-cert (docs) config webmaster
* fail2ban config (docs)
* ~~logging (docs) config~~
	~~/etc/rsyslog.d/50-default.conf~~
* autoupdates off?? dpkg-reconfigure -plow unattended-upgrades

## Generate Documentation

	cd contrib
	virtualenv venv
	source venv/bin/activate
	pip install --upgrade pip -r requirements
	cd docs
	make html

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

	wget \
	https://raw.githubusercontent.com/saltstack/salt/develop/salt/auth/mysql.py \
	--output-document=/usr/lib64/python2.7/site-packages/salt/auth

## Run Salt

Examples:

    salt -G 'virtual:physical' test.ping
    salt -G 'os:Gentoo' test.version
    salt '*' state.highstate test=True
    salt '*' state.sls testing

## Job Managment

	salt-run jobs.lookup_jid <jid>

## Syncing Grains

Syncing grains can be done a number of ways, they are automatically synced when state.highstate is called,
or (as noted above) the grains can be manually synced and reloaded by calling the saltutil.sync_grains or
saltutil.sync_all functions.

## Clear Salt Logs

    salt '*' state.sls dnn.clear-salt --state-output=changes --hide-timeout

## List Active jobs

    salt-run jobs.active

## Show highstate

	salt 'gw1' state.show_highstate test=True --state-output=changes
