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
md5sums=('f9411dff06d699262e4ed1c2741a478c')

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" PREFIX=/usr install
}