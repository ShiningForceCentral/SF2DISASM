
; SCRIPT SECTION ms_raftout :
; Mapscript for getting out of Raft ?
byte_45470:         dc.b 0
										dc.b $15                ; mapscript
										dc.b $9F 
										dc.b $FF
										dc.l eas_45360          
										dc.b   0
										dc.b $1A
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $15
										dc.b   0
										dc.b $FF
										dc.l eas_4548C          
										dc.b $FF
										dc.b $FF
word_45488:         dc.w $D                 ; 000D CLONE POSITION FROM ENTITY $1F
										dc.w $1F
eas_4548C:          dc.w 9                  ; 0009  $0 $1
										dc.w 0
										dc.w 1
										dc.w $23                ; 0023 SEND SOUND COMMAND $59
										dc.w $59
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_45498:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FD64
										dc.w eas_Idle+$10000-word_45498
word_4549C:         dc.w $180
word_4549E:         dc.w 0
										dc.b   0
										dc.b   0
										dc.b $FE 
										dc.b $80 
										dc.b $FE 
										dc.b $80 
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b $80 
