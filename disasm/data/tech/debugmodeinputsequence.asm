
; ASM FILE data\tech\debugmodeinputsequence.asm :
; 0x28FF0..0x29001 : Debug mode input sequence
table_DebugModeInputSequence:
                
; Syntax        input [INPUT_]bitfield
                
                input UP
                input UP
                input DOWN
                input UP
                input B
                input C
                input RIGHT
                input LEFT
                input UP
                input UP
                input DOWN
                input UP
                input B
                input C
                input RIGHT
                input LEFT
                
                tableEnd.b
