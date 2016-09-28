
; SCRIPT SECTION maps\entries\map56\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map56_InitFunction:
										
										rts

	; End of function ms_map56_InitFunction

cs_6150A:           dc.w 4                  ; 0004 SET TEXT INDEX E14 : "Unbelievable!  You've{N}finally arrived.{W1}"
										dc.w $E14
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 80 0
										dc.w $80
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Unbelievable!  You've{N}finally arrived.{W1}"
										dc.w $80
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 0 80
										dc.w 0
										dc.w $80
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 7 80
										dc.w 7
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Creed...I mean, Mr...{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "That's OK, {NAME;7}.{N}I doubted you'd ever make{N}it here.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "The enemies you've faced so{N}far were strong.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0 : "Yes, they were.{W1}"
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Why am I here?  Is that your{N}question, {LEADER}?{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "I wanted to help you.{W2}"
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
