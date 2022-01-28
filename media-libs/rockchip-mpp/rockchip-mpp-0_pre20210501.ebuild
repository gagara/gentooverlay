# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake flag-o-matic

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rockchip-linux/mpp.git"
	SRC_URI=""
else
	GIT_COMMIT="03f94da031f956f79885314e21e14508efcd8cf8"
	SRC_URI="https://github.com/rockchip-linux/mpp/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm64"
	S="${WORKDIR}/mpp-${GIT_COMMIT}"
fi

DESCRIPTION="Rockchip Media Process Platform (MPP)"
HOMEPAGE="https://github.com/rockchip-linux/mpp"

LICENSE="Apache-2.0"
SLOT="0"

DEPEND=""
RDEPEND=""

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DHAVE_DRM=ON
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
}
