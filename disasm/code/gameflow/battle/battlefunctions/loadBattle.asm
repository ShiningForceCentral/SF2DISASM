
; ASM FILE code\gameflow\battle\battlefunctions\loadBattle.asm :
; 0x25610..0x256A2 : Battle data loading function

; =============== S U B R O U T I N E =======================================

; Load all battle properties.
; 
; In: d0.w = combatant index


LoadBattle:
                
                move.w  d0,-(sp)
                clr.w   d1
                move.b  ((CURRENT_MAP-$1000000)).w,d1
                bsr.w   FadeOutToBlackAll
                move.b  #-1,((VIEW_TARGET_ENTITY-$1000000)).w
                jsr     (LoadMapTilesets).w
                bsr.w   WaitForFadeToFinish
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w
                jsr     j_PositionBattleEntities
                move.w  (sp)+,d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                bpl.s   @Ally
                clr.w   d0
@Ally:
                
                andi.w  #$3F,d0 
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0           ; offset to appropriate entity
                move.w  (a0)+,d0        ; move x offset
                ext.l   d0
                divs.w  #MAP_TILE_SIZE,d0
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.w  (a0)+,d0        ; move y offset
                ext.l   d0
                divs.w  #MAP_TILE_SIZE,d0
                move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                moveq   #63,d0
                jsr     (InitializeSprites).w
                move.w  #-1,d0
                jsr     (LoadMap).w     
                jsr     (WaitForVInt).w
                jsr     (LoadEntityMapsprites).w
                bsr.w   SetBaseVIntFunctions
                jsr     j_LoadBattleTerrainData
                jsr     (PlayMapMusic).w
                jsr     (FadeInFromBlack).w
                cmpi.b  #BATTLE_FAIRY_WOODS,((CURRENT_BATTLE-$1000000)).w 
                                                        ; if battle 44, then special battle !
                bne.s   @Return
                jsr     j_OpenTimerWindow
@Return:
                
                rts

    ; End of function LoadBattle

