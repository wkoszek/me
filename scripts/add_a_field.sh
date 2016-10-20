#!/bin/sh

if [ $# -ne 1 ]; then
	echo "this will attempt to add an empty field to each blog post"
	echo "you'll have to go and edit it later"
	echo "add_a_field NAME"
	exit 64
fi

sed -i '' "/author:/a\
$1:\
" $*
