
; ASM FILE data\maps\entries\map40\mapsetups\s2.asm :
; 0x53F92..0x53FBA : 
ms_map40_EntityEvents:
		msEntityEvent 28, RIGHT, sub_53FA2-ms_map40_EntityEvents
		msEntityEvent 128, RIGHT, sub_53FAA-ms_map40_EntityEvents
		msEntityEvent 129, RIGHT, sub_53FAA-ms_map40_EntityEvents
		msDefaultEntityEvent 0, entevdft_53FB8-ms_map40_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53FA2:
		lea     cs_53FE0(pc), a0
		trap    #6
		rts

	; End of function sub_53FA2


; =============== S U B R O U T I N E =======================================

sub_53FAA:
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		txt $3E8                ; "He's already dead.{N}{LEADER} feels regret.{W1}"
entevdft_53FB8:
		
		rts

	; End of function sub_53FAA

