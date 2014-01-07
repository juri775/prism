#!/bin/sh
set -x
FILE="/home/root/.xbmc/userdata/addon_data/plugin.program.MgWicardd"
CONFIG="/home/root/.xbmc/addons/plugin.program.mgwicardd/resources/wicardd.conf.gen.conf"
#FILE=`pwd`


cat <<EOF
[global]
active = 1
#log = /tmp/w2.log 
log_size = 100
debug = 3                    
daemon = 1

EOF
cat <<EOF
[webif]
active = 0                        
port = 8081                    
debug = 1

EOF

cat <<EOF
[dvb]
active = 1 
type = DVBAPI3
filter = dvb
rerequest_not_decoded = 1
auto_update = 1
debug = 3

EOF
cat <<EOF
[balancer]
active = 1
name = name
mode = 4

EOF
#card
cat <<EOF
[reader]
active = 1                                  
name = localcard                              
type = TuxBox 
async_mode = 0
device = /dev/sci0
auto_update = 1                             
debug = 1

EOF

SRV=srv1

enable=`grep $SRV\_enable $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g' | sed 's/true/1/g' | sed 's/false/0/'`
if [ $enable -eq 0 ]; then
	
cat <<EOF
[reader]
active = 0
name = name
type = type
async_mode = 1
account = login:pass@server:port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
else
. $CONFIG


cat <<EOF
[reader]
active = $enable
name = $name
type = $type
async_mode = 1
account = $login:$pass@$server:$port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
fi

SRV=srv2
enable=`grep $SRV\_enable $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g' | sed 's/true/1/g' | sed 's/false/0/'`
if [ $enable -eq 0 ]; then
	
cat <<EOF
[reader]
active = 0
name = name
type = type
async_mode = 1
account = login:pass@server:port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
else
. $CONFIG

cat <<EOF
[reader]
active = $enable
name = $name
type = $type
async_mode = 1
account = $login:$pass@$server:$port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
fi

SRV=srv3
enable=`grep $SRV\_enable $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g' | sed 's/true/1/g' | sed 's/false/0/'`
if [ $enable -eq 0 ]; then
	
cat <<EOF
[reader]
active = 0
name = name
type = type
async_mode = 1
account = login:pass@server:port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
else
. $CONFIG


cat <<EOF
[reader]
active = $enable
name = $name
type = $type
async_mode = 1
account = $login:$pass@$server:$port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
fi
SRV=srv4
enable=`grep $SRV\_enable $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g' | sed 's/true/1/g' | sed 's/false/0/'`
if [ $enable -eq 0 ]; then
	
cat <<EOF
[reader]
active = 0
name = name
type = type
async_mode = 1
account = login:pass@server:port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
else
. $CONFIG

cat <<EOF
[reader]
active = $enable
name = $name
type = $type
async_mode = 1
account = $login:$pass@$server:$port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
fi
SRV=srv5
enable=`grep $SRV\_enable $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g' | sed 's/true/1/g' | sed 's/false/0/'`
if [ $enable -eq 0 ]; then
	
cat <<EOF
[reader]
active = 0
name = name
type = type
async_mode = 1
account = login:pass@server:port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
else
. $CONFIG

cat <<EOF
[reader]
active = $enable
name = $name
type = $type
async_mode = 1
account = $login:$pass@$server:$port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
fi
SRV=srv6
enable=`grep $SRV\_enable $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g' | sed 's/true/1/g' | sed 's/false/0/'`
if [ $enable -eq 0 ]; then
	
cat <<EOF
[reader]
active = 0
name = name
type = type
async_mode = 1
account = login:pass@server:port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
else
. $CONFIG

cat <<EOF
[reader]
active = $enable
name = $name
type = $type
async_mode = 1
account = $login:$pass@$server:$port
reconnect_delay = 10
debug = 1
emm_cache = 1 
ecm_ttl = 5000

EOF
fi