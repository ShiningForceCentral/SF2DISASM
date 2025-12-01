
; ASM FILE data\battles\global\aistandbymovements.asm :
; 0xF78A..0xF7A0 : AI standby movements table
pt_StandbyAiMovements:
                dc.l table_StandbyAiMovements1 ; relative coordinates used for AI controlled movement
                dc.l table_StandbyAiMovements2
table_StandbyAiMovements1:
                dc.b 0, -1
                dc.b -1, 1
                dc.b 1, 1
table_StandbyAiMovements2:
                dc.b 0, -1
                dc.b -1, 0
                dc.b 0, 1
                dc.b 1, 0
