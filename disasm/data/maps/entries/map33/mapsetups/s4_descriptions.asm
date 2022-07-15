
; ASM FILE data\maps\entries\map33\mapsetups\s4_descriptions.asm :
; 0x5AAD8..0x5AB74 : 

; =============== S U B R O U T I N E =======================================


ms_map33_AreaDescriptions:
                
                move.w  #$1018,d3       ; "A book...{N}DEMON KINGS{W1}"
                lea     byte_5AAE8(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map33_AreaDescriptions

byte_5AAE8:     msDesc 14, 2, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}DEMON KINGS{W1}"
                msDesc 15, 2, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}NEWT COOKING{W1}"
                msDesc 16, 2, 4, 2      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}VAMPIRES{W1}"
                msDesc 17, 2, 4, 3      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CALL OF EVIL{W1}"
                msDesc 18, 2, 4, 4      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}STUDY OF RUNES{W1}"
                msDesc 22, 2, 4, 5      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}TODAY'S MAGIC{W1}"
                msDesc 14, 4, 4, 6      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}EVIL CONTACT{W1}"
                msDesc 15, 4, 4, 7      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MAGICAL CHANGES{W1}"
                msDesc 21, 5, 4, 8      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BASIC RULES OF{N}POSSESSION{W1}"
                msDesc 22, 5, 4, 9      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}GODS VS. DEVILS{W1}"
                msDesc 9, 10, 4, 10     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CHANNELING{W1}"
                msDesc 42, 2, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}DEMON KINGS{W1}"
                msDesc 43, 2, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}NEWT COOKING{W1}"
                msDesc 44, 2, 4, 2      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}VAMPIRES{W1}"
                msDesc 45, 2, 4, 3      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CALL OF EVIL{W1}"
                msDesc 46, 2, 4, 4      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}STUDY OF RUNES{W1}"
                msDesc 50, 2, 4, 5      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}TODAY'S MAGIC{W1}"
                msDesc 42, 4, 4, 6      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}EVIL CONTACT{W1}"
                msDesc 43, 4, 4, 7      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MAGICAL CHANGES{W1}"
                msDesc 49, 5, 4, 8      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BASIC RULES OF{N}POSSESSION{W1}"
                msDesc 50, 5, 4, 9      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}GODS VS. DEVILS{W1}"
                msDesc 37, 10, 4, 10    ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CHANNELING{W1}"
                msDesc 11, 9, 10, 11    ; "{NAME} investigated{N}the door.{W2}{CLEAR}"
                                        ; "It's locked.{W1}"
                msDescEnd
