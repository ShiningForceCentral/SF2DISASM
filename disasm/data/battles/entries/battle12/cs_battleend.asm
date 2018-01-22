
; ASM FILE data\battles\entries\battle12\cs_battleend.asm :
; 0x4ACC8..0x4ACEC : Enemy defeated cutscene for battle 12
edcs_battle12:  textCursor $9BA
		cameraSpeed $20
		setCameraEntity $80
		nextSingleText $0,$80   ; "How can you...defeat...{N}devils?{W1}"
		setCameraEntity $0
		nextText $0,$80         ; "Ah!  You have the Jewel of{N}Evil around your neck.{W2}"
		nextSingleText $0,$80   ; "It's you, {LEADER}.{N}We've been waiting for you.{W1}"
		setF $2CA               ; set after winning the cliff battle outside Bedoe, before Peter delivers lines
		csc_end
