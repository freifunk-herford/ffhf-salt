Ein FIGlet-Font ist eine schmückende Schriftart, die zur Darstellung von Buchstaben und Zahlen aus ASCII-Zeichen zusammengesetzt wird. FIGlet-Fonts sind Teil der ASCII-Art. Die Bezeichnung kommt ursprünglich von einem Computerprogramm namens FIGlet, das diese Schriftarten zur Erstellung von ASCII-Art verwendet.

Installation
------------

.. code:: bash

   apt install figlet

Im Ordner ``/etc/update-motd.d/`` die Datei ``00-ffhf-header`` anlegen.

.. literalinclude:: ../../../../../../file_roots/gateway/etc/update-motd.d/00-ffhf-header
   :language: text

Beispiel Ausgabe:

.. code-block:: text

    _____         _  __             _      _   _            __               _ 
   |  ___| __ ___(_)/ _|_   _ _ __ | | __ | | | | ___ _ __ / _| ___  _ __ __| |
   | |_ | '__/ _ \ | |_| | | | '_ \| |/ / | |_| |/ _ \ '__| |_ / _ \| '__/ _` |
   |  _|| | |  __/ |  _| |_| | | | |   <  |  _  |  __/ |  |  _| (_) | | | (_| |
   |_|  |_|  \___|_|_|  \__,_|_| |_|_|\_\ |_| |_|\___|_|  |_|  \___/|_|  \__,_|
                                                                               
   Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 4.15.0-69-generic x86_64)
   
    * Documentation:  https://help.ubuntu.com
    * Management:     https://landscape.canonical.com
    * Support:        https://ubuntu.com/advantage
   
     System information as of Thu Nov 21 02:02:19 CET 2019
   
     System load:  0.24               Users logged in:        0
     Usage of /:   26.9% of 18.61GB   IP address for ens3:    188.68.40.226
     Memory usage: 17%                IP address for hfBR:    10.34.0.5
     Swap usage:   0%                 IP address for exitVPN: 10.45.10.6
     Processes:    112
   
    * Kata Containers are now fully integrated in Charmed Kubernetes 1.16!
      Yes, charms take the Krazy out of K8s Kata Kluster Konstruction.
   
        https://ubuntu.com/kubernetes/docs/release-notes
   
    * Canonical Livepatch is available for installation.
      - Reduce system reboots and improve kernel security. Activate at:
        https://ubuntu.com/livepatch
   
   0 Software-Pakete können aktualisiert werden.
   0 Aktualisierungen sind Sicherheitsaktualisierungen.
