# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson systemd

COMMIT="a91bc71e23e5a8d5e17b32bb5fa8f3691251dfeb"

DESCRIPTION="Daemon for managing the Quectel EG25 modem"
HOMEPAGE="https://gitlab.com/mobian1/devices/eg25-manager"
SRC_URI="https://gitlab.com/mobian1/eg25-manager/-/archive/${PV}/eg25-manager-${PV}.tar.gz?ref_type=tags -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"

RDEPEND="
	dev-libs/libgpiod
	virtual/libusb:1
	net-misc/modemmanager
"

src_install() {
	meson_src_install
	newinitd "${FILESDIR}"/${PN}.initd "${PN}"
	systemd_dounit "${FILESDIR}"/eg25-manager.service
	insinto /etc/eg25-manager
	newins "${FILESDIR}"/eg25-pinephone-1.0.toml pine64,pinephone-1.0.toml
	newins "${FILESDIR}"/eg25-pinephone-1.1.toml pine64,pinephone-1.1.toml
	newins "${FILESDIR}"/eg25-pinephone-1.2.toml pine64,pinephone-1.2.toml
	newins "${FILESDIR}"/eg25-pinephone-pro.toml pine64,pinephone-pro.toml
}

pkg_postinst() {
	systemd_reenable --all eg25-manager
}
