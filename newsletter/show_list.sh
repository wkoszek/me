#!/bin/sh

# csv_file is from MailChimp export, after unzipping.

if [ $# -ne 1 ]; then
	echo "./show_list <csv_file>\n"
	exit
fi

F=$1

cat $1 | cut -d "," -f 1|grep @ | xargs | sed 's{ {,{g'
