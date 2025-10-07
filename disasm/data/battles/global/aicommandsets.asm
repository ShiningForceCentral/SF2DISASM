
; ASM FILE data\battles\global\aicommandsets.asm :
; 0xE1AC..0xE25B : AI commands data
pt_AiCommandsets:
                dc.l AiCommandset00
                dc.l AiCommandset01
                dc.l AiCommandset02
                dc.l AiCommandset03
                dc.l AiCommandset04
                dc.l AiCommandset05
                dc.l AiCommandset06
                dc.l AiCommandset07
                dc.l AiCommandset08
                dc.l AiCommandset09
                dc.l AiCommandset10
                dc.l AiCommandset10
                dc.l AiCommandset12
                dc.l AiCommandset13
                dc.l AiCommandset13
                dc.l AiCommandset15
AiCommandset00: 
; Syntax        aiCommandset [AICOMMAND_]enum,..[AICOMMAND_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                aiCommandset HEAL, &
                             SUPPORT, &
                             ATTACK, &
                             MOVE, &
                             STAY
AiCommandset01: 
                aiCommandset MOVE_ORDER, &
                             HEAL, &
                             SUPPORT, &
                             ATTACK, &
                             MOVE2, &
                             STAY
AiCommandset02: 
                aiCommandset HEAL2, &
                             MOVE_ORDER4, &
                             SUPPORT, &
                             ATTACK3, &
                             MOVE2, &
                             STAY
AiCommandset03: 
                aiCommandset HEAL2, &
                             MOVE_ORDER4, &
                             SUPPORT, &
                             ATTACK3, &
                             MOVE, &
                             STAY
AiCommandset04: 
                aiCommandset HEAL3, &
                             MOVE_ORDER5, &
                             SUPPORT, &
                             ATTACK2, &
                             MOVE3, &
                             STAY
AiCommandset05: 
                aiCommandset HEAL3, &
                             MOVE_ORDER5, &
                             SUPPORT, &
                             ATTACK2, &
                             MOVE3, &
                             STAY
AiCommandset06: 
                aiCommandset ATTACK, &
                             HEAL, &
                             SUPPORT, &
                             MOVE, &
                             STAY
AiCommandset07: 
                aiCommandset MOVE_ORDER, &
                             ATTACK, &
                             HEAL, &
                             SUPPORT, &
                             MOVE, &
                             STAY
AiCommandset08: 
                aiCommandset ATTACK, &
                             HEAL, &
                             SUPPORT, &
                             STAY
AiCommandset10: 
                aiCommandset STAY
AiCommandset09: 
                aiCommandset MOVE_ORDER3, &
                             ATTACK3, &
                             HEAL2, &
                             SUPPORT, &
                             MOVE_ORDER4, &
                             MOVE2, &
                             STAY
AiCommandset12: 
                aiCommandset MOVE_ORDER4, &
                             SUPPORT, &
                             ATTACK3, &
                             HEAL2, &
                             MOVE, &
                             MOVE2, &
                             STAY
AiCommandset13: 
                aiCommandset MOVE_ORDER5, &
                             ATTACK2, &
                             HEAL3, &
                             SUPPORT, &
                             MOVE_ORDER2, &
                             MOVE3, &
                             STAY
AiCommandset15: 
                aiCommandset MOVE_ORDER, &
                             ATTACK3, &
                             HEAL2, &
                             SUPPORT, &
                             MOVE_ORDER2, &
                             MOVE2, &
                             STAY
table_AiSecondaryCharacteristics:
                
; These seem to correspond to the secondary characteristics of each AI script
;  for Heal, Attack, and Special Move, but not for Support or normal Move
;  with one byte per AI.
                
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 0
