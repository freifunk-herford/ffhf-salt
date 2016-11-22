Installation
------------

Als Benutzer ``map`` die Verzeichnisse ``/home/map/scripts/map`` mit ``mkdir -p /home/map/scripts/map`` anlegen.

Eine virtuelle Python3 Umgebung erstellen:

.. code:: bash

    apt install python3 python3-dev python-virtualenv 
    cd /home/map/scripts/map
    virtualenv --python=python3 venv3

Das FFFlash Repository in das Verzeichnis ``/home/map/scripts/map`` klonen:

.. code:: bash

    git clone https://github.com/spookey/ffflash.git /home/map/scripts/map/ffflash

Die Vorraussetzungen für FFFlash in der virtuellen Python3 Umgebung installieren:

.. code:: bash

	cd /home/map/scripts/map
	sour..ce venv3/bin/active
	pip install --upgrade pip -r ffflash/requirements.txt

Folgenden Inhalt in die JSON Freifunk API Datei unter dem Dateinamen und Pfad ``/var/www/meshviewer/freifunk-api/herford.json`` abspeichern.

.. literalinclude:: ../../../../../../file_roots/map/var/www/meshviewer/freifunk-api/herford.json
   :language: json

.. hint:: Diese Datei kann man mit Hilfe des `Freifunk API Generator`_ erstellt werden.

Die Dateirechte mit ``chown map:map /var/www/meshviewer/freifunk-api/herford.json`` anpassen.

.. _`Freifunk API Generator`: https://freifunk.net/api-generator/

