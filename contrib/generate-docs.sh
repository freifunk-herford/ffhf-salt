#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
current=$(pwd)
cd $base

states=$(cat ../file_roots/gateway/init.sls | awk -F '.' '{/  -/;print $2}')

for state in ${states[@]}; do
	base=docs/source/file_roots/gateway/${state}
	mkdir -p ${base}
	touch ${base}/${state}.rst

	target=${base}/index.rst

	title=$(head ../file_roots/gateway/${state}.sls -n 1 | awk -F '# ' '{print $2}')
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

.. include:: ${state}.rst

Salt State File
---------------

${state}.sls

.. literalinclude:: ../../../../../../file_roots/gateway/${state}.sls
   :language: salt
EOT
done

# yaml+jinja

target=docs/source/file_roots/gateway/index.rst

cat > ${target} << EOT
Gateway
=======

Inhalt:

.. toctree::
   :maxdepth: 4

EOT

for state in ${states[@]}; do
	echo "   ${state}/index" >> ${target}
done

pillars=$(ls ../pillar_roots/gateways)
for pillar in ${pillars[@]}; do
    base=docs/source/pillar_roots/gateways/${pillar%.sls}
    mkdir -p ${base}
    touch ${base}/${pillar%.sls}.rst
    target=${base}/index.rst

    title=$(head ../pillar_roots/gateways/${pillar} -n 1 | awk -F '# ' '{print $2}')
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

.. literalinclude:: ../../../../../../pillar_roots/gateways/${pillar}
   :language: salt
EOT
done

target=docs/source/pillar_roots/gateways/index.rst

cat > ${target} << EOT
Gateways
========

Inhalt:

.. toctree::
   :maxdepth: 4

EOT

for pillar in ${pillars[@]}; do
    echo "   ${pillar%.sls}/index" >> ${target}
done

venv/bin/sphinx-build -b html -a docs/source docs/build/html -d docs/build/doctrees -c docs/source

cd ${current}
