# Copyright 1999-2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="A Finite State Machine structured as a tree that trigger commands"
HOMEPAGE="https://bonsai.builtwithhare.org/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~stacyharper/bonsai"
	SLOT="0"
else
	SRC_URI="https://git.sr.ht/~stacyharper/bonsai/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	SLOT="0/${PV}"
	S="${WORKDIR}/${PN}-v${PV}"
	KEYWORDS="~amd64 ~arm ~arm64"
fi

LICENSE="GPL-3"

RDEPEND="
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-hare/hare-json
	dev-hare/hare-ev
	media-gfx/graphviz
"

PATCHES=(
	"${FILESDIR}/hareflags.patch"
)

src_configure() {
	tc-export LD AS
}

src_compile() {
	tc-is-cross-compiler && local makeargs=(HAREFLAGS="-a ${CHOST%%-*}")
	emake "${makeargs[@]}"
}

src_install() {
	local makeargs=(
		PREFIX=${EPREFIX}/usr
		DESTDIR=${D}
	)
	emake "${makeargs[@]}" install
}
