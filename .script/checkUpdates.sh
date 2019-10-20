#!/bin/bash

status=`pacman -Sup | wc -l`

if [ "$status" == "0" ] || [ "$status" == "1" ]
then
	echo  " 0"
else
	echo " $status"
fi
