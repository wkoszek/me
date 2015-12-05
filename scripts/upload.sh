#!/bin/sh

PARNAME="11_BLOG"
DRIVE=gdrive
PARID=`$DRIVE list -q "title = \"${PARNAME}\"" | grep -v ^Id | cut -d " " -f 1`

$DRIVE upload --convert -p $PARID -f $1
