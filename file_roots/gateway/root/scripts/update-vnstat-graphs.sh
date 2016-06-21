#!/usr/bin/env bash
# Copyright 2016 - 2016 Tobias Benzin tbenzin@digital-nerv.net
#                       Rally Vincent rvincent@digital-nerv.net

# This file is managed by Salt, do not edit.

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SHELL=/bin/bash

interfaces=$(ls /var/lib/vnstat/)

webroot=/var/www/vnstat

for interface in ${interfaces[@]}; do
	vnstati -i ${interface} -h -o ${webroot}/${interface}_hourly.png
	vnstati -i ${interface} -d -o ${webroot}/${interface}_daily.png
	vnstati -i ${interface} -m -o ${webroot}/${interface}_monthly.png
	vnstati -i ${interface} -t -o ${webroot}/${interface}_top10.png
	vnstati -i ${interface} -s -o ${webroot}/${interface}_summary.png
done

cat > ${webroot}/index.html <<EOT
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Network Traffic</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<style>
			body {
				margin: 0;
				padding: 0;
				white-space: nowrap;
			}
			div {
				display: inline-block;
				vertical-align: top;
			}
			img {
				max-width: 100%;
				height: auto;
			}
		</style>
	</head>
	<body>
EOT

for interface in ${interfaces[@]}; do
	sed s/interface/${interface}/g >> ${webroot}/index.html <<EOT
		<div>
	    	<img src="interface_summary.png" alt="Traffic Summary" /><br>
	    	<img src="interface_monthly.png" alt="Traffic per Month" /><br>
	    	<img src="interface_hourly.png" alt="Traffic per Hour" /><br>
	    	<img src="interface_top10.png" alt="Traffic Top 10" /><br>
	    	<img src="interface_daily.png" alt="Traffic per Day" />
	    </div>
EOT
done

cat >> ${webroot}/index.html <<EOT
	</body>
</html>
EOT
