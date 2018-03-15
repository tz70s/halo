#!/bin/bash
#
# Copyright (c) 2018 The Halo Project Developers.
#
# The Halo project is licensed under MIT License.
# Checkout LICENSE file in the root of source tree.

fetch() {
  # TODO: Check existed.
  mkdir -p vendor
  git clone https://github.com/Solo5/solo5.git vendor/solo5
}

compile() {
  cd vendor/solo5
  make
}

fetch
compile