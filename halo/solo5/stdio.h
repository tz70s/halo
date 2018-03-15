/*
 * Copyright (c) 2018 The Halo Project Developers.
 *
 * The Halo project is licensed under MIT License.
 * Checkout LICENSE file in the root of source tree.
 */

#ifndef HALO_SOLO5_STDIO_H_
#define HALO_SOLO5_STDIO_H_

#include "solo5.h"
#include "solo5/libc.h"

/* TODO: Printf function */
static void puts(const char *s) { solo5_console_write(s, strlen(s)); }

#endif // HALO_SOLO5_STDIO_H_