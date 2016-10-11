
; SCRIPT SECTION system\text\jumpsnpointers :
; Text function jumps and pointers
p_pt_ScriptBanks:   dc.l pt_TextBanks

; =============== S U B R O U T I N E =======================================

j_InitDecoder:
										
										jmp     InitDecoder(pc) 

	; End of function j_InitDecoder


; =============== S U B R O U T I N E =======================================

j_HuffmanDecode:
										
										jmp     HuffmanDecode(pc)

	; End of function j_HuffmanDecode

