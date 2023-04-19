
; ASM FILE code\gameflow\mainloop.asm :
; 0x75C4..0x75EC : Main loop

; =============== S U B R O U T I N E =======================================

; In: D0 = map index
;     D1 = player X coord
;     D2 = player Y coord
;     D3 = player facing
;     D4 = ???
;     D7 = battle index ($FFFF for none)
; ...more


MainLoop:
                
                clr.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
loc_75C8:
                
                bsr.w   CheckMapSwitch  ; Check table "FlagSwitchedMaps" for possible flag-triggered map switch
                bsr.w   CheckBattle     ; Check table "BattleMapCoords" and then "Battle unlocked" flags for possible battle according to map and player coords
                cmpi.w  #$FFFF,d7
                beq.w   loc_75E4        ; If battle index available, enter battle loop
                move.w  d7,d1
                jsr     j_BattleLoop    ; Return when battle ends
loc_75E0:
                
                bsr.w   CheckMapSwitch  ; Check table "FlagSwitchedMaps" for possible flag-triggered map switch
loc_75E4:
                
                jsr     j_ExplorationLoop
                bra.s   loc_75C8        ; Return in case of warp event

    ; End of function MainLoop

