#!/bin/bash

NPM_PACKAGES=${HOME}/.npm-packages
export PATH=$NPM_PACKAGES/bin:$PATH
export MANPATH=\"$NPM_PACKAGES/share/man:$(manpath)

npm install -g $1
