#include <stdint.h>
#include "../boot/src/boot_types.h"
#include "kernel.h"

void entry_point(bootinfo_t *binfo)
{
    uint32_t x_axis = binfo->vinfo.x_axis;
    uint32_t y_axis = binfo->vinfo.y_axis;
    uint32_t ppsl = binfo->vinfo.ppsl;
    pix_format *fb = (pix_format *)binfo->vinfo.fb;

    pix_format white = {0xff, 0xff, 0xff, 0x00};

    for (uint32_t i = 0; i < y_axis; i++) {
        for (uint32_t j = 0; j < x_axis; j++) {
            fb[i * ppsl + j] = white;
        }
    }

    while (1) {
        asm("hlt");
    }
}
