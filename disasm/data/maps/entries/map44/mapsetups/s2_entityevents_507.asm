
; ASM FILE data\maps\entries\map44\mapsetups\s2_entityevents_507.asm :
; 0x5448A..0x5455E : 
ms_map44_flag507_EntityEvents:
                msEntityEvent 128, UP, Map44_1FB_EntityEvent0-ms_map44_flag507_EntityEvents
                msEntityEvent 129, UP, Map44_1FB_EntityEvent1-ms_map44_flag507_EntityEvents
                msEntityEvent 130, UP, Map44_1FB_EntityEvent2-ms_map44_flag507_EntityEvents
                msEntityEvent 134, UP, Map44_1FB_EntityEvent3-ms_map44_flag507_EntityEvents
                msEntityEvent 135, UP, Map44_1FB_EntityEvent4-ms_map44_flag507_EntityEvents
                msEntityEvent 136, UP, Map44_1FB_EntityEvent5-ms_map44_flag507_EntityEvents
                msEntityEvent 137, UP, Map44_1FB_EntityEvent6-ms_map44_flag507_EntityEvents
                msEntityEvent 138, UP, Map44_1FB_EntityEvent7-ms_map44_flag507_EntityEvents
                msEntityEvent 139, UP, Map44_1FB_EntityEvent8-ms_map44_flag507_EntityEvents
                msEntityEvent 140, UP, Map44_1FB_EntityEvent9-ms_map44_flag507_EntityEvents
                msDefaultEntityEvent Map44_DefaultEntityEvent-ms_map44_flag507_EntityEvents

; =============== S U B R O U T I N E =======================================


Map44_EntityEvent0:
                
                 
                txt     625             ; "My husband rushed out{N}of here when he saw the{N}sun rise.{W2}{N}Yeah, maybe he'll make{N}a good haul today.{W1}"
                rts

    ; End of function Map44_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map44_EntityEvent1:
                
                 
                txt     810             ; "Meow!{W1}"
                rts

    ; End of function Map44_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map44_261_EntityEvent0:
                
                 
                txt     620             ; "Hang it all!{N}Where have all the fish gone?!{N}My boss was really upset.{W1}"
                rts

    ; End of function Map44_261_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map44_261_EntityEvent1:
                
                 
                txt     621             ; "It's strange...{N}The sea is so calm.{W2}{N}I have never seen such a{N}quiet sea before!{W1}"
                rts

    ; End of function Map44_261_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map44_261_EntityEvent2:
                
                 
                txt     622             ; "I'm so sorry.  I have no fish{N}for you today.{W2}{N}I don't know why, but we{N}made no haul.{W1}"
                rts

    ; End of function Map44_261_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map44_261_EntityEvent3:
                
                 
                txt     623             ; "Meow! {W1}"
                rts

    ; End of function Map44_261_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map44_261_EntityEvent4:
                
                 
                txt     624             ; "Hey, you!{N}This ship is for{N}fishermen only!{W2}{N}Get out of here, you{N}silly kid!{W1}"
                rts

    ; End of function Map44_261_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map44_1FA_EntityEvent0:
                
                 
                txt     626             ; "I heard that Galam invaded{N}this kingdom while I was{N}fishing.{W2}{N}What's going on in the{N}castle?{W1}"
                rts

    ; End of function Map44_1FA_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent0:
                
                 
                txt     1001            ; "The town was destroyed{N}by the earthquake....{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent1:
                
                 
                txt     1002            ; "It was big enough to cause{N}a tsunami!{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent2:
                
                 
                txt     1003            ; "Leave port now!{N}Right now!{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent3:
                
                 
                txt     1004            ; "Who are you?{N}Don't push me.{N}The ship is full!{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent4:
                
                 
                txt     1005            ; "Ouch...{N}I have bruises everywhere!{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent5:
                
                 
                txt     1006            ; "There is no room for you{N}here!{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent6:
                
                 
                txt     1007            ; "Oh, my!  Granseal is{N}collapsing....{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent7:
                
                 
                txt     1008            ; "Sire!  Sir Astral!{N}Glad to see you again!{N}Can we put out now?{W1}"
                clsTxt
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #FOLLOWER_B,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     1009            ; "{LEADER}, are you ready{N}to leave port?{W1}"
                jsr     j_YesNoPrompt
                bne.s   byte_5454A      
                script  cs_54578
                bra.s   return_5454E
byte_5454A:
                
                txt     1010            ; "Then come back here very{N}soon.{W1}"
return_5454E:
                
                rts

    ; End of function Map44_1FB_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent8:
                
                 
                txt     1011            ; "King Granseal!{N}Sir Astral...oh,{N}Minister!{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map44_1FB_EntityEvent9:
                
                 
                txt     1012            ; "Everything is ready!{N}We can go anytime!{W1}"
                rts

    ; End of function Map44_1FB_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map44_DefaultEntityEvent:
                
                rts

    ; End of function Map44_DefaultEntityEvent

