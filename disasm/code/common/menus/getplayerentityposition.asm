
; ASM FILE code\common\menus\getplayerentityposition.asm :
; 0x22C60..0x22C84 : Main menu function

; =============== S U B R O U T I N E =======================================

; Get first entity's X, Y and facing -> d1.l, d2.l, d3.w


GetPlayerEntityPosition:
                
                move.w  (ENTITY_DATA).l,d1
                move.w  (ENTITY_Y).l,d2
                move.b  (ENTITY_FACING).l,d3
                ext.l   d1
                divu.w  #MAP_TILE_SIZE,d1
                ext.l   d2
                divu.w  #MAP_TILE_SIZE,d2
                andi.w  #DIRECTION_MASK,d3
                rts

    ; End of function GetPlayerEntityPosition

