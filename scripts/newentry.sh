#!/bin/sh

PARNAME="11_BLOG"

DRIVE=~/tmp/gdrive/drive
PARID=`$DRIVE list -q "title = \"${PARNAME}\"" | grep -v ^Id | cut -d " " -f 1`

$DRIVE list -q "'$PARID' in parents" | cat -n

echo "Enter ID of doc to convert:"
read ID

BASENAME=`$DRIVE info -i $ID | grep ^Title: | cut -d " " -f 2-`

$DRIVE download -i $ID -s --format docx > _.docx
$DRIVE download -i $ID -s --format txt > _.txt
pandoc _.docx -o _.md

(mkdir -p _.r && cd _.r && unzip ../_.docx)
mkdir $BASENAME
mv _.r/word/media/* ${BASENAME}/
sed -i "" "s,media/image,${BASENAME}/image,g" _.md

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
	cat _.md
) > _.ready
mv -f ${BASENAME}.md ${BASENAME}.md.bak.`head /dev/urandom | md5`
mv -i _.ready ${BASENAME}.md
echo "# to edit"
echo
echo vim ${BASENAME}.md
