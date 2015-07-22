#!/bin/sh

DRIVE=~/tmp/gdrive/drive

	rm -rf l
	$DRIVE list -q "'0B_PjHVm3K3RVfmgwVUV5SDBLRk1wSm9rYjUtUW1jWW9TVVZCTERVX2tWQ2tLVnFmV09lams' in parents" > _.l
	cat -n _.l

	echo "Enter ID of doc to convert:"
	read ID

	$DRIVE info -i $ID > _.i

	BASENAME=`grep ^Title: _.i | cut -d " " -f 2-`

	$DRIVE download -i $ID -s --format html > _.html

	./html2md.js _.html > _.raw

	sed '1,2d' < _.raw > _.txt



TITLE_CUR=`head -1 _.txt`
echo "Enter title [${TITLE_CUR}] <ENTER/custom title>"
read TITLE_ANSWER
if [ "x${TITLE_ANSWER}" = "x" ]; then
	TITLE=${TITLE_CUR}
	echo "# Empty date, assuming '${TITLE}'"
else
	echo "Give custom title:"
	read TITLE
fi


DATE_CUR=`date +%Y-%m-%d`
echo "Enter date: [${DATE_CUR}]"
read DATE_ANSWER

if [ "x${DATE_ANSWER}" = "x" ]; then
	DATE=${DATE_CUR}
	echo "# Empty date, assuming ${DATE}"
else
	echo "Give custom date"
	read DATE
fi


echo "Tags [a/b] a:"
read TAGS_ANSWER

TAGS="article"
if [ "x$TAGS_ANSWER" = "xb" ]; then
	TAGS="books"
fi

(
	echo
	echo
	echo
	echo "---"
	echo "title:	'$TITLE'"
	echo "tags:	$TAGS"
	echo "read:	$DATE"
	echo "published: true"
	echo "layout:	layout_book"
	echo "ads:"
	echo "- "
	echo "---"
	echo
	echo
	echo
	cat _.txt
) > _.ready
mv -f ${BASENAME}.md ${BASENAME}.md.bak.`head /dev/urandom | md5`
mv -i _.ready ${BASENAME}.md
