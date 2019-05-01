Installation
------------

.. code:: bash

   apt install rsyslog

Konfiguation
------------

Inhalt von ``50-default.conf`` in dem Verzeichnis ``/etc/rsyslog.d/``.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/rsyslog.d/50-default.conf

Wir legen uns auf eine Log Facility fest, deren Ziel ein schwarzes Loch ist.

Folgende Zeile:

.. code:: text

   *.*;auth,authpriv.none	-/var/log/syslog

wird zu:

.. code::

   *.*;auth,authpriv.none;local6.none	-/var/log/syslog

Anlegen der "Blackhole Logging Facility": ``local6`` in dem Ordner ``/etc/rsyslog.d/`` in der Datei ``99-blackhole.conf``.

.. code:: text

   local6.*	/dev/null
