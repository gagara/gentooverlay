# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="On-screen keyboard for wlroots that sucks less"
HOMEPAGE="https://sxmo.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~proycon/wvkbd"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~proycon/wvkbd/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	S="${WORKDIR}/${PN}-v${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

RDEPEND="
	x11-libs/cairo
	x11-libs/pango
	dev-libs/wayland
	x11-libs/libxkbcommon
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/scdoc
	dev-util/wayland-scanner
"

src_prepare() {
	default

	sed -i \
		-e "/^CFLAGS/{s:$: ${CFLAGS}:}" \
		-e "/^PREFIX/{s:=.*:= ${EPREFIX}/usr:}" \
		config.mk || die
	echo "DESTDIR = ${D}" >> config.mk || die
}

src_configure() {
	tc-export CC
}
