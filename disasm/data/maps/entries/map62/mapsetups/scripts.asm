
; ASM FILE data\maps\entries\map62\mapsetups\scripts.asm :
; 0x5C876..0x5C950 : 
cs_5C876:       textCursor 3613
                setActscriptWait 128,eas_Jump
                nextSingleText $0,128   ; "Who is it?  Petro?{W1}"
                setFacing 128,DOWN
                nextSingleText $0,128   ; "Well, who are you?{W1}"
                nextSingleText $0,129   ; "Petro?  Is he back?{W1}"
                setCamDest 1,5
                nextSingleText $0,129   ; "Petro!  The Sky Orb is OUR{N}treasure!  Give it back!{W2}"
                entityActionsWait 129
                 moveDown 3
                endActions
                nextSingleText $0,129   ; "Say something!{N}Petro!{W1}"
                entityActionsWait 129
                 moveDown 2
                endActions
                customActscriptWait 129
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveDown 1
                endActions
                setCamDest 1,10
                nextSingleText $0,129   ; "Oh, you're not Petro.{N}Who...are you?{W1}"
                csc_end
cs_5C8D4:       textCursor 3619
                nextText $0,129         ; "Ancient stone?  Yes, my{N}family had it for a long{N}time.{W2}"
                setFacing 129,RIGHT
                nextSingleText $0,129   ; "But, it was stolen.{W1}"
                nextSingleText $0,129   ; "His brother, my grandson,{N}took the stone, the Sky Orb,{N}when he left.{W2}"
                setFacing 129,DOWN
                nextText $0,129         ; "I think he went to Grans{N}Island to operate an ancient{N}vehicle.{W2}"
                nextSingleText $0,129   ; "I've lost my purpose to live.{W1}"
                entityActionsWait 129
                 moveUp 6
                endActions
                csc_end
cs_5C8FE:       textCursor 3627
                nextSingleText $0,129   ; "You need my help?{W1}"
                nextSingleText $0,129   ; "Come in.  Talk to me.{W1}"
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                csc_end
cs_5C914:       textCursor 3629
                nextText $0,129         ; "I came here looking for{N}ancient treasure, and found{N}the Sky Orb.{W2}"
                nextText $0,129         ; "Also, I discovered how to{N}use the ancient tunnels.{W2}"
                nextSingleText $0,129   ; "But, most of them are{N}useless, except for the{N}one to Grans.{W1}"
                nextText $0,ALLY_PETER  ; "To Grans?{W1}"
                nextSingleText $0,ALLY_PETER ; "Can we get to Grans Island{N}through it?{W1}"
                nextSingleText $0,129   ; "Yes.  Do you want to go{N}there?{W2}"
                nextSingleText $0,129   ; "Really?{W2}"
                nextSingleText $0,129   ; "You'll go to Grans with me.{N}Let's go now!{W1}"
                nextSingleText $FF,255  ; "{LEADER} decides to go{N}with him.{W1}"
                nextSingleText $0,129   ; "All I want is the Sky Orb.{N}Just help me get that, and{N}then you can leave.{W1}"
                followEntity 129,FOLLOWER_B,2
                setF 77                 ; Old man is a follower
                csc_end
