# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A user service supervisor"
HOMEPAGE="https://git.sr.ht/~craftyguy/superd"

SRC_URI="
	https://git.sr.ht/~craftyguy/superd/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/gagara/gentooverlay/releases/download/${P}-vendor/${P}-vendor.tar.gz"

SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm ~arm64"

LICENSE="Apache-2.0 BSD GPL-3 MIT Unlicense"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
"

src_configure() {
	unset LDFLAGS
}

src_install() {
	local makeargs=(
		PREFIX=${EPREFIX}/usr
		DESTDIR=${D}
	)
	emake "${makeargs[@]}" install
}
