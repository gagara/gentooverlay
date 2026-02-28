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
	#dodir /usr/lib/${PN}
	insinto /usr/lib/${PN}
	doins "${FILESDIR}"/setup.sh
	insinto /usr/lib/sysctl.d
	newins "${FILESDIR}"/${PN}.sysctl "10-${PN}.conf"
}

pkg_postinst() {
	elog "You may need to configure dhcp for interface usb0."
	elog "Make sure masquerading is enabled in postrouting chain of NAT table."
	elog "It can be done with:"
	elog "iptables -t nat -A POSTROUTING -s 10.15.19.0/24 -j MASQUERADE"
}
