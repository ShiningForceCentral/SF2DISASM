
; ASM FILE data\battles\afterbattlepositions.asm :
; 0x47E6C..0x47E82 : After battle positions
table_AfterBattlePositions:
                dc.w BATTLE_GALAM_CASTLE ; battle 5
                dc.l abp_Battle5        
                
                tableEnd
                
abp_Battle5:    dc.b ALLY_BOWIE         ; character 0 : Bowie
                dc.b 16                 ; X Pos
                dc.b 4                  ; Y pos
                dc.b $FF                ; ignored byte
                dc.b ALLY_SLADE         ; Slade
                dc.b 17
                dc.b 4
                dc.b $FF
                dc.b $80                ; enemy leader
                dc.b 17
                dc.b 2
                dc.b $FF
                
                tableEnd
