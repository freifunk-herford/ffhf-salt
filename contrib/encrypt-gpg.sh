#!/usr/bin/env bash
# Copyright 2015 - 2017 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

function input_string {
	echo "── Input ────────────────────────────────────────────────────────────────────┐"
	echo "${*}"
	echo "─────────────────────────────────────────────────────────────────────────────┘"
	echo ""
	echo "── Encrypted ────────────────────────────────────────────────────────────────┐"
	encrypted=$(echo "${*}" | tr -d '\n' | gpg --homedir /etc/salt/gpgkeys --armor --encrypt -r saltstack)
	echo "${encrypted}"
	echo "─────────────────────────────────────────────────────────────────────────────┘"
	echo ""
	echo "── Decrypted ────────────────────────────────────────────────────────────────┐"
	echo "${encrypted}" | gpg --homedir /etc/salt/gpgkeys --armor --decrypt -r saltstack
	echo "─────────────────────────────────────────────────────────────────────────────┘"
}

function input_file {
	if [[ -f "${*}" ]]; then
		echo "── Input ────────────────────────────────────────────────────────────────────┐"
		cat "${*}"
		echo "─────────────────────────────────────────────────────────────────────────────┘"
		echo "── Encrypted ────────────────────────────────────────────────────────────────┐"
		encrypted=$(cat "${*}" | gpg --homedir /etc/salt/gpgkeys --armor --encrypt -r saltstack)
	    echo "${encrypted}"
	    echo "─────────────────────────────────────────────────────────────────────────────┘"
	    echo "── Decrypted ────────────────────────────────────────────────────────────────┐"
	    echo "${encrypted}" | gpg --homedir /etc/salt/gpgkeys --armor --decrypt -r saltstack
		echo "─────────────────────────────────────────────────────────────────────────────┘"
	else
		echo "Error: File \"$1\" does not exist!"
	fi
}

if [[ -n $1 ]]; then
	case $1 in
		-f|--file)
			input_file ${*:2}
			;;
		*)
			input_string "${*:1}"
			;;
	esac
else
	echo "Usage: sh $0 string or sh $0 -f filename"
fi
