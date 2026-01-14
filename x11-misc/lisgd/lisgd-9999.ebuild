# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Libinput synthetic gesture daemon"
HOMEPAGE="https://sxmo.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~mil/lisgd"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~mil/lisgd/archive/${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

IUSE="+wayland X"

RDEPEND="
	dev-libs/libinput
	wayland? ( dev-libs/wayland )
	X? ( x11-libs/libX11 )
"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_configure() {
	tc-export CC
	use wayland || export WITHOUT_WAYLAND=1
	use X || export WITHOUT_X11=1
}

src_compile() {
	local makeargs=(
		X11INC=${ESYSROOT}/usr/include
		X11LIB=${ESYSROOT}/usr/lib64
	)
	emake "${makeargs[@]}"
}
