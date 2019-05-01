Installation
------------

.. code:: bash

    apt-get install sysfsutils

Hop Penality
------------

Die Datei ``/etc/sysfs.d/99-batman-hop-penalty.conf`` mit folgendem Inhalt anlegen.

.. code:: jinja

    class/net/{{ pillar['network']['batman']['interface'] }}/mesh/hop_penalty = 60

