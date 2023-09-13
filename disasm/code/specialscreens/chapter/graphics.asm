

pt_ChapterScreenPalettes:
                dc.l plt_ChapterScreen1
                dc.l plt_ChapterScreen2
                dc.l plt_ChapterScreen1
                dc.l plt_ChapterScreen1
plt_ChapterScreen1:   incbin "data/graphics/specialscreens/chapterscreen/palette1.bin"
plt_ChapterScreen2:   incbin "data/graphics/specialscreens/chapterscreen/palette2.bin"
plt_ChapterScreen3:   incbin "data/graphics/specialscreens/chapterscreen/palette3.bin"
plt_ChapterScreen4:   incbin "data/graphics/specialscreens/chapterscreen/palette4.bin"

pt_ChapterScreenTiles:
                dc.l ChapterScreenTiles1
                dc.l ChapterScreenTiles1
                dc.l ChapterScreenTiles1
                dc.l ChapterScreenTiles1
ChapterScreenTiles1:  incbin "data/graphics/specialscreens/chapterscreen/tiles1.bin"
;ChapterScreenTiles2:  incbin "data/graphics/specialscreens/chapterscreen/tiles2.bin"
;ChapterScreenTiles3:  incbin "data/graphics/specialscreens/chapterscreen/tiles3.bin"
;ChapterScreenTiles4:  incbin "data/graphics/specialscreens/chapterscreen/tiles4.bin"

pt_ChapterScreenLayouts:
                dc.l ChapterScreenLayout1
                dc.l ChapterScreenLayout1
                dc.l ChapterScreenLayout1
                dc.l ChapterScreenLayout1
ChapterScreenLayout1: incbin "data/graphics/specialscreens/chapterscreen/layout1.bin"
;ChapterScreenLayout2: incbin "data/graphics/specialscreens/chapterscreen/layout2.bin"
;ChapterScreenLayout3: incbin "data/graphics/specialscreens/chapterscreen/layout3.bin"
;ChapterScreenLayout4: incbin "data/graphics/specialscreens/chapterscreen/layout4.bin"
