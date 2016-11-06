Installation
------------

Um die Paketquellen von fastd einzubinden erstellen wir eine die Datei ``/etc/apt/sources.list.d/repo.universe-factory.net.list`` und tragen dort folgendes ein.

.. code:: text

    deb https://repo.universe-factory.net/debian/ sid main

Nun aktualisieren wir unsere Paketquellen und installieren fastd.

.. code:: bash

    apt-key adv --keyserver keyserver.ubuntu.com --recv 16EF3F64CB201D9C
    apt-get update
    apt-get dist-upgrade
    apt-get install fastd

Schlüssel generieren
--------------------

.. hint:: Der Schlüssel kann auch Lokal generiert werden.

.. code:: bash

    apt-get install haveged

Den Schlüssel generieren.

.. code:: bash

    fastd --generate-key

Den privaten Schlüssel (Secret) speichern wir in die Datei ``/etc/fastd/{{ grains['id'] }}/secret.conf``, dass sollte dann so ausssehen.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/fastd/gw/secret.conf
   :language: jinja

Den öffentlichen Schlüssel (Public) speichern wir dann unter ``/etc/fastd/{{ grains['id'] }}/peers/{{ grains['id'] }}``, dass sollte dann so aussehen.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/fastd/gw/peers/peer
   :language: jinja

Entropie=Wahnsinn=haveged wozu?

    "neoraider" hat mich auf #gluon gebrieft.

    1. haveged wird nur fuer den ersten Boot bzw. im Configmode fuer die Generierung der Keys fuer fastd und ssh benoetigt.

    2. haveged braucht im Betrieb ca. 800kB RAM und es ist im Moment kein RAM-Mangel bekannt, auch beim Meshen nicht."

    -- `Gmon`_

Konfiguration
-------------

Inhalt von ``fastd.conf``.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/fastd/gw/fastd.conf
   :language: jinja

Peers
-----

Die Peers sollten mit den anderen Gateways syncronisiert werden, so dass alle Peers dann in dem Verzeichnis ``/etc/fastd/{{ grains['id'] }}/peers`` verfügbar sind.

.. _`Gmon`: https://forum.ffrn.de/t/entropie-wahnsinn-haveged-wozu/1069/10
