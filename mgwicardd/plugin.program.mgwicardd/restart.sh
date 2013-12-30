#!/bin/sh

ADDON_DIR=/mnt/hdd0/program/.xbmc/addons/plugin.program.mgwicardd

if [ ! -d /var/lib/softcam ]; then
	echo "no exist spoftcam"
	mkdir /var/lib/softcam -p
	touch /var/lib/softcam/running
	cd /
	unzip -o $ADDON_DIR/interface.zip
	chmod 775 /etc/init.d/cardserver.*
	chmod 775 /usr/local/bin/wicardd
	chmod 775 /usr/local/bin/mgcamd
	ln -s /etc/init.d/cardserver.None /etc/init.d/cardserver
	ln -s /etc/init.d/cardserver /app/pre-maruapp/S40cardserver
fi

/etc/init.d/cardserver stop
sleep 2
/etc/init.d/cardserver start


exit 0


