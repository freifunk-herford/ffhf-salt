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

alle daten sind bisher fake daten und sensible daten müssen dann noch mit gpg verschlüsselt werden

die mullvad zertifikate sind nicht verschlüsselt (fake daten) da muss noch eine lösung kommen wie die gelagert werden

tinc war nicht konfiguriert bisher

bird war nicht konfiguriert bisher

## Missing Steps

	# hier die Config fuer einen slave von ns1 = map
	# master ist /var/lib/bind
	# slave  ist /var/cache/bind

## /etc/bind/named.conf.options

	options {
	        directory "/var/cache/bind";

	        // forwarders {
	        //      0.0.0.0;
	        // };

	        //========================================================================
	        // If BIND logs error messages about the root key being expired,
	        // you will need to update your keys.  See https://www.isc.org/bind-keys
	        //========================================================================
	        dnssec-validation auto;
	        auth-nxdomain no;    # conform to RFC1035

	        // : listen-on und  listen-on-v6 ausschließlich auf die lokalen Interfaces und die IC-VPN Interfaces zeigen lassen.
	        //
	        //          localhost  Freifunk-VPN
	        listen-on { 127.0.0.1; 10.34.0.3; };
	        //                  Freifunk IPv6
	        listen-on-v6 { ::1; fdf3:2049:5152::a22:3;  };   // FIXME  Wo muessen wir noch lauschen ? IC-VPN !!!

	        allow-transfer { any; };
	        allow-query { any; };
	        allow-recursion { 127.0.0.1; ::1; intern-hf; };
	};

	// logging nach local5 - die ipv6-errors nerver in daemon.log
	logging {
	  channel my_syslog {
	    syslog local5;
	    // critical error warning notice info debug [level] dynamic
	    severity info;
	  };
	  category default { my_syslog; };
	};


## Zonen

	// Jedes Gate ist ein Slave für DNS (DNS Master läuft auf dem ns1 = map ).

	masters "ns-master-hf" {
	    fdf3:2049:5152::0a22:0020;
	    // 10.34.0.32;
	};

	acl "intern-hf" {
	    10.34.0.0/16;
	    fdf3:2049:5152::/48;
	};

	// Intern Zones for Freifunk
	zone "ffhf." {
	    type slave;
	    file "ffhf.db";
	    masters { ns-master-hf; };
	};

	// Reverse Zones for Freifunk
	zone "34.10.in-addr.arpa" {
	    type slave;
	    file "34.10.in-addr.arpa.db";
	    masters { ns-master-hf; };
	};

	// ### FIXME### ###TODO### bind ipv6 reverse
	// zone "e.1.b.4.c.d.4.b.6.5.d.f.ip6.arpa" { ###FIXME###
	//    type slave;
	//    file "fd56:b4dc:4b1e_48.ip6.arpa.db"; ###FIXME###
	//    masters { ns-master-hf; };
	//};

## DHCP

	ddns-update-style none;

	# Die Direktive server-name ist auf den Hostnamen des jeweiligen
	# Gateways anzupassen. Wir wählen hier eine kurze Lease Time,
	# damit die Clients maximal 5 Minuten offline sind.
	default-lease-time 300;
	min-lease-time 300;
	max-lease-time 300;

	authoritative;

	# Use this to send dhcp log messages to a different log file (you also
	# have to hack syslog.conf to complete the redirection).
	# log-facility local7; # FIXME local6 nach dev0

	subnet 10.34.0.0 netmask 255.255.0.0 {
	    range 10.34.96.0 10.34.111.254;

	    option routers 10.34.0.3;
	    option domain-name-servers 10.34.0.3;
	    option domain-search "ffhf";
	    # option domain-search "ffhf", "user.ffhf"; FIXME NOT - user brauchen wir nicht - oder ?
	    option ntp-servers 10.34.0.3;

	    # 1492 - fastd-header
	    option interface-mtu 1350;
	}

## Todo

* ffnord-alfred-announce braucht ethtool??
* erstes ethernet inteface mit jinja finden und addressen lesen.
* openssh authorized keys (docs) in init.sls einbinden.
* ntp.conf deutsche server?
* ip rule in interfaces??
* iptables (docs) Regeln Prüfen abgleichen
* fastd Schlüssel GPG (docs) rsync peers
* bird.conf (docs)
* /etc/radvd.conf
	fuer jedes Gatewys anders ist RDNSS
	infrastruktur lesen
* fastd first run alfred
* fastd peers
	rsync -a gw1.herford.freifunk.net:/etc/fastd/hfVPN/peers/ /etc/fastd/hfVPN/peers/
* /etc/radvd.conf Prefix (docs)
* /etc/init/isc-dhcp6-server.conf?
* /etc/dhcp/dhcpd.conf
* /etc/dhcp/dhcpd6.conf
* dhcp bugfix?
	# Bugfix for https://bugs.launchpad.net/ubuntu/+source/isc-dhcp/+bug/1186662
	# nach https://gluon-gateway-doku.readthedocs.org/de/latest/configuration/daemons/ddi.html
	apt-get install acl
	service isc-dhcp-server stop ; setfacl -dm u:dhcpd:rwx /var/lib/dhcp ; setfacl -m u:dhcpd:rwx /var/lib/dhcp ; service isc-dhcp-server start
* dns master/slave config files (docs) pillar flag
* openvpn mullvad pillar flag config certs (docs)
	chmod +x /etc/openvpn/openvpn-updown
	mullvad extern rsync oder zip mit gpg?
* tinc config (docs)
* apache le-cert (docs) config webmaster
* fail2ban config (docs)
* logging (docs) config
	/etc/rsyslog.d/50-default.conf
* autoupdates off?? dpkg-reconfigure -plow unattended-upgrades

## Ubuntu/Salt bootstrap Anleitung

## Simple Salt Bedienung

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
