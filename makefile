all:
	(cd source && bundle exec middleman server)
lint:
	#scripts/yamllint.rb source/blog/*.md
render: lint
	env TGT_KOSZEK_COM=production bundle exec middleman build --verbose
render-dev: lint
	env DEV=yes bundle exec middleman build --verbose
pub: lint
	env TGT_KOSZEK_COM=production bundle exec middleman deploy
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
	rm source/blog/201{2,3,4,5}*
max:
	git checkout source/blog/201{2,3,4,5}*
bootstrap:
	gem install json -v '1.8.3'
	bundle install
	cd data/ && rm -rf aspell-dict && ln -s aspell6* aspell-dict
install_dict:
	./scripts/aspell_setup.sh
spellfix:
	find source/blog | xargs -I @ -n 50 echo bundle exec middleman spellcheck @ --fix --inplace > _.fix
	echo edit _.fix or press ENTER to continue
	read
	sh _.fix
	rm -rf _.fix
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
	nginx -c `pwd`/etc/nginx.conf || exit 0
http_stop:
	nginx -c `pwd`/etc/nginx.conf -s stop || exit 0
clean:
	./scripts/cleanup.sh
	rm -rf build
	find * -name ".DS_Store" | xargs -n 1 rm -rf
	rm -rf tmp scripts/_.*
doit:	render prepare http_start test_links test_spec http_stop
#doit:	render prepare http_start test_spec http_stop
b:	render
p:	pub
