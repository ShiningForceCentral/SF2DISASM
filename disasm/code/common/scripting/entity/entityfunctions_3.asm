
; ASM FILE code\common\scripting\entity\entityfunctions_3.asm :
; 0x45204..0x45268 : Entity functions

; =============== S U B R O U T I N E =======================================

; still to confirm


WaitForFollowersStopped:
                
                lea     ((byte_FFAF23-$1000000)).w,a0
                bsr.w   WaitForPartyEntitiesIdle
                rts

    ; End of function WaitForFollowersStopped


; =============== S U B R O U T I N E =======================================

; to confirm


WaitForHeroAndFollowersStopped:
                
                lea     ((FOLLOWERS_LIST-$1000000)).w,a0
                bsr.w   WaitForPartyEntitiesIdle
                rts

    ; End of function WaitForHeroAndFollowersStopped


; =============== S U B R O U T I N E =======================================

; to confirm


WaitForPartyEntitiesIdle:
                
                cmpi.b  #$FF,(a0)+
                beq.w   return_4524A
                jsr     (WaitForVInt).w
loc_45224:
                
                cmpi.b  #$FF,(a0)+
                bne.s   loc_45224
                clr.w   d0
                move.b  -2(a0),d0
                movem.l d0/a0,-(sp)
                bsr.w   GetEntityEntryAddress
loc_45238:
                
                jsr     (WaitForVInt).w
                cmpi.l  #eas_Idle,$14(a0)
                bne.s   loc_45238
                movem.l (sp)+,d0/a0
return_4524A:
                
                rts

    ; End of function WaitForPartyEntitiesIdle


; =============== S U B R O U T I N E =======================================

; might be related to followers


ApplyActscriptToHeroAndFollowers:
                
                lea     ((FOLLOWERS_LIST-$1000000)).w,a0
                bra.w   ApplyActscriptToPartyEntities

    ; End of function ApplyActscriptToHeroAndFollowers


; =============== S U B R O U T I N E =======================================

; to confirm


ApplyActscriptToFollowers:
                
                lea     ((byte_FFAF23-$1000000)).w,a0

    ; End of function ApplyActscriptToFollowers


; START OF FUNCTION CHUNK FOR ApplyActscriptToHeroAndFollowers

ApplyActscriptToPartyEntities:
                
                move.b  (a0)+,d0
                cmpi.b  #$FF,d0
                beq.s   return_45266
                bsr.w   SetEntityActscript
                bra.s   ApplyActscriptToPartyEntities
return_45266:
                
                rts

; END OF FUNCTION CHUNK FOR ApplyActscriptToHeroAndFollowers

