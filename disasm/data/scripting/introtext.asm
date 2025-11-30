
; ASM FILE data\scripting\introtext.asm :
; Included if patch SCROLLING_TEXT_INTRODUCTION is enabled.

; Data format is as follow :
; [line start offset][ASCII characters][end of line], repeated until end of data is reached.
; - Line start offset : the screen is considered 32-character-wide, and the line can start from offset 1 to 32, expressed in a simple byte value.
; - ASCII characters can only use capital letters and a few basic punctuation characters.
; - End of line is expressed by byte value 0.
; - End of data is expressed by byte value 255 ==> $FF in hex.

p_table_IntroText:
                
                dc.l table_IntroText
table_IntroText:
                
                dc.b 5,'THE FORCES OF DARKNESS,',0
                dc.b 7,'THE RUNEFAUST ARMY',0
                dc.b 5,'AND DARKNESS INCARNATE,',0
                dc.b 9,'DARK DRAGON ...',0
                dcb.b 6,0
                dc.b 9,'THEY DESTROYED',0
                dc.b 3,'AND MASSACRED AS THEY TRIED',0
                dc.b 5,'TO TAKE OVER THE WORLD.',0
                dcb.b 7,0
                dc.b 12,'HOWEVER,',0
                dc.b 8,'MAX LED A TROOP',0
                dc.b 4,'KNOWN AS THE SHINING FORCE',0
                dc.b 7,'TO VICTORY AGAINST',0
                dc.b 5,'THE FORCES OF DARKNESS.',0
                dcb.b 7,0
                dc.b 10,'ONCE AGAIN,',0
                dc.b 5,'THE WORLD WAS AT PEACE.',0
                dcb.b 8,0
                dc.b 14,'NOW',0
                dc.b 4,'A NEW TREACHERY BEGINS ...',0
                dcb.b 8,0
                
                tableEnd.b
