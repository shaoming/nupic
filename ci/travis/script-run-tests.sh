#!/bin/bash
# ----------------------------------------------------------------------
# Numenta Platform for Intelligent Computing (NuPIC)
# Copyright (C) 2013, Numenta, Inc.  Unless you have an agreement
# with Numenta, Inc., for a separate license for this software code, the
# following terms and conditions apply:
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# http://numenta.org/licenses/
# ----------------------------------------------------------------------

echo
echo Running script-run-tests.sh...
echo

# legacy binary tests
${TRAVIS_BUILD_DIR}/bin/py_region_test || exit

# Python unit tests and prep for coveralls reporting
${TRAVIS_BUILD_DIR}/scripts/run_nupic_tests -u --coverage || exit

mv ${TRAVIS_BUILD_DIR}/.coverage ${TRAVIS_BUILD_DIR}/.coverage_unit
# Python integration tests and prep for coveralls reporting
${TRAVIS_BUILD_DIR}/scripts/run_nupic_tests -i --coverage || exit

mv ${TRAVIS_BUILD_DIR}/.coverage ${TRAVIS_BUILD_DIR}/.coverage_integration
