#!/bin/sh

# keyupdate.sh v1.0 by Ronald
#
# This script wil try to get a SoftCam.Key from various locations.
# It first tries to get SoftCam.Key from the url's listed in /var/etc/keyupdate.url
# If that fails, it wil fetch a list of url's from the gamesquad server
# and try every url from that list (if any)
#
# This script wil not write to /var when the downloaded SoftCam.Key file is the
# same as the previuos downloaded file (To prevent wear of flash)

#echo "0=$0"
[ -f "/var/etc/.custom_scripts" -a -x "/usr/local/sbin/keyupdate.sh" -a "$0" != "/usr/local/sbin/keyupdate.sh" ] && exec /var/bin/keyupdate.sh "$@"

update()
{
	RET=0
	echo "Trying url: $URL"
	if wget "$URL" -q -O $NEW ; then
		if [ "`cat 2>/dev/null $NEW`" != "`cat 2>/dev/null $PREV`" ]; then
        		test -f $SOFTCAM && mv $SOFTCAM $SOFTCAM.0
			cp $NEW $PREV
			cp $NEW $SOFTCAM
        		cp $NEW $KEYLIST
			echo "keyupdate: Keys backed up and updated."
       		else
        		echo "keyupdate: Downloaded keys are same\nas current, not updating /var"
       		fi
	else
		RET=1
	fi
	return $RET
}

[ -e /tmp/SoftCam.Key.new ] && > /tmp/SoftCam.Key.new
NEW=/tmp/SoftCam.Key.new
SOFTCAM=/var/keys/SoftCam.Key
PREV=$SOFTCAM.prev
LIST=/usr/local/etc/keyupdate.url
KEYLIST=/var/etc/oscam.keys

for URL in `grep -v '^#' $LIST`
do
  update && break
done && {
echo "keyupdate: Success" 
ERR=0
} || {
echo "keyupdate: No SoftCam.Key found"
ERR=1
}
rm -f $NEW $URL_LIST

exit $ERR