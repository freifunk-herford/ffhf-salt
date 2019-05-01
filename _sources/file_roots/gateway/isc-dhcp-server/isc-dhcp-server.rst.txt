Installation
------------

.. code:: bash

   apt-get install isc-dhcp-server

Für den IPv4 Betrieb des DHCP Servers in der Datei ``/etc/default/isc-dhcp-server`` den Eintrag ``INTERFACESv4=""`` mit dem Interface der Brückenschnittstelle füllen.

Für den IPv6 Betrieb des DHCP Servers in der Datei ``/etc/default/isc-dhcp-server`` den Eintrag ``INTERFACESv6=""`` mit dem Interface der Brückenschnittstelle füllen.


Konfiguation
------------

Inhalt von ``/etc/dhcp/dhcpd.conf`` für IPv4.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/dhcp/dhcpd.conf
   :language: jinja

Inhalt von ``/etc/dhcp/dhcpd6.conf`` für IPv6.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/dhcp/dhcpd6.conf
   :language: jinja

TODO: IP Ranges anpassen, IPv6 Krams nachschauen und die Konfigurationsdateien anpassen.
