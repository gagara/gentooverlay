# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson ninja-utils

DESCRIPTION="Output simple text to a wayland desktop widget"
HOMEPAGE="https://sxmo.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~proycon/wayout"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~proycon/wayout/archive/${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

RDEPEND="
	x11-libs/cairo
	x11-libs/pango
	dev-libs/wayland
	dev-libs/wayland-protocols
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/scdoc
	dev-util/wayland-scanner
"

src_configure() {
	meson_src_configure
}
