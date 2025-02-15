# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} pypy3 )

inherit distutils-r1

DESCRIPTION="multidict implementation"
HOMEPAGE="
	https://github.com/aio-libs/multidict/
	https://pypi.org/project/multidict/
"
SRC_URI="
	https://github.com/aio-libs/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ppc ppc64 ~riscv ~s390 ~sparc x86 ~x64-macos"

BDEPEND="
	>=dev-python/cython-0.28.4[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs --no-autodoc
distutils_enable_tests pytest

python_prepare_all() {
	# don't enable coverage or other pytest settings
	sed -i -e 's:--cov.*::' setup.cfg || die

	distutils-r1_python_prepare_all
}
