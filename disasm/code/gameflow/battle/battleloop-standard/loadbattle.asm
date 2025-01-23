
; ASM FILE code\gameflow\battle\battleloop-standard\loadbattle.asm :
;

; =============== S U B R O U T I N E =======================================

; Load all battle properties.
;
; In: d0.w = combatant index


LoadBattle:
                
                movem.l d1-d2/a0-a1,-(sp)
                clr.w   d1
                getSavedByte CURRENT_MAP, d1
                bsr.w   FadeOutToBlackAll
                st      ((VIEW_TARGET_ENTITY-$1000000)).w
                jsr     (LoadMapTilesets).w
                bsr.w   WaitForFadeToFinish
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w
                jsr     PositionBattleEntities
                
                ; In: d0.w = combatant index
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                bpl.s   @Ally
                
                clr.w   d0
@Ally:          andi.w  #$3F,d0 
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
                
                ; Load compressed terrain data
                getPointer p_pt_BattleTerrainData, a0
                loadSavedDataAddress CURRENT_BATTLE, a1
                clr.w   d1
                move.b  (a1),d1
                lsl.l   #2,d1
                movea.l (a0,d1.w),a0
                lea     (BATTLE_TERRAIN_ARRAY).l,a1
                jsr     (LoadStackCompressedData).w
                
                bsr.w   PlayMapMusic
                jsr     (FadeInFromBlack).w
                
                ; Is a battle where the timer window should be displayed?
                lea     table_DisplayTimerBattles(pc), a0
                getSavedByte CURRENT_BATTLE, d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                jsr     OpenTimerWindow
@Done:          movem.l (sp)+,d1-d2/a0-a1
                rts

    ; End of function LoadBattle

