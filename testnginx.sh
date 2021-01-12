#!/bin/bash

echo "Checking if the NGINX is up.."
sleep 1

var1=$( sudo docker exec -it nginx bash -c "service nginx status | cut -d' ' -f3")
if [[ $var1 ]] ; then
	echo "Service Nginx is running."
else
	echo "Service Nginx is not running."
fi
sleep 3

echo "Checking if the port is up and listening.."
sleep 1
var1=$(sudo netstat -ltupan | grep 8080 | awk '{print $6}')
if [[ "$var1" == "LISTEN" ]] ; then
	echo "The port is up and running, in state listen."
else
	echo "The port is not running."
fi

sleep 3

echo "Testing the functionality of nginx, giving 3 consecutive requests. Nginx is acting as a load balancer using default algorithm Round Robin"
sleep 3
var2=$(sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx)
if [[ $var2 ]] ; then
	echo "First request.."
	sleep 1
	curl http://$var2/
	sleep 1
	echo "Second request.."
	sleep 1
	curl http://$var2/
	sleep 1
	echo "Third request.."
	sleep 1
	curl http://$var2/
else
	echo "Can not execute requests!Check nginx service."
fi

