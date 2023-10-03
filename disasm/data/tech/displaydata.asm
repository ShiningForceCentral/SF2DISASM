
; ASM FILE data\tech\displaydata.asm :
; 0x2F6A..0x3022 : Display data tables
layout_BlackScreen:
                dcb.b $80,$22
sprite_Masks:   vdpSprite 128, V4|H1|1, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 160, V4|H1|2, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 192, V4|H1|3, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 224, V4|H1|4, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 256, V4|H1|5, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 288, V4|H1|6, 1916|PALETTE3|PRIORITY, 128
                vdpSprite 320, V4|H1|7, 1916|PALETTE3|PRIORITY, 128
