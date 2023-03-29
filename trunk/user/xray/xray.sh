#!/bin/sh

APP=/usr/bin/v2ray
CONF=/etc/storage/xray.json

NUM=`ps | grep -w $APP | grep -v grep | wc -l`
if [ "$NUM" -lt "1" ];then
  export SSL_CERT_FILE=/usr/lib/cacert.pem
  export XRAY_LOCATION_ASSET=/etc/storage
  $APP -config=$CONF &
elif [ "$NUM" -gt "1" ];then
  pgrep -f $APP | xargs kill -9
  sleep 1s
  export SSL_CERT_FILE=/usr/lib/cacert.pem
  export XRAY_LOCATION_ASSET=/etc/storage
  $APP -config=$CONF &
fi

exit 0