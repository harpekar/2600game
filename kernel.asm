  processor 6502
  include "./dasm-src/machines/atari2600/vcs.h" ;Definitions for TIA register names
  include "./dasm-src/machines/atari2600/macro.h" ;DASM Macro definitiom
 
PATTERN = $80 ;storage location
TIMETOCHANGE = 20 ;speed of animation

  seg
  org $F000

Reset; System Reset 

  ldx #0 
  lda #0 

Clear sta 0,x ;Initialize TIA and RAM
  inx
  bne Clear
  
  lda #0
  sta PATTERN ;Binary PF pattern

  lda #$45
  sta COLUPF ;Playfield color

  ldy #0

StartOfFrame

  lda #0
  sta VBLANK

  lda #2
  sta VSYNC

  sta WSYNC
  sta WSYNC
  sta WSYNC  

  lda #0
  sta VSYNC

  ;vertical blank

  ldx #0

VerticalBlank sta WSYNC
  
  inx
  cpx #37

  bne VerticalBlank

  ;change in pattern every 20 frames

  iny 
  cpy #TIMETOCHANGE

  bne keepsame

  ldy #0
  inc PATTERN

keepsame
  lda PATTERN ;use saved pattern in playfield
  sta PF1

  ldx #0

Picture stx COLUBK ;
  sta WSYNC ;wait until end of scanline

  inx 
  cpx #192

  bne Picture

  lda #%01000010

  sta VBLANK
  ldx #0

Overscan sta WSYNC
  inx 
  cpx #30
  bne Overscan

  jmp StartOfFrame

  ;--------------------

  org $FFFA

InterruptVectors
  
  .word Reset ; NMI
  .word Reset ; RESET
  .word Reset ; IRQ

  END
