pkgname='close-all-windows'
pkgver=0.0.1
pkgrel=1
pkgdesc="Gracefully close all X11 windows."
arch=('any')
url="https://github.com/vilnius-leopold/close-all-windows"
license=('MIT')
depends=('ruby' 'wmctrl')
conflicts=()
makedepends=()
source=("$pkgname::https://github.com/vilnius-leopold/$pkgname/archive/$pkgver.tar.gz")

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
