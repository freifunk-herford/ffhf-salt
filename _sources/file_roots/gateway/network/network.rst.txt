Installation
------------

.. code:: bash

    apt-get install bridge-utils

Kernel Parameter
----------------

Folgende Kernel Parameter einstellen und speichern.

.. code:: bash

    sysctl -w net.ipv4.ip_forward="1"
    sysctl -w net.ipv4.conf.default.rp_filter="0"
    sysctl -w net.ipv4.conf.all.rp_filter="0"
    sysctl -w net.ipv6.conf.all.forwarding="1"
    sysctl -w net.ipv6.conf.all.autoconf="0"
    sysctl -w net.ipv6.conf.default.autoconf="0"
    sysctl -w net.ipv6.conf.all.accept_ra="0"
    sysctl -w net.ipv6.conf.default.accept_ra="0"

Schnittstellen
--------------

.. caution:: In der Datei ``/etc/network/interfaces`` sollte der Eintrag ``source /etc/network/interfaces.d/*`` stehen!

Netzwerk Brücke ``/etc/network/interfaces.d/bridge``.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/network/interfaces.d/bridge
   :language: bash

B.A.T.M.A.N. Schnittstelle ``/etc/network/interfaces.d/batman``.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/network/interfaces.d/batman
   :language: bash

Mesh Schnittstelle (fastd) ``/etc/network/interfaces.d/mesh``.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/network/interfaces.d/mesh
   :language: bash

Netzwerk Brücke
---------------

Mit dem Befehl ``ifup {{ bridge }}`` die Netzwerk Brücke starten, falls diese nicht vorhanden ist.
