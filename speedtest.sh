#!/bin/bash
#Retrieve download speed
#Ping: xx.xxx ms
#Download: xxx.xx Mbit/s
#Upload: xxx.xx Mbit/s
SPEED=$(speedtest-cli --simple)
LAT=$(awk -v var="$SPEED" ' BEGIN {print var}' | awk ' /Ping/{print $2}')
DOWN=$(awk -v var="$SPEED" ' BEGIN {print var}' | awk ' /Download/{print $2}')
UP=$(awk -v var="$SPEED" ' BEGIN {print var}' | awk ' /Upload/{print $2}')
# Fill in info for username, password, webserver, and indexes. 
OUTPUTLAT=`curl -u xxx:xxx "http://192.168.x.x:xxxx/json.htm?type=command&param=udevice&idx=x&nvalue=0&svalue=$LAT"`
OUTPUTDOWN=`curl -u xxx:xxx "http://192.168.x.x:xxxx/json.htm?type=command&param=udevice&idx=x&nvalue=0&svalue=$DOWN"`
OUTPUTUP=`curl -u xxx:xxx "http://192.168.x.x:xxxx/json.htm?type=command&param=udevice&idx=x&nvalue=0&svalue=$UP"`
