PREFIX=/usr/local
BUILD_DIR=build
DIST_DIR=dist
VERSION=$(shell cat PKGBUILD* | grep pkgver= | cut -d= -f 2)
NAME=$(shell cat PKGBUILD* | grep pkgname= | cut -d= -f 2 | cut -d\' -f 2)
SOURCE_ARCHIVE=$(NAME)-$(VERSION)-source.tar.gz

all:
	@echo "nothing to do"

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -pm 755 close-all-windows $(DESTDIR)$(PREFIX)/bin

	mkdir -p $(DESTDIR)/etc
	install -pm 755 close-all-windows.conf $(DESTDIR)/etc

	mkdir -p $(DESTDIR)$(PREFIX)/share/applications
	install -pm 755 close-all-windows.desktop $(DESTDIR)$(PREFIX)/share/applications

clean: clean-build
	rm -rf $(DIST_DIR)/

clean-build:
	rm -rf $(BUILD_DIR)/

source-package: clean
	@[[ "$(git status | grep "working directory clean")" != "" ]] || echo "==========================="; echo "WARNING: Changes not committed!"; echo "==========================="
	cd .. && tar -zcvf $(SOURCE_ARCHIVE) close-all-windows --exclude "close-all-windows/.git"
	mkdir -p $(DIST_DIR)
	mv ../$(SOURCE_ARCHIVE) $(DIST_DIR)/$(SOURCE_ARCHIVE)

archlinux-build: source-package clean-build
	mkdir $(BUILD_DIR)
	cp PKGBUILD.nochecksums $(BUILD_DIR)/PKGBUILD
	cp $(DIST_DIR)/$(SOURCE_ARCHIVE) $(BUILD_DIR)/$(SOURCE_ARCHIVE)
	chmod 755 -R $(BUILD_DIR)/*

archlinux-package: archlinux-build
# generage sourcefile checksums
# and gernate package and PKGBUILD file
	cd $(BUILD_DIR); makepkg -g >> PKGBUILD
	cd $(BUILD_DIR); makepkg
	cd $(BUILD_DIR); makepkg --source

# move files to dist folder
	mkdir -p $(DIST_DIR)
	cp $(BUILD_DIR)/*.tar.gz $(DIST_DIR)/

archlinux-package-and-install: archlinux-package
	echo -e "\n" | sudo pacman -U build/*.pkg.tar.xz

archlinux-publish: archlinux-package

install-and-test:
	gnome-terminal -x sh -c "echo 'Installing close-all-windows'; sudo -E make PREFIX=/usr install && close-all-windows --simulate --verbose; sleep 100"


# tag and push commit to github (ensure clean workspace)
# create Source *-source.tar.gz archive
# generate md5sum of source tar.gz archive and write to PKGBUILD
# submit source package to Github via API
# create AUR package (with source package checksum)
# submit to AUR via curl post request