Installation
------------

.. code:: bash

   wget http://ftp.us.debian.org/debian/pool/main/a/alfred/alfred_2018.2-1_amd64.deb
   dpkg -i alfred_2018.2-1_amd64.deb

.. code:: bash

   wget http://ppa.launchpad.net/freifunk-mwu/freifunk-ppa/ubuntu/pool/main/a/alfred-json/alfred-json_0.3.1-0ffmwu1~trusty_amd64.deb
   dpkg -i alfred-json_0.3.1-0ffmwu1~trusty_amd64.deb

TODO: batadv-vis.service / alfred.service
TODO: default alfred

A.L.F.R.E.D. Announce
---------------------

Folgende Pakete werden für die Installation benötigt.

.. code:: bash

   apt install python3 python3-dev python-virtualenv

Script aus dem Repository laden.

.. code:: bash

   mkdir -p /root/scripts/announce
   cd /root/scripts/announce
   git clone https://github.com/freifunk-herford/ffnord-alfred-announce.git

Die Datei ``/root/scripts/announce/requirement.txt`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/root/scripts/announce/requirements.txt

Einrichten der virtuellen Umgebung für das Script.

.. code:: bash

   cd /root/scripts/announce
   virtualenv venv -p python3
   source venv/bin/activate
   pip install --upgrade pip -r requirements.txt

Nun erstellen wir in ``/root/scripts`` ein Script mit dem Namen ``alfred-announce.sh`` mit dem folgenden Inhalt.

.. literalinclude:: ../../../../../../file_roots/gateway/root/scripts/alfred-announce.sh
   :language: jinja

.. caution:: Nicht vergessen das Script mit ``chmod +x alfred-announce.sh`` ausführbar zu machen!

Jetzt legen wir einen Cronjob an der das Script jede Minute startet.

.. code:: bash

   crontab -e

Folgendes fügen wir in den nun ein.

.. code:: text

   */1 * * * * /root/scripts/alfred-announce.sh

Konfiguation
------------

.. literalinclude:: ../../../../../../file_roots/gateway/etc/default/alfred
   :language: jinja
