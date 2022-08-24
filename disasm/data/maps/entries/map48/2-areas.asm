
; ASM FILE data\maps\entries\map48\2-areas.asm :
; 0xB4AD2..0xB4B10 : 
                
                    mainLayerStart      0, 0
                    mainLayerEnd        26, 31
                    scndLayerFgndStart  0, 0
                if (STANDARD_BUILD&NO_DARKNESS_IN_CAVES=1)
                    scndLayerBgndStart  0, 33
                else
                    scndLayerBgndStart  28, 33
                endif
                    mainLayerParallax   256, 256
                    scndLayerParallax   256, 256
                    mainLayerAutoscroll 0, 0
                    scndLayerAutoscroll 128, 128
                    mainLayerType    255
                    areaDefaultMusic 34
                
                    mainLayerStart      28, 0
                    mainLayerEnd        59, 31
                    scndLayerFgndStart  0, 0
                if (STANDARD_BUILD&NO_DARKNESS_IN_CAVES=1)
                    scndLayerBgndStart  0, 33
                else
                    scndLayerBgndStart  28, 33
                endif
                    mainLayerParallax   256, 256
                    scndLayerParallax   256, 256
                    mainLayerAutoscroll 0, 0
                    scndLayerAutoscroll 128, 128
                    mainLayerType    255
                    areaDefaultMusic 34
                endWord
