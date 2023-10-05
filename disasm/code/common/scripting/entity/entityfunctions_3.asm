
; ASM FILE code\common\scripting\entity\entityfunctions_3.asm :
; 0x45204..0x45268 : Entity functions

; =============== S U B R O U T I N E =======================================

; still to confirm


WaitForFollowersStopped:
                
                lea     ((FOLLOWERS_LIST-$1000000)).w,a0
                bsr.w   WaitForPartyEntitiesIdle
                rts

    ; End of function WaitForFollowersStopped


; =============== S U B R O U T I N E =======================================

; to confirm


WaitForHeroAndFollowersStopped:
                
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
                bsr.w   WaitForPartyEntitiesIdle
                rts

    ; End of function WaitForHeroAndFollowersStopped


; =============== S U B R O U T I N E =======================================

; to confirm


WaitForPartyEntitiesIdle:
                
                cmpi.b  #-1,(a0)+
                beq.w   @Return
                
                jsr     (WaitForVInt).w
@loc_1:
                
                cmpi.b  #-1,(a0)+
                bne.s   @loc_1
                
                clr.w   d0
                move.b  -2(a0),d0
                movem.l d0/a0,-(sp)
                bsr.w   GetEntityEntryAddress
@loc_2:
                
                jsr     (WaitForVInt).w
                cmpi.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                bne.s   @loc_2
                
                movem.l (sp)+,d0/a0
@Return:
                
                rts

    ; End of function WaitForPartyEntitiesIdle


; =============== S U B R O U T I N E =======================================

; might be related to followers


ApplyActscriptToHeroAndFollowers:
                
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
                bra.w   ApplyActscriptToPartyEntities

    ; End of function ApplyActscriptToHeroAndFollowers


; =============== S U B R O U T I N E =======================================

; to confirm


ApplyActscriptToFollowers:
                
                lea     ((FOLLOWERS_LIST-$1000000)).w,a0

    ; End of function ApplyActscriptToFollowers


; START OF FUNCTION CHUNK FOR ApplyActscriptToHeroAndFollowers

ApplyActscriptToPartyEntities:
                
                move.b  (a0)+,d0
                cmpi.b  #-1,d0
                beq.s   @Return
                
                bsr.w   SetEntityActscript
                bra.s   ApplyActscriptToPartyEntities
@Return:
                
                rts

; END OF FUNCTION CHUNK FOR ApplyActscriptToHeroAndFollowers

