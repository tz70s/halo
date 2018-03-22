# Copyright (c) 2018 The Halo Project Developers.
#
# The Halo project is licensed under MIT License.
# Checkout LICENSE file in the root of source tree.

SOLO5_DIR=vendor/solo5
SOLO5_KERNEL_DIR=$(SOLO5_DIR)/kernel
SOLO5_OBJFILES=$(SOLO5_KERNEL_DIR)/lib.o \
$(SOLO5_KERNEL_DIR)/virtio/solo5.o

SOURCE=halo
# Out source build
BUILD=build

CC=gcc
MD_CFLAGS=-ffreestanding -mno-red-zone
CFLAGS=$(MD_CFLAGS) -std=c11 -Wall -Wextra -Werror -O2 -g -I$(SOLO5_KERNEL_DIR) -I$(SOURCE) -I$(SOURCE)
LD=ld
LDFLAGS=-nostdlib -z max-page-size=0x1000 -static
OBJCOPY=objcopy
OBJFILES=$(BUILD)/app.o

HEADERS=$(SOLO5_KERNEL_DIR)/solo5.h

all: pre_build $(BUILD)/halo.virtio

$(BUILD)/halo.virtio: $(OBJFILES) $(SOLO5_OBJFILES)
	$(LD) -T $(SOLO5_KERNEL_DIR)/virtio/solo5.lds \
	$(LDFLAGS) -o $@ $^

$(BUILD)/%.o: $(SOURCE)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

pre_build: pre_build_solo5
	@mkdir -p build

test:
	@echo "No test currently!"

# Build solo5 core.
# Can be appended on the pre-build.
pre_build_solo5:
	$(MAKE) -C $(SOLO5_DIR)

.PHONY: clean
clean:
	rm -rf build
