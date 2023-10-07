
; ASM FILE data\tech\configurationmodeinputsequence.asm :
; 0x28FBC..0x28FCB : Configuration mode input sequence
table_ConfigurationModeInputSequence:
                
; Syntax        input [INPUT_]bitfield
                
                input UP
                input DOWN
                input UP
                input DOWN
                input LEFT
                input RIGHT
                input LEFT
                input RIGHT
                input UP
                input RIGHT
                input DOWN
                input LEFT
                input UP
                input B
                
                tableEnd.b
