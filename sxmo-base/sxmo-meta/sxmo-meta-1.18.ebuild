# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Sxmo Desktop Environment (meta package)"
HOMEPAGE="https://sxmo.org/"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE="
	+userscripts +feedback screenlocker
"

RDEPEND="
	>=sxmo-base/sxmo-utils-1.18.0
	app-accessibility/wvkbd
	x11-misc/lisgd
	app-misc/bonsai
	app-misc/mnc
	x11-misc/wayout
	app-misc/pnc
	media-fonts/nerdfonts[X,adwaitamono,dejavusansmono,liberationmono]
	userscripts? ( sxmo-base/sxmo-userscripts )
	feedback? ( app-accessibility/clickclack )
	screenlocker? ( x11-misc/peanutbutter )
"
