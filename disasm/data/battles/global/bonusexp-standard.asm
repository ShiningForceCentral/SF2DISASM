
; This table is only present if bonus experience feature is enabled.

table_BonusExp:
               
	dc.b   0 ;  0 : Character is at expected current battle level
	dc.b   5 ; -1
	dc.b  10 ; -2
	dc.b  15 ; -3
	dc.b  20 ; -4
	dc.b  30 ; -5
	dc.b  40 ; -6
	dc.b  50 ; -7
	dc.b  60 ; -8
	dc.b  80 ; -9
	dc.b  99 ; -10 : Character is way behind (-10 levels)
	
	align

table_BonusExp_Length: equ 11
