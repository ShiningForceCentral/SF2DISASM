
; SCRIPT SECTION battles\global\regionactivatedcutscenes :
; Region-activated cutscenes
										dc.b $20                ; battle id
										dc.b   0                ; region id
										dc.w $182               ; associated flag
										dc.l rbcs_battle32      
										dc.b $20
										dc.b   1
										dc.w $182
										dc.l rbcs_battle32      
										dc.b $28 
										dc.b   0
										dc.w $183
										dc.l rbcs_battle40_1    
										dc.b $28 
										dc.b   1
										dc.w $184
										dc.l rbcs_battle40_2    
										dc.w $FFFF
