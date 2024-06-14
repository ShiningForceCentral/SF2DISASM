
; ASM FILE code\specialscreens\witch\soundtest-standard.asm :
; Sound test restoration functions.

; =============== S U B R O U T I N E =======================================


SoundTest:      txt     464                         ; "Oh! I have a good idea.{N}Let's listen to music!{W1}"
                sndCom  SOUND_COMMAND_FADE_OUT
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                clr.w   d0
                clr.w   d7                          ; D7 = # bytes into sound table, so we clear it here
                
                lea     table_SoundtrackTitles(pc),a0
                clr.w   d1
                moveq   #41,d2                      ; d2.w = index beyond which a number is written instead of a title
                
@UpdateTrack:   move.b  table_Soundtracks(pc,d7.w),d1
                jsr     (DisplaySoundtrackTitle).w
                
@Start:         jsr     (WaitForVInt).w
                
@Right:         btst    #INPUT_BIT_RIGHT,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Left
                cmpi.w  #91,d7      ; check we're not trying to go beyond final track
                bge.s   @Left       ; if we are, branch into 'left button push' code
                addq.w  #1,d7
                bra.s   @UpdateTrack
                
@Left:          btst    #INPUT_BIT_LEFT,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @A
                tst.w   d7          ; check we're not trying to go below the first track
                ble.s   @A          ; if we are, branch into 'A button push' code
                subq.w  #1,d7
                bra.s   @UpdateTrack
                
@A:             btst    #INPUT_BIT_A,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @C
                bra.s   @PlayTrack
                
@C:             btst    #INPUT_BIT_C,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @B
                
@PlayTrack:     sndCom  MUSIC_STOP
                move.b  d1,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                
@B:             btst    #INPUT_BIT_B,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Start
            if (STANDARD_BUILD&TEST_BUILD=1)
                rts
            else
                sndCom  SOUND_COMMAND_FADE_OUT
                bra.s   @Start
            endif

    ; End of function SoundTest

; ---------------------------------------------------------------------------

table_Soundtracks:
                
                dc.b MUSIC_INTRO
                dc.b MUSIC_WITCH
                dc.b MUSIC_SUSPEND
                dc.b MUSIC_MAIN_THEME
                dc.b MUSIC_BATTLE_THEME_3
                dc.b MUSIC_BATTLE_THEME_1
                dc.b MUSIC_SHRINE
                dc.b MUSIC_FINAL_BATTLE
                dc.b MUSIC_ATTACK
                dc.b MUSIC_PROMOTED_ATTACK
                dc.b MUSIC_ENEMY_ATTACK
                dc.b MUSIC_BOSS_ATTACK
                dc.b MUSIC_ZEON_ATTACK
                dc.b MUSIC_TOWN
                dc.b MUSIC_MITHRIL_DIGGERS
                dc.b MUSIC_CASTLE
                dc.b MUSIC_HEADQUARTERS
                dc.b MUSIC_MITULA_SHRINE
                dc.b MUSIC_SAD_THEME_2
                dc.b MUSIC_ENDING
                dc.b MUSIC_MITULA
                dc.b MUSIC_ELVEN_TOWN
                dc.b MUSIC_SAD_THEME_3
                dc.b MUSIC_SAD_THEME_1
                dc.b MUSIC_PIANO_THEME
                dc.b MUSIC_CORRUPTED_SAVE
                dc.b MUSIC_JOIN
                dc.b MUSIC_SAD_JOIN
                dc.b MUSIC_SAVE
                dc.b MUSIC_CURE
                dc.b MUSIC_UNUSED_REVIVE
                dc.b MUSIC_REVIVE
                dc.b MUSIC_PROMOTION
                dc.b MUSIC_CURSED_ITEM
                dc.b MUSIC_ITEM
                dc.b MUSIC_TITLE
                dc.b SFX_MENU_SWITCH
                dc.b SFX_MENU_SELECTION
                dc.b SFX_VALIDATION
                dc.b SFX_REFUSAL
                dc.b SFX_DIALOG_BLEEP_1
                dc.b SFX_DIALOG_BLEEP_2
                dc.b SFX_DIALOG_BLEEP_3
                dc.b SFX_DIALOG_BLEEP_4
                dc.b SFX_DIALOG_BLEEP_5
                dc.b SFX_DIALOG_BLEEP_6
                dc.b SFX_DIALOG_BLEEP_7
                dc.b SFX_DIALOG_BLEEP_8
                dc.b SFX_SPELL_CAST
                dc.b SFX_DOOR_OPEN_HIGH_PITCH
                dc.b SFX_WALKING
                dc.b SFX_UNUSED_FROM_LANDSTALKER
                dc.b SFX_LIGHTNING_1
                dc.b SFX_LIGHTNING_2
                dc.b SFX_HIT_1
                dc.b SFX_HIT_2
                dc.b SFX_BLAST
                dc.b SFX_SWORDS_HIT
                dc.b SFX_JUMP
                dc.b SFX_FALLING
                dc.b SFX_WARP
                dc.b SFX_CHIRRUP_SANDALS
                dc.b SFX_MONSTER_DIALOG_BLEEP
                dc.b SFX_DOOR_OPEN
                dc.b SFX_BIG_DOOR_RUMBLE
                dc.b SFX_MONSTER_SCREAM
                dc.b SFX_BUUBOBI
                dc.b SFX_SECRET_PATH_ROCK
                dc.b SFX_PSH
                dc.b SFX_PSHHH
                dc.b SFX_BLOAB
                dc.b SFX_BLO
                dc.b SFX_LANDSTALKER_ITEM
                dc.b SFX_LEVEL_UP
                dc.b SFX_PRISM_LASER_LOADING
                dc.b SFX_SPAWN
                dc.b SFX_SFCD_STATUES
                dc.b SFX_DESOUL
                dc.b SFX_SITD_HOWL
                dc.b SFX_PRISM_LASER_FIRING
                dc.b SFX_BOOST
                dc.b SFX_DESOUL_HOVERING
                dc.b SFX_PRISM_LASER_CUTSCENE_FIRING
                dc.b SFX_TAROS_DIALOG_BLEEP
                dc.b SFX_HEALING
                dc.b SFX_BLAST_SPELL
                dc.b SFX_WING_FLAP
                dc.b SFX_BATTLEFIELD_DEATH
                dc.b SFX_DEMON_BREATH
                dc.b SFX_INTRO_LIGHTNING
                dc.b SFX_BOLT_SPELL
                dc.b SFX_TINKLING

; ---------------------------------------------------------------------------

table_SoundtrackTitles:
                
                defineName ""
                defineName "Legend of Light"
                defineName "The Young Men of Granseal"
                defineName "Fight, with the Ancient Light"
                defineName ""
                defineName "Dark Force"
                defineName "Footsteps of Ruin"
                defineName "Roar of the King of Devils"
                defineName "A Peaceful Moment"
                defineName "Lurking in the Darkness"
                defineName "Witch in the Forest of Illusion"
                defineName "Midnight in the Forest of Illusion"
                defineName "Time of Trials"
                defineName "Fairy Woods"
                defineName "Dreaming Elis"
                defineName "Reminiscence"
                defineName "Heartbreak"
                defineName "Twilight of the Warriors"
                defineName "Oh, Damnit"
                defineName "Joined the Party"
                defineName "Sadly Joined the Party"
                defineName "Save"
                defineName "Antidote"
                defineName "Revival, Long Version"
                defineName "Revival"
                defineName "Promotion"
                defineName "You've Been Cursed!"
                defineName "It's a Treasure Chest!"
                defineName "Shining Force II"
                defineName ""
                defineName ""
                defineName ""
                defineName ""
                defineName "The Call of a Long Journey"
                defineName "Entrance to the Demon World"
                defineName "A Message from Ancient Times"
                defineName "The King of Devils has Appeared"
                defineName "Dwarf Dwarf Dwarf"
                defineName "The Bloodline of Ground Seal"
                defineName "The Caravan Proceeds"
                defineName "Ancient Wings"
                defineName "Chosen Heroes"
