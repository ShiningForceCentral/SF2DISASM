
; ASM FILE code\common\scripting\entity\getallymapsprite-expanded.asm :

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant ID
; Out: D4 = map sprite ID

GetAllyMapSprite:
                
                move.w  d0,d4                           ; map sprite ID = combatant ID
                cmpi.w  #COM_ALLIES_NUM,d0
                bcc.s   @Return                         ; return if combatant is not an ally
                move.l  d1,-(sp)
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                                                        ; check if we're currently in battle
                bne.s   @IsAliveOrInBattle
                jsr     GetCurrentHP
                tst.w   d1                              ; check if character is alive
                bne.s   @IsAliveOrInBattle
                move.w  #MAPSPRITE_BLUE_FLAME,d4        ; Character is dead and we're out of battle...
                bra.s   @Done                           ;  so they appear as a blue flame, and we're done !
@IsAliveOrInBattle:
                
                cmpi.b  #ALLY_ROHDE,d0                  ; check if character is Rhode
                bne.s   @NotRhode       
                chkFlg  $B                              ; check if Rohde has joined
                bne.s   @NotRhode       
                move.w  #MAPSPRITE_NPC_ROHDE,d4         ; Rhode hasn't joined yet, so use his NPC sprite
                bra.s   @Done
@NotRhode:
                
                move.l  a0,-(sp)
                lea     ClassTypesTable,a0              ; 0,1,2 = base class, promoted class, special promoted class
                jsr     GetClass                        ; class ID -> D1
                move.b  (a0,d1.w),d1                    ; use class type ID as offset into sprites table entry
                tst.b   d1
                bpl.s   @NotRedBaron
                moveq   #CLASSTYPE_SPECIAL,d1           ; handle Red Baron as a special class
@NotRedBaron:
                                    
                add.b   d0,d4                           ; effectively multiply combatant ID by 3
                add.b   d0,d4                           ;  (i.e., the expanded sprites table entry size)
                add.b   d1,d4
                move.b  AllyMapSprites(pc,d4.w),d4      ; map sprite ID for the given class type -> D4
                move.l  (sp)+,a0
@Done:
                
                move.l  (sp)+,d1
@Return:
                
                rts

    ; End of function GetAllyMapSprite

