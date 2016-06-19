#!/bin/sh

F=aspell6-en-2015.04.24-0.tar.bz2
URL=ftp://ftp.gnu.org/gnu/aspell/dict/en/${F}

echo "# setting up Aspell dictionaries!!"
(
	cd data
	curl $URL
	tar xjf $F
	rm $F
	ln -s aspell* aspell-dict
	cd aspell-dict
	./configure
	make
)
