# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ZIG_SLOT=0.14

inherit zig

DESCRIPTION="Fast, simple, and hackable OSM map viewer for Linux"
HOMEPAGE="https://mepo.lrdu.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~mil/mepo"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~mil/mepo/archive/${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

RDEPEND="
	media-libs/libsdl2
	media-libs/sdl2-ttf
	media-libs/sdl2-gfx
	media-libs/sdl2-image
	net-misc/curl
	sys-apps/busybox
	app-misc/jq
	sys-libs/ncurses
	gnome-extra/zenity
	x11-apps/xwininfo
"
DEPEND="${RDEPEND}
"
BDEPEND="
	dev-lang/zig:0.14
	media-libs/libsdl2
	media-libs/sdl2-ttf
	media-libs/sdl2-gfx
	media-libs/sdl2-image
	net-misc/curl
"

src_configure() {
	zig_src_configure
}
