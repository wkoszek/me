#!/usr/bin/env sh

mkdir -p to_proofread

/bin/ls -1 ../source/blog/*.md | while read FN; do
	BN_MD=`basename $FN`
	BN=${BN_MD%%.md}
	pandoc -o to_proofread/${BN}.docx $FN
done
