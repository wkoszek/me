#!/bin/sh

set -x
set -e

BN=aspell6-en-2015.04.24-0
F=${BN}.tar.bz2
URL=ftp://ftp.gnu.org/gnu/aspell/dict/en/${F}

echo "# setting up Aspell dictionaries!!"
(
	cd data
	curl -o $F $URL
	tar xjf $F
	rm $F
	ln -s ${BN} aspell-dict
	cd aspell-dict
	./configure
	make
)
