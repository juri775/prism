#!/bin/sh

/etc/init.d/cardserver stop
sleep 1

rm /usr/local/bin/*cam* -f
rm /usr/local/bin/wicardd -f
rm /usr/local/etc -rf
rm /app/pre-maruapp/S40cardserver
rm /etc/init.d/cardserve* -f
rm /etc/init.d/softca* -f
rm -R /usr/local/tuxbox
rm -R /var/lib/softcam
rm -R /var/keys

sync &
