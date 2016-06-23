Installation
------------

.. code:: bash

    apt-get install openvpn

Konfiguation
------------

.. hint:: ``{{ exit }}`` ist die VPN-Schnittstelle.

Ein Script mit dem folgenden Inhalt für die Überwachung des VPN Tunnels in ``/root/scripts`` mit dem Namen ``check-openvpn.sh`` anlegen.

.. caution:: Nicht vergessen das Script mit ``chmod +x scripts/check-openvpn.sh`` ausführbar zu machen.

.. literalinclude:: ../../../../../../file_roots/gateway/root/scripts/check-openvpn.sh
   :language: bash

Einen Cronjob mit Hilfe von ``crontab -e`` mit folgendem Inhalt anlegen.

.. code:: text

    */10 * * * * /root/scripts/check-openvpn.sh

Mullvad
-------

Can one account be used on multiple computers?

    Yes, up to three. Use the same customer id on all the computers.

    Set the customer id under Settings in the client program.

    -- `Mullvad FAQ`_

Von `Mullvad`_ erhält man ein gepacktes Archiv ``mullvadconfig.zip``, aus diesem Archiv legen wir die Dateien ``ca.crt``, ``crl.pem``, ``mullvad.crt`` und ``mullvad.key`` in den Ordner ``/etc/openvpn`` ab.

.. hint:: ``{{ exit }}`` ist die VPN-Schnittstelle.

Die Datei ``mullvad_linux.conf`` in den Ordner ``/etc/openvpn`` kopieren und wie folgt anpassen.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/openvpn/mullvad_linux.conf
   :language: jinja

In der Datei ``/etc/default/openvpn`` eine Eintrag wie folgt einfügen oder anpassen.

.. code:: text

    AUTOSTART="mullvad_linux"

.. _`Mullvad`: https://mullvad.net/
.. _`Mullvad FAQ`: https://mullvad.net/en/faq/#multiple_conn
