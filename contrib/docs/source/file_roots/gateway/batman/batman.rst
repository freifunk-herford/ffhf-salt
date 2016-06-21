Installation
------------

Paketquelle für B.A.T.M.A.N. einbinden.

.. code:: bash

    sudo add-apt-repository ppa:freifunk-mwu/freifunk-ppa

Paketquellen aktualsieren und B.A.T.M.A.N. Kontrollkommando und Kernelmodul installieren.

.. code:: bash

    sudo apt-get update
    sudo apt-get dist-upgrade
    sudo apt-get install batctl batman-adv-dkms

Kernelmodul
-----------

Das Kernelmodul laden.

.. code:: bash

    modprobe -v batman_adv

Um das Kernelmodul beim nächsten Systemstart automatisch laden, legen wir die Datei ``/etc/modules-load.d/batman_adv.conf`` mit folgendem Inhalt an.

.. code:: text

    batman_adv

Hop Penality
------------

.. code:: bash

    sudo apt-get install sysfsutils

Die Datei ``/etc/sysfs.d/99-batman-hop-penalty.conf`` mit folgendem Inhalt anlegen.

.. code:: jinja

    class/net/{{ pillar['network']['batman']['interface'] }}/mesh/hop_penalty = 60
