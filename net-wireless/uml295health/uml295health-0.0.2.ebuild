# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Healthcheck scripts for Pantech UML295 LTE modem"
HOMEPAGE="https://github.com/gagara/misc/tree/master/uml295health"
SRC_URI="https://github.com/gagara/misc/raw/master/release/${PN}-${PV}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	doconfd conf.d/*
	doinitd init.d/* 
	dobin bin/*
}

