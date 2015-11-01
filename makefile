all:
	(cd source && middleman server)
render:
	middleman build --verbose
pub:
	env TGT_KOSZEK_COM=production rake publish
	make update
dns:
	dig koszek.com +nostats +nocomments +nocmd
	@echo "============== checking koszek.com ================="
	host -a koszek.com
	@echo "============== checking www.koszek.com ================="
	host -a www.koszek.com
update:
	git checkout gh-pages
	git pull
	git checkout master
	git pull
min:
	rm source/blog/201{2,3,4}*
max:
	git checkout source/blog/201{2,3,4}*
bootstrap:
	bundle install
	gem install image_optim
	gem install image_optim_pack
prepare:
	rm -rf /tmp/access.log /tmp/error.log
	mkdir -p /tmp/www
	cp -rf build/* /tmp/www
test_spec:
	rspec spec/website.rb
test_links:
	linkchecker http://127.0.0.1:8888
test_links_prod:
	linkchecker http://www.koszek.com/
http_start:
	nginx -p /tmp -c `pwd`/etc/nginx.conf || exit 0
http_stop:
	nginx -p /tmp -c `pwd`/etc/nginx.conf -s stop || exit 0
clean:
	./scripts/cleanup.sh
	rm -rf build
	find * -name ".DS_Store" | xargs -n 1 rm -rf
	rm -rf tmp scripts/_.*
doit:	render prepare http_start test_links test_spec http_stop
b:	render
p:	pub
