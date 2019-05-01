Installation
------------

Das Mesh Viwer Repository in das Verzeichnis ``/var/www/meshviewer`` klonen:

.. code:: bash

    git clone https://github.com/freifunk-herford/meshviewer-build.git /var/www/meshviewer

Folgenden Inhalt in die JSON Konfigurationsdatei unter dem Dateinamen und Pfad ``/var/www/meshviewer/config.json`` abspeichern.

.. literalinclude:: ../../../../../../file_roots/map/var/www/meshviewer/config.json
   :language: json

Folgenden Inhalt in die Apache Virtual Host Konfigurationsdatei unter dem Dateinamen und Pfad ``/etc/apache2/sites-available/map.ffhf.conf`` abspeichern.

.. literalinclude:: ../../../../../../file_roots/map/etc/apache2/sites-available/map.ffhf.conf
   :language: apache

Und mit ``a2ensite map.ffhf`` aktivieren.

