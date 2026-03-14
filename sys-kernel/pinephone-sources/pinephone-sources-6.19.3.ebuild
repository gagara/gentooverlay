# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="PinePhone sources for the Linux kernel, including megi's patches"
HOMEPAGE="https://www.kernel.org, https://codeberg.org/megi/linux"

MEGI_V=${PV:0:4}
SRC_URI="${KERNEL_URI} https://xff.cz/kernels/${MEGI_V}/patches/all.patch -> pp-sources-${MEGI_V}.patch"

KEYWORDS="~arm ~arm64"

PATCHES=(
	${DISTDIR}/pp-sources-${MEGI_V}.patch
	${FILESDIR}/0101-arm64-dts-pinephone-drop-modem-power-node.patch
)

src_prepare() {
	default
	eapply_user
}
