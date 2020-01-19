haveged ist ein Userspace-Daemon zur Bereitstellung von Entropie. Er hängt nicht von den Standardmechanismen zur »Ernte« von Zufälligkeit zur Füllung des System-Entropiepools ab. Das ist wichtig für Systeme mit hohen Entropieanforderungen oder beschränkter Benutzerinteraktion (z.B. Server ohne Anzeigegeräte [headless]).

haveged verwendet HAVEGE (Hardware Volatile Entropy Gathering und Expansion) zur Wartung eines 1M großen Pools von zufälligen Bytes, um /dev/random zu füllen, wenn die Versorgung mit zufälligen Bits in /dev/random unter die untere Schranke des Geräts fällt.

Installation
------------

.. code:: bash

   apt install haveged
