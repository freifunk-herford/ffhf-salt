Installation
------------

Paketquelle für B.A.T.M.A.N. einbinden.

.. code:: bash

    add-apt-repository ppa:freifunk-mwu/freifunk-ppa

Paketquellen aktualsieren und B.A.T.M.A.N. Kontrollkommando und Kernelmodul installieren.

.. code:: bash

    apt-get update
    apt-get dist-upgrade
    apt-get install batctl batman-adv-dkms

Kernelmodul
-----------

Das Kernelmodul laden.

.. code:: bash

    modprobe -v batman_adv

Um das Kernelmodul beim nächsten Systemstart automatisch laden, legen wir die Datei ``/etc/modules-load.d/batman_adv.conf`` mit folgendem Inhalt an.

.. code:: text

    batman_adv
