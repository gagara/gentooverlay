# Copyright (c) 2017 sakaki <sakaki@deciban.com>
# Copyright 2026 Gentoo Authors
# License: GPL v2 or GPL v3+
# NO WARRANTY

EAPI=8

KEYWORDS="~arm arm64"

DESCRIPTION="Autoexpand root partition for the gentoo image"
HOMEPAGE="https://github.com/GenPi64/gentoo-on-rpi3-64bit"
SRC_URI=""
LICENSE="GPL-3+"
SLOT="0"
IUSE="-systemd"
RESTRICT="mirror"
AR_SVCNAME="autoexpand-root"

# required by Portage, as we have no SRC_URI...
S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}
	systemd?  ( >=sys-apps/systemd-249.7 )
	!systemd? ( >=sys-apps/openrc-0.44.10 )
	>=app-shells/bash-5.1_p8
	>=sys-fs/btrfs-progs-6.19"

src_install() {
	newinitd "${FILESDIR}/init.d_autoexpand_root-5" "${AR_SVCNAME}"
	exeinto /boot
	newexe "${FILESDIR}/autoexpand_root.sh-5" "autoexpand_root.sh"
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		rc-update add "${AR_SVCNAME}" boot
		elog "The first-boot root partition resizing service has been activated."
		elog "This service will run as long as the sentinel file /boot/dont_autoexpand_root"
		elog "Does not exist."
		elog "To disable entirely, run:"
		elog "  rc-update del ${AR_SVCNAME} boot"
	fi
	if use systemd; then
		ewarn "You are running with the systemd USE flag set!"
		ewarn "However, this package does not yet formally support systemd, so"
		ewarn "you are on your own to get things working ><"
	fi
}
