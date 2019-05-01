Installation
------------

B.A.T.M.A.N. Kontrollkommando und Kernelmodul installieren.

.. code:: bash

   apt install batctl

Kernelmodul
-----------

Das Kernelmodul laden.

.. code:: bash

   modprobe -v batman_adv

Um das Kernelmodul beim nächsten Systemstart automatisch laden, legen wir die Datei ``/etc/modules-load.d/batman_adv.conf`` mit folgendem Inhalt an.

.. code:: text

   batman_adv
