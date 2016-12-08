#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
current=$(pwd)
cd $base

function update_file_roots {
	for item in ${init[@]}; do
		folder=$(echo ${item} | awk -F '.' '{print $1}')
		sls=$(echo ${item} | awk -F '.' '{print $2}')
		base=docs/source/file_roots/${folder}/${sls}
		mkdir -p ${base}
		touch ${base}/${sls}.rst
		target=${base}/index.rst
		title=$(head ../file_roots/${folder}/${sls}.sls -n 1 | awk -F '# ' '{print $2}')
		titlemarkup=""
		counter=0
		length=$(echo ${#title})
		while [ ${counter} -lt ${length} ]; do
			titlemarkup="${titlemarkup}="
			let counter=counter+1
		done
		echo ${title} > ${target}
		echo ${titlemarkup} >> ${target}
		cat >> ${target} << EOT

.. include:: ${sls}.rst

Salt State File
---------------

${sls}.sls

.. literalinclude:: ../../../../../../file_roots/${folder}/${sls}.sls
   :language: salt
EOT
	done
}

function update_file_roots_index {
	target=docs/source/file_roots/${folder}/index.rst
	titlemarkup=""
	counter=0
	length=$(echo ${#title})
	while [ ${counter} -lt ${length} ]; do
		titlemarkup="${titlemarkup}="
		let counter=counter+1
	done
	echo ${title} > ${target}
	echo ${titlemarkup} >> ${target}

	cat >> ${target} << EOT

Inhalt:

.. toctree::
   :maxdepth: 4

EOT

	for item in ${init[@]}; do
		folder=$(echo ${item} | awk -F '.' '{print $1}')
		sls=$(echo ${item} | awk -F '.' '{print $2}')
		echo "   ../${folder}/${sls}/index" >> ${target}
	done
}

function update_pillar_roots {
	for pillar in ${pillars[@]}; do
		base=docs/source/pillar_roots/${folder}/${pillar%.sls}
		mkdir -p ${base}
		touch ${base}/${pillar%.sls}.rst
		target=${base}/index.rst
		title=$(head ../pillar_roots/${folder}/${pillar} -n 1 | awk -F '# ' '{print $2}')
		titlemarkup=""
		counter=0
		length=$(echo ${#title})
		while [ ${counter} -lt ${length} ]; do
			titlemarkup="${titlemarkup}="
			let counter=counter+1
		done
		echo ${title} > ${target}
		echo ${titlemarkup} >> ${target}
		cat >> ${target} << EOT

.. include:: ${pillar%.sls}.rst

Salt State File
---------------

${pillar}

.. literalinclude:: ../../../../../../pillar_roots/${folder}/${pillar}
   :language: salt
EOT
	done
}

function update_pillar_roots_index {
	target=docs/source/pillar_roots/${folder}/index.rst
	titlemarkup=""
	counter=0
	length=$(echo ${#title})
	while [ ${counter} -lt ${length} ]; do
		titlemarkup="${titlemarkup}="
		let counter=counter+1
	done
	echo ${title} > ${target}
	echo ${titlemarkup} >> ${target}

	cat >> ${target} << EOT

Inhalt:

.. toctree::
   :maxdepth: 4

EOT

	for pillar in ${pillars[@]}; do
    	echo "   ${pillar%.sls}/index" >> ${target}
	done
}

folder="gateway"
init=$(cat ../file_roots/${folder}/init.sls | awk -F '  - ' '/^  -/{print $2}')
update_file_roots
folder="gateway"
title="Gateway"
update_file_roots_index

folder="map"
init=$(cat ../file_roots/${folder}/init.sls | awk -F '  - ' '/^  -/{print $2}')
update_file_roots
folder="map"
title="Map Server"
update_file_roots_index

folder="gateways"
pillars=$(ls ../pillar_roots/${folder})
update_pillar_roots
folder="gateways"
title="Gateways"
update_pillar_roots_index

folder="map"
pillars=$(ls ../pillar_roots/${folder})
update_pillar_roots
folder="map"
title="Map Server"
update_pillar_roots_index

venv/bin/sphinx-build -b html -a docs/source docs/build/html -d docs/build/doctrees -c docs/source

cd ${current}
