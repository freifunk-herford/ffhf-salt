Installation
------------

.. code:: bash

    apt-get install bash

Nützliche Aliase in die Datei ``/root/.bash_aliases`` hinzufügen:

.. code:: bash

    # Some more alias to avoid making mistakes:
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    # Some comfort
    alias lc="awk '{ nlines++ } END { print nlines }'

======================================= ========================================================
Befehl                                  Beschreibung
--------------------------------------- --------------------------------------------------------
rm -i                                   prompt before every removal
cp -i                                   prompt before overwrite (overrides a previous -n option)
mv -i                                   prompt before overwrite
awk '{ nlines++ } END { print nlines }' counts lines in a file
======================================= ========================================================
