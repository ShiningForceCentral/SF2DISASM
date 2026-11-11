PREAMBLE
--------

We assume the following:
- You have basic knowledge about how SF2DISASM folders are structured.
- You are working in a branch in which 'feature/expand_musics' feature branch has been merged.
- You have basic knowledge about the Furnace tracker software.
- You have composed music tracks in Furnace and saved them as .fur files (or you have received such files from someone else who composed them).
- You are interested in importing these music tracks to replace existing music tracks or add new music tracks into your Shining Force 2 ROM hack. ;-)



HOW TO USE
----------

- Put a bunch of .fur files into the "Input" folder with one of the following name patterns:
	+musicXX-My new song title.fur		[ADD = XX is a music number NOT USED by vanilla SF2 songs, between 45-64 when using extra music banks]
	@musicYY-My replacement song.fur	[REPLACE = YY is a music number USED by a vanilla SF2 song, please refer to "disasm/enum/music.asm" for the available list]
	+musicXX@YY-My moved song.fur		[MOVE-REPLACE = XX is a music number NOT USED by vanilla SF2 songs and YY is a music number USED by a vanilla SF2 song]
	+musicXX%YY-My swapped song.fur		[MOVE-SWAP = XX is a music number NOT USED by vanilla SF2 songs and YY is a music number USED by a vanilla SF2 song]
- As shown above, you can ADD NEW MUSICS or REPLACE EXISTING MUSICS or MOVE-REPLACE EXISTING MUSICS or MOVE-SWAP EXISTING MUSICS depending on how you name your .fur file.
- You can combine adding new musics, replacing existing musics, move-replacing existing musics and move-swapping existing musics together.
- To test quickly in emulator if a song sounds good in the game, you can replace music 9 (played during the game intro) or 33 (played in test menu).
	@music9-Quick test.fur		or		@music33-Quick test.fur
- Adding new musics is only useful if you modify map data or game code to use them (i.e: this use case is for the more ambitious projects).
- Replacing existing musics is the more common use case and is intended for hacks with smaller scopes. There is a small caveat with 2 problematic music pairs (explained below).
- The Furnace files MUST use EXACTLY and ONLY the Genesis chips (YM2612 + SMS PSG), Furnace files that are not compliant will be rejected by the tool.
- Run SF2MusicCooker.exe with first argument = path to your SF2DISASM folder and pray to the gods your Furnace files will be handled properly :-)
	TIP: You can use the __Run.bat script to make this more convenient (please edit it the first time to put the correct path to SF2DISASM folder)
- If the tool fails to handle a .fur file, an error message will be displayed that hopefully should explain what went wrong so you can tweak your .fur file.
- If everything goes well, the tool will write files to the appropriate locations in your SF2DISASM folder.
- You can also ask the tool to write files to 'Output' folder instead if you want to manually review the generated files.
- After generating the ROM, it is a VERY good idea to go to the sound test and verify everything works properly.



HOW TO USE (SFX)
----------------

- You can also replace SFXs (sound effects) by naming slightly differently your .fur files in the "Input" folder:
	+sfxZZ-My new sound effect.fur			[ADD = ZZ is a SFX number NOT USED by vanilla SF2 SFXs, between 121-126] (yes it's quite tight)
	@sfxWW-My replacement sound effect.fur	[REPLACE = WW is a SFX number USED by a vanilla SF2 SFXs, please refer to "disasm/enum/sfx.asm" for the available list]
- For SFXs, you cannot MOVE-REPLACE EXISTING SFXS or MOVE-SWAP EXISTING SFXS. You can only ADD NEW SFXS or REPLACE EXISTING SFXS.
- SFXs can only use some of the sound channels. They can be one of these 2 types:
	- Type 1: can use PSG tone 3 and Noise channels
	- Type 2: can use FM 4, FM 5 and the 6th channel in DAC mode (samples)
- Everything that applies above to musics also apply to SFXs.
- Except for this: in vanilla game SFX data, some SFXs depend on other SFXs (due to shared pointers).
- If you replace a SFX that is a dependency to other SFXs, the tool will error unless you replace ALL involved SFXs, all at once.



GOLDEN RULES (this section is especially relevant to music composers)
------------

1. Please create custom Sega Genesis songs in Furnace in the most basic way: no macros, no extreme octave notes, no exotic effects (see "LIMITATIONS" below for more details).
2. Your song should rely mostly on the standard 5 FM channels + the 6th channel. You can also use PSG tone channels 7 and 8.
3. You can use samples in channel 6 (but you won't be able to it as FM channel for the *full* song). Samples should be small and their playback quality is pretty mediocre, sadly.
4. Important instruments should use FM channels 1, 2, 3 because other channels can be borrowed by sound effects during SF2 gameplay.
5. Space in the ROM is limited and you should avoid extremely long songs with a ludicrous number of FM instruments / samples ( but you can still try ;-) ).



ROM SPACE
---------

The .fur files you submit to the tool will ultimately have to fit into the Music Banks of the ROM, otherwise the assembly will fail when you build the ROM.
Each Music Bank can hold 32768 bytes and SF2 Music Cooker will add a comment into each generated music .asm file to tell how many bytes the song will take.

The vanilla game comes with Music Bank 0 (musics 1 to 32) and Music Bank 1 (musics 33 to 64). Sadly, these two Music Banks are *almost* full.
For this reason, REPLACE EXISTING MUSICS feature can be pretty limited if you try to import songs that take more space than their vanilla music counterpart.

Thanks to the people at SF2Central that worked on expanding game ROM patches, it is now possible to add extra Music Banks inside the expanded ROM space.
If you enable the 'EXPANDED_MUSIC_BANKS' patch, you will have access to 4 extra, fully available Music Banks to host all your custom music needs.
These are called Music Bank Ext 0 (musics 45 to 50), Music Bank Ext 1 (musics 51 to 56), Music Bank Ext 2 (musics 57 to 60) and Music Bank Ext 3 (musics 61 to 64).
As you can see, the Music Bank 1 range was cut down compared to the vanilla game. Its range is now 33 to 44.
Under this new Music Banks layout, you should especially put your largest musics into 57 to 64 range, and keep the smaller musics for 1 to 32 range.
Ultimately it is up to you how you want to distribute your musics across music banks, the only condition is that it fits!

The MOVE-REPLACE EXISTING MUSIC feature allows you to replace a vanilla music by a custom music, while putting the new music into Music Bank Ext 0, 1, 2 or 3.
The MOVE-SWAP EXISTING MUSIC feature allows you to add a custom music at the music number of a vanilla music, and move the vanilla music to the specified custom music number.

For SFXs, it appears the SFX Bank from the vanilla game still has some space available, so space should (hopefully) not be a concern here.
There is no Extra Bank feature for SFX Bank, you have to fit everything into a single bank.

For musics and SFXs that use samples, the vanilla game comes with 2 PCM banks (PCM Bank 0 and PCM Bank 1) that are pretty much full.
Eight Extra PCM banks (PCM Bank Ext 0, 1, 2, 3, 4, 5, 6, 7) have been implemented with 'EXPANDED_PCM_BANKS' patch to provide some much needed breathing room.
Additionally, the sound driver has been modified to support 128 different samples, up from original 17.
Sadly, the PCM quality is... not very good in the sound driver. Please do not rely too much on PCM samples.



LAYOUTS (how to support other games, not just Shining Force 2, FOR ADVANCED USERS ONLY)
-------

The first thing SF2 Music Cooker does is to find the proper layout to use for the DISASM folder you pass as 1st argument when you run the program.
The layout tells the tool where files are located, how many music/SFX/PCM banks there are, how many PCM samples are supported and so on.

SF2 Music Cooker was built obviously with a focus on Shining Force 2, but the community can extend it to work with other games (Shining Force 1 anyone?).
To do that, you need to extend the 'layouts.json' file and make sure the target game DISASM folder is sufficiently mature and has all the required files/folders.
To be considered mature, the DISASM should have:
- A custom CUBE sound driver (such as 'Cubewiz' sound driver used in SF2DISASM) where YM/PSG note frequencies and PCM sample entries are defined in nice, separate .asm files
- Music number/SFX number enums in their own .asm file
- Code/data disassembly should be complete enough to reference music/SFX numbers through their respective enum instead of hardcoded values (otherwise MOVE-REPLACE/SWAP won't work)
When in doubt, take a look at how SF2DISASM does it and update your DISASM to be closer to it.

The layouts.json file must also be modified if you make critical changes to your local SF2DISASM folder, such as changing the sound driver or ROM layout.
If you forget this, important changes such as increasing the number of PCM samples available for use or adding new music banks won't be taken in account properly.



OPTIONS (those can save your day or at least work around problems!)
-------

SF2 Music Cooker can be run with the following option switches to alter its behavior: (must appear after the 1st argument)

--includeoriginalnames		or		-ion	Include original names of replaced musics (in the sound test)
--disableextendednotes		or		-det	Prevents the tool from recycling unused SF2 sound driver notes (unsupported notes will use the closest vanilla SF2 note instead)
--bettercompression			or		-bt		Improve slightly compression at the cost of increased generation time
--vanilla					or		-v		Do not read input files and generate an output that should perfectly replicate vanilla musics/SFXs
--nukemusic					or		-nm		Replace musics from vanilla game by empty musics (can be useful as a temporary bank size issue workaround)
--nukesfx					or		-ns		Replace SFXs from vanilla game by empty SFXs (can be useful as a temporary bank size issue workaround)
--nukeall					or		-na		Replace everything from vanilla game by emptiness (equivalent to --nukemusic --nukesfx)
--nopause					or		-np		Do not ask to press a key to quit the program
--nopostbuild				or		-npb	Do not run POSTBUILD.bat, even if it's provided
--autoyes					or		-ay		Automatically confirm to write files to DISASM folder
--autono					or		-an		Automatically confirm to write files to Output folder (has priority over --autoyes)
--input=X					or		-i=X	Read files in "X" folder instead of "Input" folder
--onlyN						or		-oN		(N = 1..126) Only process the .fur file for the given music/SFX number and ignore the rest (only useful for developers)

The following options can be specified globally or per-music/per-SFX:

--muteN						or		-mN		(N = 1..10) If present disable output of channel N (you can stack multiple --muteN options)
--isolateN					or		-iN		(N = 1..10) If present disable output of all channels except channel N (you can stack multiple --isolateN options)
--muteinstrument=x			or		-mi=x	Mute Furnace instrument x in the output (can be stacked multiple times with different values)
--mutesamples				or		-ms		Disable output of channel 6 if it plays samples (useful to work around issues with samples)
--enablerewrite				or		-er		(Experimental feature) Enable tricks to support volume/panning changes between notes, will increase size of output and alter the results
--divide=x					or		-d=x	(Experimental feature) Divide the number of rows of each pattern by x and try to fit notes the best we can (number of rows must be dividable by x)
--preserverate				or		-pr		Disable tricks to support properly musics below 13 hz and fix SFXs play speed (see caveat below for explanations)
--removerelease				or		-rr		Remove all note release commands (===) in all channels
--removeoff					or		-ro		Remove all note off commands (OFF) in all channels
--removevol					or		-rv		Remove all volume effects in all channels
--removepan					or		-rp		Remove all panning effects in all channels
--removelegato				or		-rl		Remove all legato effects in all channels
--noenvelopeguessing		or		-neg	Disable guessing of the proper PSG envelope to use based on channel volume commands (gives different results and may use less space)
--nonotemacros				or		-nnm	Disable the use of note macros in note/psgNote commands, decimal note index will be used instead (only useful for developers)
--nooptimize				or		-no		Do not reduce the size of the music sheet with 'countedLoopStart/End' blocks (implicitly set if --dumpnotes is used)
--dumpnotes					or		-dn		Write Furnace tracker commands alongside produced ASM commands in the music sheet (only useful for developers or curious people)
--dumpuncompressed			or		-du		Write a copy of decompressed input Furnace file into "Uncompressed" folder (only useful for developers)
--transposefm=x				or		-tfm=x	Transpose Furnace FM notes with x amount of semitones (12 = +1 octave, -12 = -1 octave, default amount is 0)
--transposepsg=x			or		-tpsg=x	Transpose Furnace PSG tone notes with x amount of semitones (12 = +1 octave, -12 = -1 octave, default amount is 0)
--sampleratecoeff=x			or		-src=x	Scale the sample rate of all samples by x (default is x=1.0, and sound driver has a limit when playing very high pitched samples)
--volume=x					or		-v=x	Multiply master volume by x (default is x=1.0, see warning below about samples volume)
--volumefm=x				or		-vfm=x	Multiply FM volume by x
--volumepsg=x				or		-vpsg=x	Multiply PSG volume by x
--volumesample=x			or		-vs=x	Multiply samples volume by x [warning: same samples played at different volumes across songs will result in different samples in ROM]
--volume:linear				or		-v:l	Use linear YM volume (technically incorrect but may give interesting results depending on the music)
--volume:nearest			or		-v:n	Use nearest instead of truncating when mapping YM volume to SF2 sound driver volume (gives subtly different results)

To apply options per-music/per-SFX, provide an "options.txt" file in the "Input" folder.
Example file:
	* = --mutesamples	; * joker applies to everything
	*m = -m9 -10		; *m joker applies to all musics
	*s = --volume=1.2	; *s joker applies to all SFXs
	33 = --dumpnotes
	41 = --transposefm=2



LIMITATIONS (for those that want to go in-depth)
-----------

SF2 Music Cooker currently supports:
- FM channels 1 to 5
- Channel 6 in FM mode
- Channel 6 in DAC mode (samples) 
- PSG channels (3 square tones + 1 noise generator)
- Notes between C-0 and B-9 on Furnace side (120 notes), unsupported notes are filtered out
- Furnace notes are mapped to SF2 sound driver notes in a best effort fashion (84 YM notes and 64 PSG tone notes are available in vanilla SF2), notes in unsupported octaves are clamped
- By default, SF2 sound driver supports YM notes from C-1 to B-7 and PSG tone notes from A-0 to C-6
- This tool has the ability to add 4 extra YM notes and recycle unused YM and PSG tone notes to reach unsupported octaves in custom musics you provide (please do not rely on this too much)
- You can use volume macros for your Furnace PSG instruments; if you do, this tool will use that information to find the most similar volume envelope in the SF2 sound driver
- If you don't use volume macros for your Furnace PSG instruments, this tool will instead try to guess the volume envelope from volume commands on the channel
- Arbitrary tempo for musics (see below for special caveats about the tick rate)
- New FM instruments, these will get added to the vanilla SF2 instruments
- New samples, these will get added to the vanilla SF2 samples (almost impossible to do without using expanded PCM banks)
- Effects supported by the SF2 sound driver, such as volume, panning, vibrato
- Furnace effects "end song", "jump to pattern" and "jump to next pattern" (to make the song loop or not)
- Song size reduction by detecting "repeated command patterns" and replacing them with counted loops
- Reasonably long songs that use many FM instruments and notes (as long as it can fit in the assembled ROM)
- New songs will appear in the Sound Test; the Sound Test is also improved with better SFX names and circular navigation

SF2 Music Cooker doesn't plan to support (unless there is an *overwhelming* demand for the feature):
- Custom vibrato shapes / depth (please note: PSG vibratos are WILDLY INACCURATE ingame compared to how they sound in Furnace, sorry I don't plan to fix this!)
- Custom PSG envelopes
- Additional song size reduction by detecting voltas (repeats with different endings)
- Furnace features such as "macros" (only exception is volume macros for PSG instruments), "groove", "speed 2" and other gimmicks/effects/compatibility flags (sorry)
- Other file formats, such as VGM format, you will have to adapt them yourself into .fur files before using this tool (the 'vgm2fur' Python tool is very promising)
- Shining Force 1 (maybe most of the puzzle pieces are already solved and it wouldn't require *that* much effort, but I didn't look at SF1 DISASM and music engine at all)

Special caveat about tick rates:
- Musics can theorically have a tick rate between 13 hz and 3329 hz (this is the possible frequency range for the YM2612 timer)
- Most SF2 vanilla musics play at 60 hz
- SFXs *cannot* specify a tick rate, and their effective speed is based on the music tick rate
- SFXs seem to play at the correct speed if music is between 30 and 60 hz (lower makes SFXs play slower, higher makes SFXs play faster)
- Furnace files for SFXs should have a play rate between 58 and 62 hz (files slower than 30 hz will be multiplied to land in this range if possible)
- This tool will try to artificially multiply frequency and pattern rows of musics to reach a tick rate >= 13 hz that plays nice with the SFXs
- TL;DR / To summarize: Furnace files should play at 60 hz for SFXs, and somewhere between 30~60 hz for musics, if you submit slower musics the tool will try to fix it for you ;)

Special caveat for replacing music pairs (3, 4) and (13, 14):
- Vanilla SF2 musics "Mitula Shrine" and "Elven Town" (13, 14) are closely related and combined together in the SF2DISASM music assembly files
- The same applies for "Promoted Attack" and "Promoted Attack Loop" (3, 4)
- This makes it very inconvenient to replace each music separately without affecting the other
- You CAN replace these musics, but if you don't provide a replacement for the other music in the pair, the music you provided will also replace the other music in the pair
- You CANNOT move-replace or move-swap paired musics