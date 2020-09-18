  processor 6502
  include "./dasm-src/machines/atari2600/vcs.h" ;Definitions for TIA register names
  include "./dasm-src/machines/atari2600/macro.h" ;DASM Macro definitiom
  
  seg
  org $F000

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

  ldy #0
  sty COLUBK

  sta WSYNC

  REPEND
