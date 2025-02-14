#!/usr/bin/env bash

make_install() {
    if [ -n "$PREFIX" ]
    then
        PREFIX="$PREFIX" make install
    else
        sudo make install
    fi
}

dir=$(mktemp -t -d git-extras-install.XXXXXXXXXX) \
    && cd "$dir" \
    && echo "Setting up 'git-extras'...." \
    && git clone https://github.com/pierreay/git-extras.git &> /dev/null \
    && cd git-extras \
    && git checkout dev &> /dev/null \
    && make_install \
    && rm -rf "$dir"

