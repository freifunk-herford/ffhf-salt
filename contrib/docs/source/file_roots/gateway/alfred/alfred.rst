Installation
------------

.. code:: bash

    apt-get install alfred alfred-json batadv-vis

Beim Betrieb mit dem Init System ``systemd`` die Datei ``/lib/systemd/system/batadv-vis.service`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/lib/systemd/system/batadv-vis.service
  :language: jinja

Und die Datei ``/lib/systemd/system/alfred.service`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/lib/systemd/system/alfred.service
  :language: jinja

A.L.F.R.E.D. Announce
---------------------

Folgende Pakete werden für die Installation benötigt.

.. code:: bash

    sudo apt-get install python3 python3-dev python-virtualenv

Script aus dem Repository laden.

.. code:: bash

    mkdir -p /root/scripts/announce
    cd /root/scripts/announce
    git clone https://github.com/freifunk-mwu/ffnord-alfred-announce.git

Die Datei ``/root/scripts/announce/requirement.txt`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/root/scripts/announce/requirements.txt

Einrichten der virtuellen Umgebung für das Script.

.. code:: bash

    cd /root/scripts/announce
    virtualenv venv -p python3
    source venv/bin/activate
    pip install --upgrade pip -r requiremnts.txt

Todo: Irgendwie sollte das Script ja noch gestartet werden, keine Ahnung wie bis jetzt.

Konfiguation
------------

.. literalinclude:: ../../../../../../file_roots/gateway/etc/default/alfred
   :language: jinja
