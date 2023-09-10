
; ASM FILE code\common\tech\jumpinterfaces\s04_jumpinterface.asm :
; 0x18000..0x18010 : Game Section 04 Jump Interface

; =============== S U B R O U T I N E =======================================


j_nullsub_18010:
            if (VANILLA_BUILD=1)
                jmp     nullsub_18010(pc)
            endif

    ; End of function j_nullsub_18010


; =============== S U B R O U T I N E =======================================


j_InitializeBattlescene:
                
                jmp     InitializeBattlescene(pc)

    ; End of function j_InitializeBattlescene


; =============== S U B R O U T I N E =======================================


j_ExecuteBattlesceneScript:
                
                jmp     ExecuteBattlesceneScript(pc)

    ; End of function j_ExecuteBattlesceneScript


; =============== S U B R O U T I N E =======================================


j_EndBattlescene:
                
                jmp     EndBattlescene(pc)

    ; End of function j_EndBattlescene

