
; ASM FILE data\maps\entries\map33\mapsetups\s2_entityevents.asm :
; 0x5A766..0x5AA8A : 
ms_map33_EntityEvents:
                msEntityEvent 128, DOWN, Map33_EntityEvent0-ms_map33_EntityEvents
                msEntityEvent 129, UP, Map33_EntityEvent1-ms_map33_EntityEvents
                msEntityEvent 130, UP, Map33_EntityEvent2-ms_map33_EntityEvents
                msEntityEvent 14, UP, Map33_EntityEvent3-ms_map33_EntityEvents
                msEntityEvent 16, UP, Map33_EntityEvent4-ms_map33_EntityEvents
                msEntityEvent 17, UP, Map33_EntityEvent5-ms_map33_EntityEvents
                msEntityEvent 15, UP, Map33_EntityEvent6-ms_map33_EntityEvents
                msDefaultEntityEvent Map33_DefaultEntityEvent-ms_map33_EntityEvents

; =============== S U B R O U T I N E =======================================

Map33_DefaultEntityEvent:
                
                rts

    ; End of function Map33_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================

Map33_EntityEvent0:
                
                 
                chkFlg  $16             ; Frayja joined
                beq.s   byte_5A7A0      
                txt     $7A0            ; "(Sob, sob){N}(Sob, sob){N}Oh, {LEADER}!{W2}"
                txt     $7A1            ; "Oddler regained his memory{N}and suddenly went berserk.{W2}"
                txt     $7A2            ; "He had a fearful face,{N}but my master seemed to{N}understand everything.{W2}"
                txt     $7A3            ; "He fell into the sea to stop{N}Oddler.{N}Is Mr. Creed still alive?{W1}"
                bra.s   return_5A7D0
byte_5A7A0:
                
                chkFlg  $312            ; Set after Oddler elects to stay behind at Creed's Mansion
                beq.s   byte_5A7B0      
                txt     $79E            ; "Is he getting back his{N}memory yet?{W2}"
                txt     $79F            ; "He's suffering from a very{N}bad headache.{W1}"
                bra.s   return_5A7D0
byte_5A7B0:
                
                chkFlg  $310            ; Set after the event in the basement of Creed's Mansion
                beq.s   byte_5A7C0      
                txt     $771            ; "My master would like to{N}help you, {LEADER}.{W2}"
                txt     $772            ; "Please choose one.{W1}"
                bra.s   return_5A7D0
byte_5A7C0:
                
                chkFlg  $30F            ; Set after the scene where Creed restores the Force and heads down the basement
                beq.s   byte_5A7CC      
                txt     $770            ; "Arc Valley was unsealed and{N}Zeon woke up?{W2}{N}This is a nightmare!{W1}"
                bra.s   return_5A7D0
byte_5A7CC:
                
                txt     $723            ; "Mr. Creed is too busy!{N}Go away!{W1}"
return_5A7D0:
                
                rts

    ; End of function Map33_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map33_EntityEvent1:
                
                 
                chkFlg  $312            ; Set after Oddler elects to stay behind at Creed's Mansion
                beq.s   byte_5A7E2      
                txt     $79A            ; "We devils can't help you.{W2}"
                txt     $79B            ; "People of the Earth have{N}to seal Zeon again by{N}themselves.{W1}"
                bra.s   return_5A7EE
byte_5A7E2:
                
                txt     $76A            ; "Maybe the Jewel of Evil has{N}a secret.{W2}"
                txt     $76B            ; "Storytellers in Tristan might{N}know something.{W2}"
                txt     $76C            ; "Tristan is in North Parmecia.{W1}"
return_5A7EE:
                
                rts

    ; End of function Map33_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map33_EntityEvent2:
                
                 
                chkFlg  $312            ; Set after Oddler elects to stay behind at Creed's Mansion
                beq.s   byte_5A800      
                txt     $79C            ; "Hello, {LEADER}.{N}How are you?{W2}"
                txt     $79D            ; "I'm well...but, I've had a{N}bad headache lately.{W1}"
                bra.s   return_5A826
byte_5A800:
                
                chkFlg  $2F7            ; Set after talking to one of the dwarves in the mine near the Fairy Woods
                bne.s   byte_5A80C      
                txt     $77F            ; "Hey, you're going east,{N}right?{N}I'm going with you!{W1}"
                bra.s   byte_5A814
byte_5A80C:
                
                txt     $76D            ; "Oh, is a dwarf sick?{N}Really?{W2}"
                txt     $76E            ; "OK, I think I can help him.{N}Bring me to him.{W1}"
byte_5A814:
                
                clsTxt
                script  cs_5A828
                setFlg  $2FA            ; Set after the fairy tags along at Creed's
                setFlg  $311            ; Set after the fairy tags along at Creed's
return_5A826:
                
                rts

    ; End of function Map33_EntityEvent2

cs_5A828:       setBlocks 17,13,1,1,9,5
                textCursor $76F
                nextSingleText $FF,255  ; "{LEADER} decides to{N}take the fairy with him.{W1}"
                followEntity 130,FOLLOWER_B,2
                csc_end

; =============== S U B R O U T I N E =======================================

Map33_EntityEvent3:
                
                 
                chkFlg  $16             ; Frayja joined
                bne.s   byte_5A85C
                chkFlg  $313            ; ???
                bne.s   byte_5A856      
                script  cs_5A8CA
                dc.w $6004
byte_5A856:
                
                txt     $775            ; "What a pity...then, I wish{N}happiness to all of you.{W1}"
                bra.s   return_5A862
byte_5A85C:
                
                script  cs_5A90E
return_5A862:
                
                rts

    ; End of function Map33_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map33_EntityEvent4:
                
                 
                chkFlg  $16             ; Frayja joined
                bne.s   byte_5A87E
                chkFlg  $313            ; ???
                bne.s   byte_5A878      
                script  cs_5A93A
                dc.w $6004
byte_5A878:
                
                txt     $778            ; "Tut!  OK, I have a{N}comfortable life here.{W1}"
                bra.s   return_5A884
byte_5A87E:
                
                script  cs_5A97E
return_5A884:
                
                rts

    ; End of function Map33_EntityEvent4


; =============== S U B R O U T I N E =======================================

Map33_EntityEvent5:
                
                 
                chkFlg  $16             ; Frayja joined
                bne.s   byte_5A8A0
                chkFlg  $313            ; ???
                bne.s   byte_5A89A      
                script  cs_5A9AA
                bra.s   loc_5A89E
byte_5A89A:
                
                txt     $77B            ; "My magic could've been a{N}great help to you.{W1}"
loc_5A89E:
                
                bra.s   return_5A8A6
byte_5A8A0:
                
                script  cs_5A9EE
return_5A8A6:
                
                rts

    ; End of function Map33_EntityEvent5


; =============== S U B R O U T I N E =======================================

Map33_EntityEvent6:
                
                 
                chkFlg  $16             ; Frayja joined
                bne.s   byte_5A8C2
                chkFlg  $313            ; ???
                bne.s   byte_5A8BC      
                script  cs_5AA1A
                bra.s   loc_5A8C0
byte_5A8BC:
                
                txt     $77E            ; "You...snot nose!{W1}"
loc_5A8C0:
                
                bra.s   return_5A8C8
byte_5A8C2:
                
                script  cs_5AA5E
return_5A8C8:
                
                rts

    ; End of function Map33_EntityEvent6

cs_5A8CA:       textCursor $773
                nextText $0,ALLY_ERIC   ; "I'm {NAME;14}, a knight.{N}I was looking for a magic{N}sword.{W2}"
                nextText $0,ALLY_ERIC   ; "I would do anything for{N}Mr. Creed!  Please choose me.{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5A8E6 ; YES/NO prompt answer
                nextSingleText $0,ALLY_ERIC ; "What a pity...then, I wish{N}happiness to all of you.{W1}"
                csc_end
cs_5A8E6:       join ALLY_ERIC
                setF $313               ; ???
                setActscript ALLY_RANDOLF,eas_463AE
                setActscript ALLY_TYRIN,eas_463AE
                setActscriptWait ALLY_KARNA,eas_463AE
                addNewFollower ALLY_ERIC
                csc_end
cs_5A90E:       textCursor $780
                nextText $0,ALLY_ERIC   ; "I really want to find the{N}legendary magic sword....{W2}"
                nextText $0,ALLY_ERIC   ; "But I can't do that if I'm{N}stuck here.{W2}{N}May I join your force?{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5A92A ; YES/NO prompt answer
                nextSingleText $0,ALLY_ERIC ; "No?  Then I'll continue my{N}search for the legendary{N}magic sword alone.{W1}"
                csc_end
cs_5A92A:       join ALLY_ERIC
                setF $313               ; ???
                addNewFollower ALLY_ERIC
                csc_end
cs_5A93A:       textCursor $776
                nextText $0,ALLY_RANDOLF ; "Hee, hee...I'm not only a{N}dwarf, I'm {NAME;16}.{W2}"
                nextText $0,ALLY_RANDOLF ; "I'm known as the strongest{N}warrior of my people.{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5A956 ; YES/NO prompt answer
                nextSingleText $0,ALLY_RANDOLF ; "Tut!  OK, I have a{N}comfortable life here.{W1}"
                csc_end
cs_5A956:       join ALLY_RANDOLF
                setF $313               ; ???
                setActscript ALLY_ERIC,eas_463AE
                setActscript ALLY_TYRIN,eas_463AE
                setActscriptWait ALLY_KARNA,eas_463AE
                addNewFollower ALLY_RANDOLF
                csc_end
cs_5A97E:       textCursor $783
                nextText $0,ALLY_RANDOLF ; "I was surprised to find I{N}had returned to my original{N}size!{W2}"
                nextText $0,ALLY_RANDOLF ; "What should I do now?{N}I can go anywhere...{N}maybe...with you?{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5A99A ; YES/NO prompt answer
                nextSingleText $0,ALLY_RANDOLF ; "Fine!  I'll stay in this{N}mansion then.{W1}"
                csc_end
cs_5A99A:       join ALLY_RANDOLF
                setF $313               ; ???
                addNewFollower ALLY_RANDOLF
                csc_end
cs_5A9AA:       textCursor $779
                nextText $0,ALLY_TYRIN  ; "I'm {NAME;17}, a mage.{N}I studied magic in Ponpei.{W2}"
                nextText $0,ALLY_TYRIN  ; "I'll miss my friends, but if{N}I can be of help, I'll go{N}with you!{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5A9C6 ; YES/NO prompt answer
                nextSingleText $0,ALLY_TYRIN ; "My magic could've been a{N}great help to you.{W1}"
                csc_end
cs_5A9C6:       join ALLY_TYRIN
                setF $313               ; ???
                setActscript ALLY_ERIC,eas_463AE
                setActscript ALLY_RANDOLF,eas_463AE
                setActscriptWait ALLY_KARNA,eas_463AE
                addNewFollower ALLY_TYRIN
                csc_end
cs_5A9EE:       textCursor $786
                nextText $0,ALLY_TYRIN  ; "I'm not sure why, but I'm{N}free.{W2}"
                nextText $0,ALLY_TYRIN  ; "Can I join your force?{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5AA0A ; YES/NO prompt answer
                nextSingleText $0,ALLY_TYRIN ; "You may regret refusing me.{W1}"
                csc_end
cs_5AA0A:       join ALLY_TYRIN
                setF $313               ; ???
                addNewFollower ALLY_TYRIN
                csc_end
cs_5AA1A:       textCursor $77C
                nextText $0,ALLY_KARNA  ; "I'm {NAME;15}, a priest.{N}I think I'm rather young{N}for my profession....{W2}"
                nextText $0,ALLY_KARNA  ; "I don't want to stay in this{N}awful place forever.{N}Choose me!{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5AA36 ; YES/NO prompt answer
                nextSingleText $0,ALLY_KARNA ; "You...snot nose!{W1}"
                csc_end
cs_5AA36:       join ALLY_KARNA
                setF $313               ; ???
                setActscript ALLY_ERIC,eas_463AE
                setActscript ALLY_RANDOLF,eas_463AE
                setActscriptWait ALLY_TYRIN,eas_463AE
                addNewFollower ALLY_KARNA
                csc_end
cs_5AA5E:       textCursor $789
                nextText $0,ALLY_KARNA  ; "I'm free!  Fresh air smells{N}so good!{W2}"
                nextText $0,ALLY_KARNA  ; "Where should I go?{N}Hey, may I go with you?{W1}"
                yesNo
                jumpIfFlagSet $59,cs_5AA7A ; YES/NO prompt answer
                nextSingleText $0,ALLY_KARNA ; "Why, how rude!{W1}"
                csc_end
cs_5AA7A:       join ALLY_KARNA
                setF $313               ; ???
                addNewFollower ALLY_KARNA
                csc_end
