
ifeq ($(PREFIX),)
    PREFIX := /usr
endif

helloworld:
	gcc main.c -o helloworld

install: helloworld
	install -d $(DESTDIR)$(PREFIX)/bin/
	install -D -m 0755 helloworld $(DESTDIR)$(PREFIX)/bin/

clean:
	-rm -f helloworld
