#!/usr/bin/env bash
# Copyright 2015 - 2015 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

echo -e "Input\n"
echo -e "=====================================================================\n"
echo "${*:1}"

echo -e "\nEncrypted"
echo -e "\n=====================================================================\n"
echo -n "${*:1}" | gpg --homedir ~/.gnupg --armor --encrypt -r saltstack

if [ "$USER" == "root" ]; then
	echo -n "${*:1}" | \
	gpg --homedir ~/.gnupg --armor --encrypt -r saltstack > /tmp/gpg.txt
	echo -e "\nDecrypted"
	echo -e "\n=====================================================================\n"
	cat /tmp/gpg.txt | \
	gpg --homedir /etc/salt/gpgkeys --armor --decrypt -r saltstack
	rm /tmp/gpg.txt
	echo -e "\n"
fi
