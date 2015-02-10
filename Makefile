PREFIX=/usr/local
BUILD_DIR=build

all:
	@echo "nothing to do"

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -pm 755 close-all-windows $(DESTDIR)$(PREFIX)/bin

clean:
	rm -rf $(BUILD_DIR)/

prepare-build:
	mkdir $(BUILD_DIR)
	cp PKGBUILD $(BUILD_DIR)/PKGBUILD

build: clean prepare-build
	cd $(BUILD_DIR); makepkg
