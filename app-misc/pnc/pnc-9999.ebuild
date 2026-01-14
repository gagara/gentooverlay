# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Operate on phone numbers from command line"
HOMEPAGE="https://sxmo.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~anjan/pnc"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~anjan/pnc/archive/${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

RDEPEND="
	dev-libs/libphonenumber
"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_configure() {
	cmake_src_configure
}
