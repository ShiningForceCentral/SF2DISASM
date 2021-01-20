
; ASM FILE code\gameflow\battle\battlemusic.asm :
; 0x4544..0x458E : Battle music function

; =============== S U B R O U T I N E =======================================


PlayMapMusic:
                
                move.w  d0,-(sp)
                clr.w   d0
                move.b  ((MAP_AREA_MUSIC_INDEX-$1000000)).w,d0
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                beq.s   byte_4586
                cmpi.b  #MUSIC_NOTHING,d0
                bne.s   loc_455E
                move.w  #MUSIC_BATTLE_THEME_3,d0 ; HARDCODED exploration music -> battle music
loc_455E:
                
                cmpi.b  #MUSIC_TOWN,d0
                bne.s   loc_4568
                move.w  #MUSIC_BATTLE_THEME_3,d0
loc_4568:
                
                cmpi.b  #MUSIC_MITULA,d0
                bne.s   loc_4572
                move.w  #MUSIC_BATTLE_THEME_3,d0
loc_4572:
                
                cmpi.b  #MUSIC_MITULA_SHRINE,d0
                bne.s   loc_457C
                move.w  #MUSIC_BATTLE_THEME_1,d0
loc_457C:
                
                cmpi.b  #MUSIC_CASTLE,d0
                bne.s   byte_4586
                move.w  #MUSIC_BATTLE_THEME_1,d0
byte_4586:
                
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                move.w  (sp)+,d0
                rts

    ; End of function PlayMapMusic

