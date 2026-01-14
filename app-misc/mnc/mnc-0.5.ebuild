# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="MyNextCron - calculate the time when the next cronjob will be ran"
HOMEPAGE="https://sxmo.org/"

SRC_URI="
	https://git.sr.ht/~anjan/mnc/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/gagara/gentooverlay/releases/download/mnc-0.5-vendor/${P}-vendor.tar.xz"

SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm ~arm64"

LICENSE="Unlicense"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
"

src_compile() {
	ego build
}

src_install() {
	dobin mnc

	default
}
