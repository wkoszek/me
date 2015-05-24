s:
	(cd source && middleman server)

# normal build
b:
	middleman build --verbose

# production build
p:
	env TGT_KOSZEK_COM=production rake publish

d:
	dig koszek.com +nostats +nocomments +nocmd

clean:
	rm -rf build
