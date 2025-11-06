
; ASM FILE code\gameflow\battle\battlefield\buildtargetsarray.asm :
; 0xC7F2..0xC87A : Targets array builder functions

; =============== S U B R O U T I N E =======================================

; Build array of targets with combatant d0.w's opposite affiliation.
; 
; Note: enemy bit is flipped prior to calling this routine.


BuildTargetsArrayWithTeammatesOfTarget:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   BuildTargetsArrayWithEnemies

    ; End of function BuildTargetsArrayWithTeammatesOfTarget


; =============== S U B R O U T I N E =======================================


BuildTargetsArrayWithAllies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetsArray
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   BuildTargetsArray

    ; End of function BuildTargetsArrayWithAllies


; =============== S U B R O U T I N E =======================================


BuildTargetsArrayWithEnemies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetsArray
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                bra.w   BuildTargetsArray

    ; End of function BuildTargetsArrayWithEnemies


; =============== S U B R O U T I N E =======================================

; Populate an array containing all combatants present on the battlefield.


BuildTargetsArrayWithAllCombatants:
                
                movem.l d0-a0,-(sp)
                bsr.s   BuildTargetsArrayWithAllies
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7

    ; End of function BuildTargetsArrayWithAllCombatants


; =============== S U B R O U T I N E =======================================


BuildTargetsArray:
                
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Next
                
                jsr     GetActivationBitfield
                btst    #AIBITFIELD_BIT_BIT3,d1
                beq.s   @Continue
                bra.w   @Next
@Continue:
                
                jsr     GetCombatantY
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d1
                bcc.w   @Next
                move.w  d1,d2
                jsr     GetCombatantX
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @Next
                
                ; d1.w,d2.w = X,Y
                lea     (FF5600_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  d0,(a0)
@Next:
                
                addq.b  #1,d0
                dbf     d7,BuildTargetsArray
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function BuildTargetsArray

