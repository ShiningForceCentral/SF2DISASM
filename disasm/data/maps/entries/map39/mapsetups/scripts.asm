
; ASM FILE data\maps\entries\map39\mapsetups\scripts.asm :
; 0x5E0F8..0x5E22C : 
cs_5E0F8:       textCursor 2053
                setCameraEntity ALLY_GYAN
                setDest ALLY_BOWIE,19,7
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                setPos FOLLOWER_B,19,8,RIGHT
                setPos ALLY_PETER,18,8,RIGHT
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_GYAN,LEFT
                nextSingleText $0,ALLY_GYAN ; "Well, you're not from{N}Pacalon, are you?{W1}"
                nextSingleText $0,FOLLOWER_B ; "We're from Granseal,{N}Mr. {NAME;24}.{W1}"
                nextSingleText $0,ALLY_GYAN ; "Granseal...I've never heard{N}of it....{W1}"
                nextSingleText $0,FOLLOWER_B ; "It's near Ribble in South{N}Parmecia.{W1}"
                nextSingleText $0,ALLY_GYAN ; "Near my home?{N}Are you sure?{W1}"
                nextSingleText $0,FOLLOWER_B ; "We settled there just over{N}a year ago.{W1}"
                nextSingleText $0,ALLY_GYAN ; "The blocked tunnel is open{N}now?{W1}"
                nextSingleText $0,FOLLOWER_B ; "Yes.  Now you can go back{N}home.{W1}"
                nextSingleText $0,ALLY_GYAN ; "I've been waiting for this{N}day!{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                entityActionsWait ALLY_GYAN
                 moveLeft 4
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_PETER,UP
                setFacing ALLY_GYAN,RIGHT
                csWait 10
                nextSingleText $0,ALLY_GYAN ; "By the way, why did you{N}come to North Parmecia?{W1}"
                nextSingleText $0,ALLY_PETER ; "To defeat devils!{W1}"
                setFacing ALLY_GYAN,DOWN
                nextSingleText $0,ALLY_GYAN ; "Really?{W1}"
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                setFacing ALLY_BOWIE,LEFT
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                setFacing FOLLOWER_B,LEFT
                setFacing ALLY_GYAN,RIGHT
                nextText $0,FOLLOWER_B  ; "We don't want another{N}tragedy like Moun.{W2}"
                nextSingleText $0,FOLLOWER_B ; "We're going to Grans Island{N}to kill the King of the{N}Devils.{W1}"
                setFacing ALLY_GYAN,LEFT
                setFacing ALLY_GYAN,RIGHT
                nextSingleText $0,ALLY_GYAN ; "Hmmm....{W2}"
                setFacing ALLY_GYAN,UP
                nextSingleText $0,ALLY_GYAN ; "I can't go back now!{W1}"
                shiver FOLLOWER_B
                nextSingleText $0,FOLLOWER_B ; "But...your family...{W1}"
                setFacing ALLY_GYAN,RIGHT
                nextSingleText $0,ALLY_GYAN ; "I know.  I'll miss them.{W2}"
                setFacing ALLY_GYAN,LEFT
                nextSingleText $0,ALLY_GYAN ; "But, I believe they'll{N}understand.{W2}"
                setFacing ALLY_GYAN,RIGHT
                nextSingleText $0,ALLY_GYAN ; "Let me go with you!{W1}"
                join ALLY_GYAN
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_GYAN,FOLLOWER_B,2
                setPos ALLY_ZYNK,4,12,UP
                csc_end
cs_5E20A:       textCursor 2073
                nextSingleText $0,ALLY_ZYNK ; "I happened to overhear your{N}conversation with {NAME;24}.{W2}"
                nextSingleText $0,ALLY_ZYNK ; "I want to go to Grans, too.{W1}"
                nextSingleText $0,128   ; "They decide to take the{N}ancient soldier {NAME;26}{N}with them.{W1}"
                setFacing ALLY_ZYNK,DOWN
                shiver ALLY_ZYNK
                nextSingleText $0,ALLY_ZYNK ; "There is no time to waste!{W1}"
                addNewFollower ALLY_ZYNK
                csc_end
