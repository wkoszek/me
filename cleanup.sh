#!/bin/sh

rm -rf _.tmp
trap 'rm -rf _.tmp' EXIT ILL INT

find . -type f		\
	\( -name "*.html"	\
	-or		\
	-name "*.erb"	\
	-or		\
	-name "*.md"	\
	-or		\
	-name "*.rb" \)	\
	-print0 | grep -v oldblog | > _.tmp

cat _.tmp | xargs -n 1 -0 perl -0 -pi -w -e 's/ +$//'
cat _.tmp | xargs -n 1 -0 perl -0 -pi -w -e "s/\n\n\n/\n\n/g"
