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

u:
	git checkout gh-pages
	git pull
	git checkout master
	git pull

clean:
	rm -rf build
