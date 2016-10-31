Installation
------------

Paketquelle für bird einbinden.

.. code:: bash

    add-apt-repository ppa:cz.nic-labs/bird

Paketquellen aktualsieren und bird installieren.

.. code:: bash

    apt-get update
    apt-get install bird

Konfiguation
------------

Inhalt von ``/etc/bird/bird.conf``.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/bird/bird.conf
   :language: jinja

Todo: Keine Ahnung was in die Konfigurationsdatei kommt. Gibt es noch bird6.conf dazu?
