s:
	(cd source && middleman server)

# normal build
b:
	middleman build --verbose

# production build
p:
	env TGT_KOSZEK_COM=production middleman build --verbose

clean:
	rm -rf build
