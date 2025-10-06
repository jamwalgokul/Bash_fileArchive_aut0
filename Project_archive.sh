#!/bin/bash
#################################################################################
#Author: Gokul Jamwal
#Date: 06-10-2025
#Description: This project is all about using your disk in an efficient way by compressing larger files and send them to an archive folder.
##################################################################################

#The code starts from here:

#Variables

BASE=/home/kali/myScripts  #Change the path accordingly
DEPTH=1
DAYS=10
RUN=0

#Check if the Directory is Present or not.

if [[! -d $BASE ]]
then
	echo "No such Directory is Present"
	exit 11
fi

#Create an archive Folder if not Present

if [[ ! -d $BASE/archive ]]
then
	mkdir $BASE/archive
	
fi

#Now we are compressing the files and transfering them to the archive folder

for i in 'find $BASE -maxdepth $DEPTH -type -f -size +20M' #you can change the size 
do 
	if [[ $RUN -eq 0 ]]
	then	
		echo "[$(date "+Y%-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
	
		gzip $i || exit 11
		mv $i.gz $BASE/archive || exit 11
		fi
done
