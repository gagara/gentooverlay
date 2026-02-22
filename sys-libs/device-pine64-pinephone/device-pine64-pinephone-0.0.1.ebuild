# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Pine64 PinePhone configs"
HOMEPAGE="https://postmarketos.org"

SLOT="0/${PV}"
KEYWORDS="~arm ~arm64"

S=${WORKDIR}

LICENSE="GPL-3"

RDEPEND="
"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_install() {
	local target_dir=/usr/lib/udev/rules.d
	insinto ${target_dir}
	doins -r "${FILESDIR}"/*.rules
}
