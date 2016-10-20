
; SCRIPT SECTION battles\entries\battle11\bbcs_11_function :
; Specific to before battle 11 cutscene function

; =============== S U B R O U T I N E =======================================

sub_458E:
										bsr.w   sub_38C0
										move.w  d0,((word_FFA814-$1000000)).w
										move.w  d0,((word_FFA81C-$1000000)).w
										lsr.w   #4,d0
										neg.w   d0
										andi.w  #$FF,d0
										move.w  d0,((word_FFA806-$1000000)).w
										move.w  d1,((word_FFA816-$1000000)).w
										move.w  d1,((word_FFA81E-$1000000)).w
										lsr.w   #4,d1
										addq.w  #8,d1
										andi.w  #$FF,d1
										move.w  d1,((word_FFA80A-$1000000)).w
										bset    #1,((byte_FFA82D-$1000000)).w
										rts

	; End of function sub_458E

