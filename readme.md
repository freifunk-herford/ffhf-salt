# Freifunk Herford SaltStack Configuration

Anleitung unter https://le.basicartstudios.de/docs/ffhf-salt lesen.

## Initialisierung des Gatways

	Hostnamen setzten:

		/etc/hostname

	Hostdatei bearbeiten:

		/etc/hosts

	resolv.conf prüfen:

		/etc/resolv.conf

	Salt Minion ~~Installation~~ mit GPG:

		~~sudo add-apt-repository ppa:saltstack/salt~~
		~~sudo apt-get update~~
		sudo apt-get install ~~salt-minion~~ python-gnupg

		~~/etc/salt/minion~~

		~~id: ändern~~
		~~master: ändern~~

		~~service salt-minion restart~~

	~~Minion auf dem Master anehmen:~~

		~~salt-key -A~~

## Generate Documentation

	cd contrib
	virtualenv venv
	source venv/bin/activate
	pip install --upgrade pip -r requirements
	cd docs
	make html

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


## Aktueller Stand

salt highstate muss 2 mal durchlaufen, beim 3ten mal sollte alles passen.

im zweiten durchlauf werden von vnstat noch die datenbanken angelegt
fastd neugestartet damit alfred läuft

dns server noch nicht eingerichtet
dhcp server noch nicht eingerichtet

netzwerk infrastruktur muss noch angepasst werden

--alle daten sind bisher fake daten --

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

* ~~erstes ethernet inteface mit jinja finden und addressen lesen.
* openssh authorized keys (docs) in init.sls einbinden.
* ntp.conf deutsche server?
* ip rule in interfaces??
* iptables (docs) Regeln Prüfen abgleichen
* bird.conf (docs)
* /etc/radvd.conf
	fuer jedes Gatewys anders ist RDNSS
	infrastruktur lesen
* fastd first run alfred
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
