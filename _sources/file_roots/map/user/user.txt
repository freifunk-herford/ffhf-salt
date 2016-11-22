Konfiguration
-------------

Den Benutzer ``map`` mit folgendem Befehl anlegen:

.. code:: bash

    useradd --create-home --home-dir /home/map --usergroup --groups alfred --gid map map

Damit der Benutzer ``map`` den Befehl ``/usr/sbin/batctl`` auführen darf folgende Schritte durchführen.

In die Datei ``/etc/sudoers.d/map`` folgenden Inhalt einfügen:

.. code:: text

    map ALL = NOPASSWD: /usr/sbin/batctl

Die rechte der Datei mit ``chmod 0440 /etc/sudoers.d/map`` anpassen.

