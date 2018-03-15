#!/bin/bash
#
# Copyright (c) 2018 The Halo Project Developers.
#
# The Halo project is licensed under MIT License.
# Checkout LICENSE file in the root of source tree.

args=("$@")

remain_args() {
  shift
}

virtio_instance() {
  remain_args
  # FIXME: The argument can't be correctly passed.
  source vendor/solo5/tools/run/solo5-run-virtio.sh build/halo.virtio ${args}
}

virtio_instance
