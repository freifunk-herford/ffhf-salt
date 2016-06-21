Installation
------------

.. code:: bash

    apt-get install vnstat vnstati

Webseite
--------

Um die Statistik auf dem Server anzuzeigen ändern wir in den Dateien ``/etc/apache2/sites-available/000-default.conf`` und ``/etc/apache2/sites-available/default-ssl.conf`` die Dokumentenwurzel vom Webserver.

.. code:: apache

    DocumentRoot /var/www/vnstat

Nun legen wir noch das Verzeichnis ``/var/www/vnstat`` mit ``mkdir -p /var/www/vnstat`` an.

Aktualisierung
--------------

Um die Grafiken für die Statistiken zu aktualisieren lassen wir einen Cronjob alle 5 Minuten ein Script ausführen.

Mit ``crontab -e`` legen wir einen Cronjob an und tragen dort folgendes ein.

.. code:: text

    */5 * * * * /root/scripts/update-vnstat-graphs.sh

Wir erstellen ein Script unter ``/root/scripts`` mit dem Namen ``update-vnstat-graphs.sh`` mit folgendem Inhalt.

.. attention:: Das Script mit ``chmod +x update-vnstat-graphs.sh`` ausführbar machen!

.. literalinclude:: ../../../../../../file_roots/gateway/root/scripts/update-vnstat-graphs.sh
   :language: bash
