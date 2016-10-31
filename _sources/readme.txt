Readme
======

Master installieren und konfigurieren.
--------------------------------------

Todo: Anleitung schreiben

GPG Encryption einrichten.
--------------------------

Todo: Anleitung aus Readme übernehmen.

Minion installieren und konfigurieren.
--------------------------------------

**Auf dem Minion folgendes ausführen.**

Unter Ubuntu 14.04 LTS folgendes zusätzlich ausführen.

.. code:: bash

    sudo add-apt-repository ppa:saltstack/salt
    sudo apt-get update
    sudo apt-get dist-upgrade

Unter Ubuntu 14.04 und 16.04 nun folgendes ausführen.

.. code:: bash

    sudo apt-get install salt-minion
    sudo vi /etc/salt/minion

Folgende Einträge in ``/etc/salt/minion`` anpassen.

.. code:: text

	master: <master>
	id: <minion_id>
	hash_type: sha256

Anschließend den Minion neu starten.

.. code:: bash

    sudo service salt-minion restart

**Auf dem Master folgendes ausführen.**

.. code:: bash

    salt-key -a <minion_id>

So wird der Minion auf dem Master akzeptiert. Nun kann man noch einen Test durchführen, vorausgesetzt der Minion ist schon unter ``base:`` in der ``top.sls`` der ``file_roots`` eingetragen.

.. code:: bash

    salt <minion_id> state.show_highstate

.. literalinclude:: ../../../readme.md
   :language: text
