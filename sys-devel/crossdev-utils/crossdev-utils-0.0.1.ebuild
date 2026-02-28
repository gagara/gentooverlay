# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Misc utilities for cross compilation"
HOMEPAGE="https://github.com/gagara/gentooverlay/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

S=${WORKDIR}

RDEPEND="
"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_install() {
	dobin "${FILESDIR}"/chroot-aarch64
	dobin "${FILESDIR}"/crossenv-bootstrap
}
