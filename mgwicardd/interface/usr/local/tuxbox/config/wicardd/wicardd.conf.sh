#!/bin/sh
set -x
FILE="/home/root/.xbmc/userdata/addon_data/plugin.program.MgWicardd"
#####Server 1
E="_enable"
enable=`grep $SRV$E $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g' | sed 's/true/1/g' | sed 's/false/0/'`
L="_login"
login=`grep $SRV$L $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g'`
N="_name"
name=`grep $SRV$N $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g'`
P="_pass"
pass=`grep $SRV$P $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g'`
PO="_port"
port=`grep $SRV$PO $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g'`
S="_server"
server=`grep $SRV$S $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g'`
T="_type"
type=`grep $SRV$T $FILE/settings.xml | grep -o value.* | sed 's/value="//g' | sed 's/" \/>//g'`
#####Server 1

cat <<EOF
[global]
active = 1
#log = /tmp/w2.log 
log_size = 100
debug = 3                    
daemon = 1 "

EOF
cat <<EOF
[webif]
active = 0                        
port = 8081                    
debug = 1"

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
#Server 1
SRV=sdfdsdshsrd1
echo "######################$SRV$E#########    $enable##############"
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

SRV=srv2
echo "######################$SRV$E#########    $enable##############"
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