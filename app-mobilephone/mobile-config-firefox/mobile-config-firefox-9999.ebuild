# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Mobile and privacy friendly configuration for Firefox"
HOMEPAGE="https://gitlab.com/postmarketOS/mobile-config-firefox"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/postmarketOS/mobile-config-firefox"
	SLOT="0"
else
	SRC_URI="https://gitlab.postmarketos.org/postmarketOS/mobile-config-firefox/-/archive/${PV}/mobile-config-firefox-${PV}.tar.gz"
	SLOT="0/${PV}"
	KEYWORDS="~arm ~arm64"
fi

LICENSE="MPL-2.0"

RDEPEND="
"
DEPEND="${RDEPEND}"
BDEPEND="
"
