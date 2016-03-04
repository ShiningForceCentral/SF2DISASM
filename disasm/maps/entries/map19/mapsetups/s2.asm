
; SCRIPT SECTION maps\entries\map19\mapsetups\s2 :
; 
ms_map19_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_52E3A-ms_map19_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_52E4E-ms_map19_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_52E62-ms_map19_EntityEvents
										dc.b $83
										dc.b 0
										dc.w sub_52E68-ms_map19_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_52E6E-ms_map19_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_52E82-ms_map19_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_52E96-ms_map19_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_52EAA-ms_map19_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_52EBE-ms_map19_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_52ED2-ms_map19_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_52ED8-ms_map19_EntityEvents
										dc.b $8B
										dc.b 3
										dc.w sub_52EEC-ms_map19_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_52EF2-ms_map19_EntityEvents
										dc.w $FD00
										dc.w return_52F0A-ms_map19_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52E3A:
										
										trap    #1
										dc.w $100
										bne.s   loc_52E48
										trap    #5
										dc.w $21F
										trap    #2
										dc.w $100
loc_52E48:
										
										trap    #5
										dc.w $220
										rts

	; End of function sub_52E3A


; =============== S U B R O U T I N E =======================================

sub_52E4E:
										
										trap    #1
										dc.w $101
										bne.s   loc_52E5C
										trap    #5
										dc.w $221
										trap    #2
										dc.w $101
loc_52E5C:
										
										trap    #5
										dc.w $222
										rts

	; End of function sub_52E4E


; =============== S U B R O U T I N E =======================================

sub_52E62:
										
										trap    #5
										dc.w $223
										rts

	; End of function sub_52E62


; =============== S U B R O U T I N E =======================================

sub_52E68:
										
										trap    #5
										dc.w $224
										rts

	; End of function sub_52E68


; =============== S U B R O U T I N E =======================================

sub_52E6E:
										
										trap    #1
										dc.w $102
										bne.s   loc_52E7C
										trap    #5
										dc.w $225
										trap    #2
										dc.w $102
loc_52E7C:
										
										trap    #5
										dc.w $226
										rts

	; End of function sub_52E6E


; =============== S U B R O U T I N E =======================================

sub_52E82:
										
										trap    #1
										dc.w $103
										bne.s   loc_52E90
										trap    #5
										dc.w $227
										trap    #2
										dc.w $103
loc_52E90:
										
										trap    #5
										dc.w $228
										rts

	; End of function sub_52E82


; =============== S U B R O U T I N E =======================================

sub_52E96:
										
										trap    #1
										dc.w $104
										bne.s   loc_52EA4
										trap    #5
										dc.w $229
										trap    #2
										dc.w $104
loc_52EA4:
										
										trap    #5
										dc.w $22A
										rts

	; End of function sub_52E96


; =============== S U B R O U T I N E =======================================

sub_52EAA:
										
										trap    #1
										dc.w $105
										bne.s   loc_52EB8
										trap    #5
										dc.w $22B
										trap    #2
										dc.w $105
loc_52EB8:
										
										trap    #5
										dc.w $22C
										rts

	; End of function sub_52EAA


; =============== S U B R O U T I N E =======================================

sub_52EBE:
										
										trap    #1
										dc.w $106
										bne.s   loc_52ECC
										trap    #5
										dc.w $22D
										trap    #2
										dc.w $106
loc_52ECC:
										
										trap    #5
										dc.w $22E
										rts

	; End of function sub_52EBE


; =============== S U B R O U T I N E =======================================

sub_52ED2:
										
										trap    #5
										dc.w $22F
										rts

	; End of function sub_52ED2


; =============== S U B R O U T I N E =======================================

sub_52ED8:
										
										trap    #1
										dc.w $107
										bne.s   loc_52EE6
										trap    #5
										dc.w $230
										trap    #2
										dc.w $107
loc_52EE6:
										
										trap    #5
										dc.w $231
										rts

	; End of function sub_52ED8


; =============== S U B R O U T I N E =======================================

sub_52EEC:
										
										trap    #5
										dc.w $232
										rts

	; End of function sub_52EEC


; =============== S U B R O U T I N E =======================================

sub_52EF2:
										
										trap    #1
										dc.w $25F
										bne.s   loc_52F04
										lea     cs_52F0C(pc), a0
										trap    #6
										trap    #2
										dc.w $25F
										bra.s   return_52F0A
loc_52F04:
										
										lea     cs_52F24(pc), a0
										trap    #6
return_52F0A:
										
										rts

	; End of function sub_52EF2

cs_52F0C:           dc.w 4                  ; 0004 SET TEXT INDEX 23F
										dc.w $23F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 52F40
										dc.w $59                ; Unkown command : 59
										dc.l cs_52F40           ; 0005 PLAY SOUND 
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_52F24:           dc.w 4                  ; 0004 SET TEXT INDEX 241
										dc.w $241
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 52F40
										dc.w $59
										dc.l cs_52F40           ; 0005 PLAY SOUND 
										dc.w 4                  ; 0004 SET TEXT INDEX 240
										dc.w $240
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_52F40:           dc.w 4                  ; 0004 SET TEXT INDEX 242
										dc.w $242
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 1 1
										dc.b $8C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 8
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 3F 3F 2
										dc.b $8C
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $10                ; 0010 SET FLAG 260 FFFF
										dc.w $260
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
