PREFIX=/usr/local

all:
	@echo "nothing to do"

install:
	install -pm 755 close-all-windows $(DESTDIR)$(PREFIX)/bin