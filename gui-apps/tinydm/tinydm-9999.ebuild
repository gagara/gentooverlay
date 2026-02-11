# Copyright 2021-2024 Robert Günzler
# Copyright 2026 Viacheslav Gagara
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="tiny display manager - wayland/x11 session starter for single user machines"
HOMEPAGE="https://gitlab.com/postmarketOS/tinydm"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.postmarketos.org/postmarketOS/tinydm.git"
else
	SRC_URI="https://gitlab.postmarketos.org/postmarketOS/tinydm/-/archive/${PV}/tinydm-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~aarch64 ~arm ~arm64"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	sys-apps/autologin
	gui-libs/display-manager-init
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/log.patch"
)

src_compile() {
	return
}

src_install() {
	default

	dobin ${FILESDIR}/tinydm-run-session-autologin
}
