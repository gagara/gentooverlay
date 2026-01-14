# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Scripts and C programs to support Sxmo"
HOMEPAGE="https://sxmo.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~mil/sxmo-utils"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~mil/sxmo-utils/archive/${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/scdoc
	sys-apps/busybox
"

src_configure() {
	tc-export CC
}
