Der Router Advertisement Daemon ist ein Open-Source-Softwareprodukt, das verbindungslokale Ankündigungen von IPv6-Routeradressen und IPv6-Routingpräfixen unter Verwendung des in RFC 2461 angegebenen Neighbor Discovery-Protokolls implementiert.

IPv6 beherrscht ein Feature namens Stateless Address Autoconfiguration, dieses dient dazu Clients zustandlos dynamische IPv6-Adressen zuzuweisen. Dies geschieht unter Linux mittels des Daemons radvd, welcher auf dem für das Netz zuständigen Router betrieben wird und Router Advertisments versendet.

Installation
------------

.. code:: bash

   apt install radvd

Zur Konfiguration die Datei ``/etc/radvd.conf`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway//etc/radvd.conf
   :language: text
