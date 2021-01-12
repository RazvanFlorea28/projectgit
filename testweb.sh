#!/bin/bash

echo "Checking if the httpd service is up.."
sleep 1
systemctl -q is-active httpd.service  && \
echo "Httpd service is running." || \
echo "Httpd service is not running at all. "

sleep 3

echo "Checking if the port is up and listening.."
sleep 1 
var1=$(sudo netstat -ltupan | grep 80 | awk '{print $6}')
if [[ "$var1" == "LISTEN" ]] ; then
	echo "The port is up and running, in state listen."
else
	echo "The port is not running."
fi

