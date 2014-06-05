
; SCRIPT SECTION cs_regionactivated :
; Battle cutscenes activated by reaching a zone
										dc.b $20
										dc.b   0
										dc.w $182
										dc.l cs_4CD10           
										dc.b $20
										dc.b   1
										dc.w $182
										dc.l cs_4CD10           
										dc.b $28 
										dc.b   0
										dc.w $183
										dc.l cs_4E8A8           
										dc.b $28 
										dc.b   1
										dc.w $184
										dc.l cs_4E9B2           
										dc.w $FFFF
