
; ASM FILE data\maps\entries\map03\mapsetups\s4_descriptions_543.asm :
; 0x62846..0x628BE : 

; =============== S U B R O U T I N E =======================================


ms_map3_flag543_AreaDescriptions:
                
                move.w  #$FC3,d3        ; "Welcome!{N}WEAPONS and ITEMS{W1}"
                lea     byte_62856(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map3_flag543_AreaDescriptions

byte_62856:     msDesc 9, 22, 2, 0      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "Welcome!{N}WEAPONS and ITEMS{W1}"
                msDesc 7, 4, 4, 1       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}ATTITUDE OF SOLDIERS{W1}"
                msDesc 7, 9, 3, 2       ; "{NAME} investigated{N}the wash basin.{W2}{CLEAR}"
                                        ; "Soapy water...{N}(gulp, gulp)...yuck!{N}That tastes disgusting!{W1}"
                msDesc 26, 13, 5, 3     ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A deep well.{W1}"
                msDesc 40, 6, 4, 4      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}HEALING MAGIC{W1}"
                msDesc 41, 6, 4, 5      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BEGINNER SWORDSMANSHIP{W1}"
                msDesc 42, 6, 6, 6      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "It reads...{N}Nothing to fear but fear{N}itself.{W1}"
                msDesc 43, 6, 6, 7      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "It reads...{N}Look before you leap.{W1}"
                msDesc 44, 6, 6, 8      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "It reads...{N}No pain, no gain.{N}...is this true?{W1}"
                msDesc 53, 13, 4, 9     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}THE LEGEND OF MAX{W1}"
                msDesc 54, 13, 4, 10    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BE GOOD{W1}"
                msDesc 55, 13, 4, 11    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}LITTLE DINOSAURS{W1}"
                msDesc 56, 13, 4, 12    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}SEGA GUIDE{N}...sounds good.{W1}"
                msDesc 56, 15, 4, 13    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}AN OLD GOAT{N}...Sir Astral?{W1}"
                msDesc 57, 15, 4, 14    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}GUIDE TO THE CASTLE{W1}"
                msDesc 58, 15, 4, 15    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}STUDY OF YOGURT{W1}"
                msDesc 59, 15, 4, 16    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}SCIENCE 101{W1}"
                msDescEnd
