
; ASM FILE data\maps\entries\map25\mapsetups\s4_descriptions.asm :
; 0x5D340..0x5D394 : 

; =============== S U B R O U T I N E =======================================


ms_map25_AreaDescriptions:
                
                move.w  #$1024,d3       ; "A book...{N}TRAVELS{W1}"
                lea     byte_5D350(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map25_AreaDescriptions

byte_5D350:     msDesc 2, 10, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}TRAVELS{W1}"
                msDesc 3, 10, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}VILLAGES AND TOWNS{W1}"
                msDesc 2, 16, 2, 2      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}Don't go out!  Or you'll{N}be punished!{N}- Devils{W1}"
                msDesc 6, 26, 2, 3      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}You doubt the punishment?{N}- Devils{W1}"
                msDesc 15, 26, 2, 4     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}Church is closed!{W1}"
                msDesc 15, 15, 2, 5     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}No praying today!{N}- Devils{W1}"
                msDesc 14, 18, 2, 6     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}Pacalon will never come to{N}save you!{W1}"
                msDesc 16, 19, 2, 7     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}Don't work!{W1}"
                msDesc 22, 29, 2, 8     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}Mitula ignores you!{W1}"
                msDesc 27, 24, 2, 9     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}No weapon or item sales!{N}- Devils{W1}"
                msDesc 16, 28, 2, 11    ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "It reads...{N}Village of Ketto{W1}"
                msDescEnd
