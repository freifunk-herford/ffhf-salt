Installation
------------

.. code:: bash

    sudo apt-get install iproute

Tabellen
--------

Wir ergänzen die Datei ``/etc/iproute2/rt_tables`` mit unseren Routing Tabellen.

.. code:: text

    #
    # icvpn table
    23  icvpn
    #
    # local community table
    41  ffhf
    #
    # internet exit table
    61  ffinetexit

Wie zu erkennen ist verwenden wir 3 Routing Tabellen:

* icvpn (wird dynamisch über BGP gefüllt)
* ffhf (enthält statische Routen der Community-Netze)
* ffinetexit (enthält Routen für den Internet-Verkehr)

Regeln und Routen
-----------------

Vor dem Eintrag ``exit 0`` in der Datei ``/etc/rc.local`` fügen wir die Regeln und Routen ein, dass sollte dann in etwa so aussehen.

.. caution:: Die letzte Zeile der Datei muss ``exit 0`` beinhalten!

.. literalinclude:: ../../../../../../file_roots/gateway/etc/rc.local
   :language: jinja

Todo: Den Krams in Interfaces mir reinpacken und rauf- und runterfahren mit dem Interface?

Weitere Informationen
---------------------

* `Policy Routing`_ Anleitung vom Freifunk Mainz, Wiesbaden & Umgebung

.. _`Policy Routing`: https://gluon-gateway-doku.readthedocs.org/de/latest/configuration/policyrouting.html
