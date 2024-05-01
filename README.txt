Legal Info
----------------
Copyright 2021 by Z80 ASMer
All rights reserved.

THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

This software, the game, is freeware. This game is free for commercial use with the condition that the game is not altered. 
This game is only to be put on a physical cartridge for a single game (i.e. not a multi-game cartridge).
This game is free for non-commercial use with the condition that the game is not altered.

The above means you can sell the unaltered game, on a physical cartridge, if you choose to do so.

If you wish to alter the game, for some reason, you will need to contact me first; my written permission is required for a possible alteration.

######################### Bookworm  (MSXDev 2021  GAME)#####################
Game name: Bookworm
Platform: MSX with 8K of RAM 
Game size: 16KB ROM
GAME format: Cartridge
Game Genre: Educational typing game and action game
Name of the group / individuals involved: Z80 ASMer
License: Freeware
Contact details: drop me a line on the Stack Overflow 
if you need ask about the game (here is my profile page)

https://stackoverflow.com/users/15210223/z80asmer



Game Description
--------------------------

This is an easy game to learn how to play but it is more difficult to master.  The purpose of the game is to test or improve your typing skills 
in a situation with stress.

The game has sound effects and music (inspired by sound of birds chirping and noisy bugs such as bees, wasps, mosquitoes, flies, crickets, grasshoppers).
The music is inspired from the sound of flying insects buzzing about and the music is designed to make the typing situation more stressful, because it 
is not relaxing music, since the game is designed to test how well you can type under stress. So the game is designed to be played while the music is
playing.

The better you are at typing the easier the game is. Guide the Bob, the bookworm, as he glides, attempting to avoiding the flies, in his path.
 The book worm is using the leaf to glide with while holding a book in his other hand.  A randomly generated sentence will show at the top of the
screen, which you, the bookworm, must type in (INCLUDING SPACES & FULL STOP) before the sentence disappears and is replaced by another sentence.
 Type in the sentence at the top of the screen correctly (including the full stop) to gain 50 turbo down points. There are over 3000 unique possible
 sentences.

The purpose of turbo down points is that it allows Bob to move down quicker when down is pressed; when there are no turbo down point Bob moves less
 quickly downwards (and so the game obviously feels slower). The maximum number of turbo points at any time is 250. Turbo points down enables the 
capturing of hearts more easily and makes avoiding enemies more easily. Hearts come out of the tree hollows.

Additional points are, awarded as follows, added by collecting the following items: a book gets 125 points, an apple gets 100 points, a cupcake gets
 75 points and a star gets 50 points.

The "RUN" score counts if you are on a streak, or run, of continuously entered correct sentences-if you enter 5 correct sentences then you are 
rewarded by a reduction of damage. Getting a run encourages better typing skills.

So there are at least two challenges in this game: to beat the high score; and also get as many runs as possible.

*Pressing 3 uses MSX (or Z80 ASM) specific words in the sentences-when this mode
is enabled "MSX" appears near the bottom of the screen.
*Pressing 2 uses general words, i.e. not MSX specific words, and this is shown by
the absence of the word 'MSX" near the bottom of the screen.
*Pressing 4 enables easy level (shown as E.LEVEL on screen)
*Pressing 5 enables normal level (shown as N.LEVEL on screen)

The mode can only be changed, if the score is below 2500, using 2,3,4,5. Pressing 2,3,4 or 5 also resets the current score and current high score as 
it is expected to be pressed near to a beginning of a game or before a new game is started.

In easy level the words in the sentence DO NOT get longer once the high score is passed. In normal level the words in the next sentence get longer
AFTER the high score is passed.

So there is more challenges of trying to beat the high scores in the four modes generates by the above key presses.

*6 turns off sound effects. 
*7 turns on sounds effects. 

The sounds effects are the heart captured sound effect and the sound effect when game ends (using lower notes).

*Space key starts a new game.

The two videos demonstrate game play strategy for getting high scores of 16059 and 13090 are in the folder; the videos are low resolution with no sound;
on an MSX the graphics look better and have sound compared to the video.

With normal level difficulty the game gets harder (longer sentences to type in correctly)
once a new high score is achieved. So the game starts off easy.
The game test how well you can type under pressure.

To complete the game and show the game ending a score of 65450 (or greater)  is required in any mode. So for example collecting 3 books,1 apple,2 
cupcakes and a 1 star brings you just over 1% closer to completing the game. Or, for example, collecting 3 books and 3 apples also brings you just over 1% closer to completing the game.

Control Keys
----------------

This is a one player game that uses the keyboard.

Space-starts the game
Left, right, down-moves the player, turbo down points enable
the player to move down faster, for some distance, depending
on the turbo down points value
2-use generic words (i.e. non MSX words) in the sentence
3-use MSX specific words in the sentence
4-enables easy mode
5-enables normal mode
6-turns off sounds effects
7-turns on sound effects
A to Z,space and full stop for entering a sentence. Entering
a sentence correctly gains turbo down points.

Note that the mode can only be changed, using 2,3,4,5, if the score is below 2500-otherwise you will need for a new game to start to change the mode.
It is not allowed to simultaneously press any cursor key and any key used for entering a sentence characters.

Emulation
-----------------

Game developed with Open MSX, version 0.12.0, so it will work with  the OpenMSX emulator version 0.120 and it works with  OpenMSX version 0.15.0
(the latest version of the emulator).

How to play
----------------

The keys to move the player (the book worm) are are left, right, down;  down also accelerates down, for some time, if turbo down is greater than 0.
 The space key starts a new game. The more turbo points you have the longer the distance you can move downwards at a faster speed. 

You need to type in the sentence correctly at the top of the screen, as fast as possible, before it disappears, to get turbo down points;
 you must include typing in SPACES and FULL STOPS in the sentence; for every correct character entered it is replaced by a tick.

 
The aim of the game is to get the best high score, and get as many runs as possible, and thus improve your typing skills. So try and get the 
 highest score you can. Capturing a heart (with the leaf) will reduce damage between 9% and 45%. A hit by a fly (onto the leaf) causes damage of 
between 6% and 10%. Having the ability to move downwards quickly, by having turbo down points, makes it easier to capture a heart or easier to 
avoid a fly.

Collect the books, apples, cupcakes or stars for additional points.

What strategy will you use to get a high score?Here are game play techniques.

* One idea is to accept some damage from a fly while attempting to  capture a heart if there is a good chance to capture the heart (so overall there
 is no loss of damage). You do not need to dodge every single fly as long as you can plan on capturing enough hearts to stop the overall damage 
level increasing to 100% in the long run.
*Another idea is to get so good at typing that you do not need to look at the keyboard ,or not look at it much, this makes the game easier.
*It is recommended to start in easy mode as the words are shorter.


Credits
-----------

Everything in this game, code, graphics, sounds, music is by Z80 ASMer.
Everything in this game is done from scratch ,by Z80 ASMer.
Game made using VASM assembler in 100 percent assembly language. The game is made
in assembly for maximum speed as there is so many things happening on screen and
other things the games does.

Update
------

Won a prize (a retro gaming annual) in MSX DEV '21 for Bookworm.

Version History
-----------------------

>>22-February-2021 The first version of the game is submitted to MSXDEV'21.
>>12-January-2022 Updated this READ ME file.
