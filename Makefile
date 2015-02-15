PREFIX=/usr/local
BUILD_DIR=build
DIST_DIR=dist

all:
	@echo "nothing to do"

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -pm 755 close-all-windows $(DESTDIR)$(PREFIX)/bin

clean:
	rm -rf $(BUILD_DIR)/
	rm -rf $(DIST_DIR)/

archlinux-build: clean
	mkdir $(BUILD_DIR)
	cp PKGBUILD.nochecksums $(BUILD_DIR)/PKGBUILD
	chmod 755 -R $(BUILD_DIR)/*

archlinux-package: archlinux-build
# generage sourcefile checksums
# and gernate package and PKGBUILD file
	cd $(BUILD_DIR); makepkg -g >> PKGBUILD
	cd $(BUILD_DIR); makepkg
	cd $(BUILD_DIR); makepkg --source

# move files to dist folder
	mkdir $(DIST_DIR)
	cp $(BUILD_DIR)/*.tar.gz $(DIST_DIR)/

archlinux-publish: archlinux-package
# tag and push commit to github (ensure clean workspace)
# create Source *-source.tar.gz archive
# generate md5sum of source tar.gz archive and write to PKGBUILD
# submit source package to Github via API
# create AUR package (with source package checksum)
# submit to AUR via curl post request