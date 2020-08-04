# 2600game
A game for the Atari 2600 written in 6502 assembly. 

Assembled using DASM https://dasm-assembler.github.io/ and emulated on Stella https://stella-emu.github.io/. As suggested, assembling is conducted by running `dasm kernel.asm -lkernel.txt -f3 -v5 -okernel.bin`, to give custom names to the Listing and output Binary files, to use the maximum error Verboseness, and to use a raw format file type. The game can then be ran by simply running "stella kernel.bin".
