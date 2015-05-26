#!/bin/sh

find . -type f		\
	-name "*.html"	\
	-or		\
	-name "*.css"	\
	-or		\
	-name "*.erb"	\
	-or		\
	-name "*.md"	\
	-print0 | xargs -0 perl -pi -e 's/ +$//'
	perl -0 -pi -w -e "s/\n\n\n/\n/g" *.md
