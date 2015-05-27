s:
	(cd source && middleman server)

# normal build
b:
	middleman build --verbose

# production build
p:
	env TGT_KOSZEK_COM=production rake publish
	make u

d:
	dig koszek.com +nostats +nocomments +nocmd
	@echo "============== checking koszek.com ================="
	host -a koszek.com
	@echo "============== checking www.koszek.com ================="
	host -a www.koszek.com

u:
	git checkout gh-pages
	git pull
	git checkout master
	git pull

w:
	./cleanup.sh

t:	tl
	rspec spec/website.rb
tl:
	linkchecker http://127.0.0.1:4567

clean:
	rm -rf build
