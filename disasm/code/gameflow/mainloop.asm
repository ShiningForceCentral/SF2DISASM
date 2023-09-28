
; ASM FILE code\gameflow\mainloop.asm :
; 0x75C4..0x75EC : Main loop

; =============== S U B R O U T I N E =======================================

; In: D0 = map index
;     D1 = player X coord
;     D2 = player Y coord
;     D3 = player facing
;     D4 = ???
;     D7 = battle index (-1 for none)
; ...more


MainLoop:
                
                module
                clr.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
@Start:
                
                bsr.w   SwitchMap       ; Check table "FlagSwitchedMaps" for possible flag-triggered map switch
                bsr.w   CheckBattle     ; Check table "BattleMapCoordinates" and then "Battle unlocked" flags for possible battle according to map and player position
                cmpi.w  #-1,d7
                beq.w   @Exploration    ; If battle index available, enter battle loop
                
                move.w  d7,d1
                jsr     j_BattleLoop    ; Return when battle ends
alt_MainLoopEntry:
                
                bsr.w   SwitchMap       ; Check table "FlagSwitchedMaps" for possible flag-triggered map switch
@Exploration:
                
                jsr     j_ExplorationLoop
                bra.s   @Start          ; Return in case of warp event

    ; End of function MainLoop

                modend
