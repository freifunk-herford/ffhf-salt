Installation
------------

Als Benutzer ``map`` die Verzeichnisse ``/home/map/scripts/map`` mit ``mkdir -p /home/map/scripts/map`` anlegen.

Eine virtuelle Python3 Umgebung erstellen:

.. code:: bash

    apt install python3 python3-dev python-virtualenv 
    cd /home/map/scripts/map
    virtualenv --python=python3 venv3

Folgenden Inhalt in die PIP Vorraussetzungsdatei unter dem Dateinamen und Pfad ``/home/map/scripts/map/requirements.txt`` abspeichern.

Die Vorraussetzungen für FFMap-Backend in der virtuellen Python3 Umgebung installieren:

.. code:: bash

	cd /home/map/scripts/map
	source venv3/bin/active
	pip install --upgrade pip -r requirements.txt

Das FFMap-Backend Repository in das Verzeichnis ``/home/map/scripts/map/ffmap-backend`` klonen:

.. code:: bash

    git clone https://github.com/freifunk-herford/ffmap-backend.git /home/map/scripts/map/ffmap-backend

Folgenden Inhalt in ein Script unter dem Dateinamen und Pfad ``/home/map/scripts/update-ffmap.sh`` abspeichern.

.. literalinclude:: ../../../../../../file_roots/map/home/map/scripts/update-ffmap.sh
   :language: bash


Folgenden Inhalt in die JSON Aliases Datei unter dem Dateinamen und Pfad ``/home/map/scripts/map/aliases.json`` abspeichern.

.. literalinclude:: ../../../../../../file_roots/map/home/map/scripts/map/aliases.json
   :language: json

Die Verzeichnisrechte für den Benutzer ``map`` mit dem Befehl ``chown map:map /var/www/meshviewer/data -R`` korrigieren.

Einen Cronjob mit Hilfe von ``crontab -e -u map`` mit folgendem Inhalt anlegen.

.. code:: text

    */1 * * * * /home/map/scripts/update-ffmap.sh

