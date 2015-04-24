all: xall

sync:
	tar cjf - . | ssh ${WKOSZEK_MACH} tar -C /home/wkoszek/koszek.com -xjf -

regen:
#	./blog_regen.pl
	./blog_regen.pl *.md
#	./blog_mkfile_gen.sh > _.mk
#	make -f _.mk
	/bin/ls -1 wip/*.html | xargs sed -i"" 's{<link rel="stylesheet" href="/{<link rel="stylesheet" href="{g'

#try:
#	./blog_regen.pl 2012-05-17-stick_control.md
#	/bin/ls -1 wip/*.html | xargs sed -i"" 's{<link rel="stylesheet" href="/{<link rel="stylesheet" href="{g'

xall:	regen sync
