/*
 * Copyright (c) 2018 The Halo Project Developers.
 *
 * This file is redistributed from solo5.
 * See https://github.com/Solo5/solo5
 *
 * The Halo project is licensed under MIT License.
 * Checkout LICENSE file in the root of source tree.
 */

#include "solo5/libc.h"
#include "solo5/stdio.h"
#include "solo5.h"

int solo5_app_main(const struct solo5_start_info *si)
{
    puts("\n**** Spawn an Halo based instance! ****\n\n");

    size_t len = 0;
    const char *p = si->cmdline;

    while (*p++)
        len++;
    solo5_console_write(si->cmdline, len);

    puts("Hello world!\n");

    return SOLO5_EXIT_SUCCESS;
}