Installation
------------

Installation von etc Keeper mit git.

.. code:: bash

	apt-get install git etckeeper

Konfiguration
-------------

In der Konfigurationsdatei von etc Keeper ``/etc/etckeeper/etckeeper.conf`` folgendes einfügen oder anpassen. Hiermit stellen wir sicher, dass wir git für die Versionskontrolle verwenden.

.. code:: text

	VCS="git"

Nun das git Repository für die Speicherung der Veränderungen in dem Verzeichnis ``/etc`` initialisieren.

.. code:: bash

    etckeeper init

Mit den folgenden Befehlen legen wir einen Autor für das git Repository an.

.. code:: bash

    cd /etc
    git config user.email <E-Mail Adresse>
    git config user.name  <Name>

Wenn man einen Autor festlegen möchte, der für das gesamte Benutzerkonto gilt, kann man das mit folgenden Befehlen durchführen.

.. code:: bash

    git config --global user.email <E-Mail Adresse>
    git config --global user.name  <Name>


Nun speichern wir alle vorhandenen Daten aus ``/etc`` zum ersten mal ab, damit wir später Veränderungen nachvollziehen können.

.. code:: bash

    etckeeper commit
