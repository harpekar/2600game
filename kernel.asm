  processor 6502
  include "./dasm-src/machines/atari2600/vcs.h" ;Definitions for TIA register names
  include "./dasm-src/machines/atari2600/macro.h" ;DASM Macro definitiom
  
  org 0

Reset; System Reset 

  ldx #0 
  lda #0 

Clear ;Initialize TIA and RAM
    
  sta 0,x
  inx
  bne Clear
  
StartOfFrame

  inx 
  stx COLUBK 

  ldy #F
  sty COLUBK

  sta WSYNC

  REPEND
