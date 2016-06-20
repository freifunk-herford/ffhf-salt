#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

states=$(cat ~/ablage/ffhf-salt/file_roots/gateway/init.sls | awk -F '.' '{/  -/;print $2}')

for state in ${states[@]}; do
	base=docs/source/file_roots/gateway/${state}
	mkdir -p ${base}
	touch ${base}/${state}.rst

	target=${base}/index.rst

	title=$(head ~/ablage/ffhf-salt/file_roots/gateway/${state}.sls | awk -F '# ' '{print $2}')
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

${state}.sls

.. literalinclude:: ../../../../../../file_roots/gateway/${state}.sls
   :language: yaml
EOT
done

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
