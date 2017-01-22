# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Healthcheck scripts for Pantech UML295 LTE modem"
HOMEPAGE="https://github.com/gagara/misc/tree/master/uml295health"
SRC_URI=""
EGIT_REPO_URI="https://github.com/gagara/misc.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	doconfd uml295health/conf.d/*
	doinitd uml295health/init.d/* 
	dobin uml295health/bin/*
}

