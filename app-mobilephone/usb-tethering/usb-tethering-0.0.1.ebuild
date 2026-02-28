# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="USB tethering on Pine64/ConfigFS systems"
HOMEPAGE="https://github.com/dreemurrs-embedded/Pine64-Arch"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64"

S=${WORKDIR}

RDEPEND="
"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_install() {
	newinitd "${FILESDIR}"/${PN}.initd "${PN}"
	exeinto /usr/lib/${PN}
	newexe "${FILESDIR}"/setup.sh setup
	insinto /usr/lib/sysctl.d
	newins "${FILESDIR}"/${PN}.sysctl "10-${PN}.conf"
}

pkg_postinst() {
	elog "You may need to configure dhcp for interface usb0."
	elog "Make sure masquerading is enabled in postrouting chain of NAT table."
	elog "For example, if subnet of usb0 is 192.168.128.0/24:"
	elog "iptables -t nat -A POSTROUTING -s 192.168.128.0/24 -j MASQUERADE"
}
