#!/usr/bin/env bash

declare -a configure_args

# Speed up one-time builds
configure_args+=(--disable-dependency-tracking)

#configure_args+=(--enable-relocatable)
#configure_args+=(--disable-namespacing)

# conda packages should only use dynamic linking
configure_args+=(--enable-shared)
configure_args+=(--disable-static)

./configure --prefix=${PREFIX} \
    ${configure_args[@]}

make
make check
make install
rm -f ${PREFIX}/lib/${PKG_NAME}.a
rm -rf ${PREFIX}/share/{doc,info}/${PKG_NAME}*
