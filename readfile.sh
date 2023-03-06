#!/bin/bash


function goinside 
{
	targetfile=`mktemp`
   funcout=`curl $line | grep '<span class="name">' | cut -d'"' -f4 | sed "s|^|$line|" > $targetfile ` 
   checkfolder $targetfile
}


function checkfolder
{
	echo 'checking for folder'
	 while read line ;
do 
	if  [[ `echo ${line: -1}` == `echo /` ]]
		then echo 'this line is folder'
	    echo $line
		goinside $line
else
	echo 'downloading..'
	wget $line -p
fi
done  < $1
}

function firstcurl 
{
	echo 'reading passed url'
	output=`curl $1 | grep '<span class="name">' | cut -d'"' -f4 | sed "s|^|$1|"  > first`
	 checkfolder first 
}


firstcurl $1
echo start

