s:
	(cd source && middleman server)

doit: b vmup tl tr vmdown

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

t:	tl tr

tr:
	rspec spec/website.rb
tl:
	linkchecker http://127.0.0.1:8123
tll:
	linkchecker http://www.koszek.com/

vmup:
	vagrant up
	vagrant ssh -c "sudo service nginx stop"
	vagrant ssh -c "cd /vagrant; make http_start"
vmdown:
	vagrant ssh -c "cd /vagrant; make http_stop"
	vagrant halt

http_start:
	sudo nginx -c `pwd`/etc/vm_nginx.conf
http_stop:
	sudo nginx -c `pwd`/etc/vm_nginx.conf -s stop

clean:
	rm -rf build
