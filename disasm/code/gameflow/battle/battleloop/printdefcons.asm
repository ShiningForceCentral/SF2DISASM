
; ASM FILE code\gameflow\battle\battleloop\printdefcons.asm :
; 0x2572A..0x25790 : Battle functions

; =============== S U B R O U T I N E =======================================


PrintAllActivatedDefCons:
                
                moveq   #BATTLE_REGION_FLAGS_START,d1
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                clsTxt
                rts

    ; End of function PrintAllActivatedDefCons


; =============== S U B R O U T I N E =======================================

; if flag D1 is set, AI region active, display def-con textbox


PrintActivatedDefCon:
                
                move.w  d1,-(sp)
                jsr     j_CheckFlag
                beq.s   @RegionInactive
                subi.w  #BATTLE_REGION_FLAGS_START,d1
                ext.l   d1
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     463             ; "DEF-CON No. {#} has been{N}implemented.{D3}"
@RegionInactive:
                
                move.w  (sp)+,d1
                addq.w  #1,d1
                rts

    ; End of function PrintActivatedDefCon

