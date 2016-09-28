
; SCRIPT SECTION maps\entries\map33\mapsetups\s2 :
; 
ms_map33_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5A788-ms_map33_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5A7D2-ms_map33_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5A7F0-ms_map33_EntityEvents
										dc.b $E
										dc.b 1
										dc.w sub_5A842-ms_map33_EntityEvents
										dc.b $10
										dc.b 1
										dc.w sub_5A864-ms_map33_EntityEvents
										dc.b $11
										dc.b 1
										dc.w sub_5A886-ms_map33_EntityEvents
										dc.b $F
										dc.b 1
										dc.w sub_5A8A8-ms_map33_EntityEvents
										dc.w $FD00
										dc.w nullsub_138-ms_map33_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_138:
										
										rts

	; End of function nullsub_138


; =============== S U B R O U T I N E =======================================

sub_5A788:
										
										trap    #1
										dc.w $16
										beq.s   loc_5A7A0
										trap    #TRAP_TEXTBOX
										dc.w $7A0               ; "(Sob, sob){N}(Sob, sob){N}Oh, {LEADER}!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7A1               ; "Oddler regained his memory{N}and suddenly went berserk.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7A2               ; "He had a fearful face,{N}but my master seemed to{N}understand everything.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7A3               ; "He fell into the sea to stop{N}Oddler.{N}Is Mr. Creed still alive?{W1}"
										bra.s   return_5A7D0
loc_5A7A0:
										
										trap    #1
										dc.w $312
										beq.s   loc_5A7B0
										trap    #TRAP_TEXTBOX
										dc.w $79E               ; "Is he getting back his{N}memory yet?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $79F               ; "He's suffering from a very{N}bad headache.{W1}"
										bra.s   return_5A7D0
loc_5A7B0:
										
										trap    #1
										dc.w $310
										beq.s   loc_5A7C0
										trap    #TRAP_TEXTBOX
										dc.w $771               ; "My master would like to{N}help you, {LEADER}.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $772               ; "Please choose one.{W1}"
										bra.s   return_5A7D0
loc_5A7C0:
										
										trap    #1
										dc.w $30F
										beq.s   loc_5A7CC
										trap    #TRAP_TEXTBOX
										dc.w $770               ; "Arc Valley was unsealed and{N}Zeon woke up?{W2}{N}This is a nightmare!{W1}"
										bra.s   return_5A7D0
loc_5A7CC:
										
										trap    #TRAP_TEXTBOX
										dc.w $723               ; "Mr. Creed is too busy!{N}Go away!{W1}"
return_5A7D0:
										
										rts

	; End of function sub_5A788


; =============== S U B R O U T I N E =======================================

sub_5A7D2:
										
										trap    #1
										dc.w $312
										beq.s   loc_5A7E2
										trap    #TRAP_TEXTBOX
										dc.w $79A               ; "We devils can't help you.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $79B               ; "People of the Earth have{N}to seal Zeon again by{N}themselves.{W1}"
										bra.s   return_5A7EE
loc_5A7E2:
										
										trap    #TRAP_TEXTBOX
										dc.w $76A               ; "Maybe the Jewel of Evil has{N}a secret.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $76B               ; "Storytellers in Tristan might{N}know something.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $76C               ; "Tristan is in North Parmecia.{W1}"
return_5A7EE:
										
										rts

	; End of function sub_5A7D2


; =============== S U B R O U T I N E =======================================

sub_5A7F0:
										
										trap    #1
										dc.w $312
										beq.s   loc_5A800
										trap    #TRAP_TEXTBOX
										dc.w $79C               ; "Hello, {LEADER}.{N}How are you?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $79D               ; "I'm well...but, I've had a{N}bad headache lately.{W1}"
										bra.s   return_5A826
loc_5A800:
										
										trap    #1
										dc.w $2F7
										bne.s   loc_5A80C
										trap    #TRAP_TEXTBOX
										dc.w $77F               ; "Hey, you're going east,{N}right?{N}I'm going with you!{W1}"
										bra.s   loc_5A814
loc_5A80C:
										
										trap    #TRAP_TEXTBOX
										dc.w $76D               ; "Oh, is a dwarf sick?{N}Really?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $76E               ; "OK, I think I can help him.{N}Bring me to him.{W1}"
loc_5A814:
										
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										lea     cs_5A828(pc), a0
										trap    #6
										trap    #2
										dc.w $2FA
										trap    #2
										dc.w $311
return_5A826:
										
										rts

	; End of function sub_5A7F0

cs_5A828:           dc.w $34                ; 0034 SET BLOCKS 110D 101 905
										dc.w $110D
										dc.w $101
										dc.w $905
										dc.w 4                  ; 0004 SET TEXT INDEX 76F : "{LEADER} decides to{N}take the fairy with him.{W1}"
										dc.w $76F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} decides to{N}take the fairy with him.{W1}"
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 82 1F 2
										dc.w $82
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5A842:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A85C
										trap    #1
										dc.w $313
										bne.s   loc_5A856
										lea     cs_5A8CA(pc), a0
										trap    #6
										dc.w $6004
loc_5A856:
										
										trap    #TRAP_TEXTBOX
										dc.w $775               ; "What a pity...then, I wish{N}happiness to all of you.{W1}"
										bra.s   return_5A862
loc_5A85C:
										
										lea     cs_5A90E(pc), a0
										trap    #6
return_5A862:
										
										rts

	; End of function sub_5A842


; =============== S U B R O U T I N E =======================================

sub_5A864:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A87E
										trap    #1
										dc.w $313
										bne.s   loc_5A878
										lea     cs_5A93A(pc), a0
										trap    #6
										dc.w $6004
loc_5A878:
										
										trap    #TRAP_TEXTBOX
										dc.w $778               ; "Tut!  OK, I have a{N}comfortable life here.{W1}"
										bra.s   return_5A884
loc_5A87E:
										
										lea     cs_5A97E(pc), a0
										trap    #6
return_5A884:
										
										rts

	; End of function sub_5A864


; =============== S U B R O U T I N E =======================================

sub_5A886:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A8A0
										trap    #1
										dc.w $313
										bne.s   loc_5A89A
										lea     cs_5A9AA(pc), a0
										trap    #6
										bra.s   loc_5A89E
loc_5A89A:
										
										trap    #TRAP_TEXTBOX
										dc.w $77B               ; "My magic could've been a{N}great help to you.{W1}"
loc_5A89E:
										
										bra.s   return_5A8A6
loc_5A8A0:
										
										lea     cs_5A9EE(pc), a0
										trap    #6
return_5A8A6:
										
										rts

	; End of function sub_5A886


; =============== S U B R O U T I N E =======================================

sub_5A8A8:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A8C2
										trap    #1
										dc.w $313
										bne.s   loc_5A8BC
										lea     cs_5AA1A(pc), a0
										trap    #6
										bra.s   loc_5A8C0
loc_5A8BC:
										
										trap    #TRAP_TEXTBOX
										dc.w $77E               ; "You...snot nose!{W1}"
loc_5A8C0:
										
										bra.s   return_5A8C8
loc_5A8C2:
										
										lea     cs_5AA5E(pc), a0
										trap    #6
return_5A8C8:
										
										rts

	; End of function sub_5A8A8

cs_5A8CA:           dc.w 4                  ; 0004 SET TEXT INDEX 773 : "I'm {NAME;14}, a knight.{N}I was looking for a magic{N}sword.{W2}"
										dc.w $773
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E : "I'm {NAME;14}, a knight.{N}I was looking for a magic{N}sword.{W2}"
										dc.w $E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E : "I would do anything for{N}Mr. Creed!  Please choose me.{W1}"
										dc.w $E
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A8E6
										dc.w $59
										dc.l cs_5A8E6           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX E : "What a pity...then, I wish{N}happiness to all of you.{W1}"
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A8E6:           dc.w 8                  ; 0008 JOIN FORCE E
										dc.w $E
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 10 0 463AE
										dc.b $10
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 11 0 463AE
										dc.b $11
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT F FF 463AE
										dc.b $F
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY E
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A90E:           dc.w 4                  ; 0004 SET TEXT INDEX 780 : "I really want to find the{N}legendary magic sword....{W2}"
										dc.w $780
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E : "I really want to find the{N}legendary magic sword....{W2}"
										dc.w $E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E : "But I can't do that if I'm{N}stuck here.{W2}{N}May I join your force?{W1}"
										dc.w $E
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A92A
										dc.w $59
										dc.l word_5A92A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX E : "No?  Then I'll continue my{N}search for the legendary{N}magic sword alone.{W1}"
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A92A:         dc.w 8                  ; 0008 JOIN FORCE E
										dc.w $E
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY E
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A93A:           dc.w 4                  ; 0004 SET TEXT INDEX 776 : "Hee, hee...I'm not only a{N}dwarf, I'm {NAME;16}.{W2}"
										dc.w $776
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10 : "Hee, hee...I'm not only a{N}dwarf, I'm {NAME;16}.{W2}"
										dc.w $10
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10 : "I'm known as the strongest{N}warrior of my people.{W1}"
										dc.w $10
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A956
										dc.w $59
										dc.l word_5A956         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 10 : "Tut!  OK, I have a{N}comfortable life here.{W1}"
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A956:         dc.w 8                  ; 0008 JOIN FORCE 10
										dc.w $10
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT E 0 463AE
										dc.b $E
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 11 0 463AE
										dc.b $11
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT F FF 463AE
										dc.b $F
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 10
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A97E:           dc.w 4                  ; 0004 SET TEXT INDEX 783 : "I was surprised to find I{N}had returned to my original{N}size!{W2}"
										dc.w $783
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10 : "I was surprised to find I{N}had returned to my original{N}size!{W2}"
										dc.w $10
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10 : "What should I do now?{N}I can go anywhere...{N}maybe...with you?{W1}"
										dc.w $10
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A99A
										dc.w $59
										dc.l word_5A99A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 10 : "Fine!  I'll stay in this{N}mansion then.{W1}"
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A99A:         dc.w 8                  ; 0008 JOIN FORCE 10
										dc.w $10
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 10
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A9AA:           dc.w 4                  ; 0004 SET TEXT INDEX 779 : "I'm {NAME;17}, a mage.{N}I studied magic in Ponpei.{W2}"
										dc.w $779
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11 : "I'm {NAME;17}, a mage.{N}I studied magic in Ponpei.{W2}"
										dc.w $11
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11 : "I'll miss my friends, but if{N}I can be of help, I'll go{N}with you!{W1}"
										dc.w $11
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A9C6
										dc.w $59
										dc.l word_5A9C6         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 11 : "My magic could've been a{N}great help to you.{W1}"
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A9C6:         dc.w 8                  ; 0008 JOIN FORCE 11
										dc.w $11
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT E 0 463AE
										dc.b $E
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 10 0 463AE
										dc.b $10
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT F FF 463AE
										dc.b $F
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 11
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A9EE:           dc.w 4                  ; 0004 SET TEXT INDEX 786 : "I'm not sure why, but I'm{N}free.{W2}"
										dc.w $786
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11 : "I'm not sure why, but I'm{N}free.{W2}"
										dc.w $11
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11 : "Can I join your force?{W1}"
										dc.w $11
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5AA0A
										dc.w $59
										dc.l word_5AA0A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 11 : "You may regret refusing me.{W1}"
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5AA0A:         dc.w 8                  ; 0008 JOIN FORCE 11
										dc.w $11
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 11
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5AA1A:           dc.w 4                  ; 0004 SET TEXT INDEX 77C : "I'm {NAME;15}, a priest.{N}I think I'm rather young{N}for my profession....{W2}"
										dc.w $77C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F : "I'm {NAME;15}, a priest.{N}I think I'm rather young{N}for my profession....{W2}"
										dc.w $F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F : "I don't want to stay in this{N}awful place forever.{N}Choose me!{W1}"
										dc.w $F
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5AA36
										dc.w $59
										dc.l word_5AA36         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX F : "You...snot nose!{W1}"
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5AA36:         dc.w 8                  ; 0008 JOIN FORCE F
										dc.w $F
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT E 0 463AE
										dc.b $E
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 10 0 463AE
										dc.b $10
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 11 FF 463AE
										dc.b $11
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY F
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5AA5E:           dc.w 4                  ; 0004 SET TEXT INDEX 789 : "I'm free!  Fresh air smells{N}so good!{W2}"
										dc.w $789
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F : "I'm free!  Fresh air smells{N}so good!{W2}"
										dc.w $F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F : "Where should I go?{N}Hey, may I go with you?{W1}"
										dc.w $F
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5AA7A
										dc.w $59
										dc.l word_5AA7A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX F : "Why, how rude!{W1}"
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5AA7A:         dc.w 8                  ; 0008 JOIN FORCE F
										dc.w $F
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY F
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
