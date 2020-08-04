  processor 6502
  include "./dasm-src/machines/atari2600/vcs.h" ;Definitions for TIA register names
  
  org 0

  ldx #0 
  ldy #0 

  REPEAT 192; 

  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP

  inx 
  stx COLUBK 

  NOP
  NOP
  NOP

  dey
  sty COLUBK

  sta WSYNC

  REPEND
