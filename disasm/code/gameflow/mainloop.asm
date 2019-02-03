
; ASM FILE code\gameflow\mainloop.asm :
; 0x75C4..0x75EC : Main loop

; =============== S U B R O U T I N E =======================================

; In: D0 = map idx
;     D1 = player X coord
;     D2 = player Y coord
;     D3 = player facing
;     D4 = ???
;     D7 = battle idx (FFFF for none)
; ...more

MainBattleAndExplorationLoop:
                
                clr.b   ((WINDOW_HIDING_FORBIDDEN-$1000000)).w
loc_75C8:
                
                bsr.w   AlterMapIndexIfChanged
                bsr.w   GetNextBattleOnMap
                cmpi.w  #$FFFF,d7
                beq.w   loc_75E4
                move.w  d7,d1
                jsr     j_ExecuteBattleLoop
loc_75E0:
                
                bsr.w   AlterMapIndexIfChanged
loc_75E4:
                
                jsr     j_ExecuteExplorationLoop
                bra.s   loc_75C8

	; End of function MainBattleAndExplorationLoop

