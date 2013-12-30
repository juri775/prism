#!/bin/sh
#set -x
PNAME=plugin.program.mgwicardd
RMOLD=`cat $PNAME/ver`

  rm $PNAME$RMOLD.zip $PNAME/interface.zip
  
DATE=`date +_%F`

  cd interface
  
zip -r -9 ../$PNAME/interface.zip *
  cd -
zip -r -9 $PNAME$DATE.zip  $PNAME
  echo $DATE > $PNAME/ver