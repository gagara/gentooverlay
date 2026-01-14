# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A community repository of userscripts to use with sxmo"
HOMEPAGE="https://sxmo.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~anjan/sxmo-userscripts"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~anjan/sxmo-userscripts/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	S="${WORKDIR}/${PN}-v${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

RDEPEND="
"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_install() {
	local target_dir=/usr/share/sxmo/userscripts
	dodir ${target_dir}
	insinto ${target_dir}
	doins -r ${S}/{hooks,scripts,README.md}
}
