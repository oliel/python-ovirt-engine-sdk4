#!/bin/sh -e

TARBALL="ovirt-engine-sdk-python-${PACKAGE_VERSION}.tar.gz"

find . -not -name '*.spec' -not -name '*.in' -type f | tar --files-from /proc/self/fd/0 -czf "${TARBALL}" python-ovirt-engine-sdk4.spec

# Directory, where build artifacts will be stored, should be passed as the 1st parameter
ARTIFACTS_DIR=${1:-exported-artifacts}

# Prepare source archive
[[ -d rpmbuild ]] || mkdir -p rpmbuild

rpmbuild \
    -D "_topdir rpmbuild" \
    -ts ${TARBALL}
