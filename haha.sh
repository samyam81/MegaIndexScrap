#!/bin/bash

# initurl=$1

# curl $initurl | grep '<span class="name">' | cut -d'"' -f4 | sed "s|^|$initurl|" > first


function goinside 
{
	echo 'inside goinsidefunction'
   funcout=`curl $line | grep '<span class="name">' | cut -d'"' -f4 | sed "s|^|$line|"` 
   echo $funcout | checkfolder

}


function checkfolder
{
	echo 'checking for folder'
	read list
	echo $list | while read line ;
do 
	if  [[ `echo ${line: -1}` == `echo /` ]]
		then echo 'this line is folder'
	echo $line
		goinside $line
else
	# wget $line -p
	echo 'this line is file'
	echo $line >> third
fi
done 
}

function firstcurl 
{
	echo 'readind passed url'
	output=`curl $1 | grep '<span class="name">' | cut -d'"' -f4 | sed "s|^|$1|" | sed "s|$|\n|"`
	echo $output
	echo $output | checkfolder 
}


firstcurl $1
echo start



# while read line ; do mkdir $line | 


# while read line ; do curl $line |grep '<span class="name">'| cut -d'"' -f4 | sed "s|^|$line|" ;done < first > second



# while read line ; do curl $line |grep '<span class="name">'| cut -d'"' -f4 | sed "s|^|$line|" ;done < second > third

