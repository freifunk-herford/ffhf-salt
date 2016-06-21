Installation
------------

.. code:: bash

    apt-get install isc-dhcp-server

Für den IPv4 Betrieb des DHCP Servers in der Datei ``/etc/default/isc-dhcp-server`` den Eintrag ``INTERFACES=""`` mit dem Interface der Brückenschnittstelle füllen.

Für den IPv6 Betrieb des DHCP Servers bei der Verwendung vom Init System ``upstart`` die Datei ``/etc/init.d/isc-dhcp6-server`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/init.d/isc-dhcp6-server
  :language: jinja

Bei der Verwendung vom Init System ``systemd`` die Datei ``/lib/systemd/system/isc-dhcp6-server.service`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/lib/systemd/system/isc-dhcp6-server.service
  :language: jinja

Die Datei ``/etc/default/isc-dhcp6-server`` mit folgendem Inhalt anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/default/isc-dhcp6-server
  :language: jinja

Den Eintrag ``INTERFACES=""`` mit dem Interface der Brückenschnittstelle füllen.

Konfiguation
------------

Inhalt von ``/etc/dhcp/dhcpd.conf`` für IPv4.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/dhcp/dhcpd.conf
   :language: jinja

Inhalt von ``/etc/dhcp/dhcpd6.conf`` für IPv6.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/dhcp/dhcpd6.conf
  :language: jinja

Todo: IP Ranges anpassen, IPv6 Krams nachschauen und die Konfigurationsdateien anpassen.
