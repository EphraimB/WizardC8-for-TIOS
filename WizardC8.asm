.org $9d93
    .db $bb, $6d

Start:
    ld a, (screenBuffer + 0)
    ld bc, 12 * 64
    ld de, screenBuffer+(19 * 12)
    ld hl, Number_0


; I'm using ionfastCopy as a placeholder

#define gbuf screenBuffer                   ;what ion.inc defines the screen buffer as

;code for ionfastcopy directly from ionf.z80

fastCopy:
     di
     ld a, $80                             ; 7
     out ($10), a                          ; 11
     ld hl, gbuf - 12 - (-(12 * 64) + 1)   ; 10
     ld a, $20                             ; 7
     ld c, a                               ; 4
     inc hl                                ; 6 waste
     dec hl                                ; 6 waste

fastCopyAgain:
    ld b, 64                               ; 7
    inc c                                  ; 4
    ld de, -(12 * 64) + 1                  ; 10
    out ($10), a                           ; 11
    add hl, de                             ; 11
    ld de, 10                              ; 10

fastCopyLoop:
    add hl, de                             ; 11
    inc hl                                 ; 6 waste
    inc hl                                 ; 6 waste
    inc de                                 ; 6
    ld a, (hl)                             ; 7
    out ($11), a                           ; 11
    dec de                                 ; 6
    djnz fastCopyLoop                      ; 13/8
    ld a, c                                ; 4
    cp $2B + 1                             ; 7
    jr nz, fastCopyAgain                   ; 10/1

    ret                                    ; 10
    
;-----Buffers-----

screenBuffer:    ; 12*64 Buffer
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0



;----Data----

Number_0:  ; 8x5
    .db %00011000
    .db %00100100
    .db %00100100
    .db %00100100
    .db %00011000

Number_1:  ; 8x5
    .db %00001000
    .db %00101000
    .db %00001000
    .db %00001000
    .db %00111110

Number_2:  ; 8x5
    .db %00011000
    .db %00100100
    .db %00001000
    .db %01110000
    .db %01111110

Number_3:  ; 8x5
    .db %00111000
    .db %00000100
    .db %00011000
    .db %00000100
    .db %00111000

Number_4:  ; 8x5
    .db %00100100
    .db %00100100
    .db %00111100
    .db %00000100
    .db %00000100

Number_5:  ; 8x5
    .db %00011100
    .db %00010000
    .db %00011100
    .db %00000010
    .db %00011100

Number_6:  ; 8x5
    .db %00100000
    .db %00100000
    .db %00110000
    .db %00101000
    .db %00111000

Number_7:  ; 8x5
    .db %01111100
    .db %00001000
    .db %00010000
    .db %00100000
    .db %01000000

Number_8:  ; 8x5
    .db %00111000
    .db %01000100
    .db %00111000
    .db %01000100
    .db %00111000

Number_9:  ; 8x5
    .db %00011100
    .db %00010100
    .db %00001100
    .db %00000100
    .db %00000100

Letter_A:  ; 8x5
    .db %00001000
    .db %00010100
    .db %00111100
    .db %01000010
    .db %10000001

Letter_B:  ; 8x5
    .db %00111000
    .db %00100100
    .db %00111000
    .db %00100100
    .db %00111000

Letter_C:  ; 8x4
    .db %00011100
    .db %00100000
    .db %00100000
    .db %00011100

Letter_D:  ; 8x4
    .db %00011000
    .db %00010100
    .db %00010100
    .db %00011000

Letter_E:  ; 8x5
    .db %00011100
    .db %00010000
    .db %00011100
    .db %00010000
    .db %00011100

Letter_F:  ; 8x5
    .db %00011100
    .db %00010000
    .db %00011100
    .db %00010000
    .db %00010000

Letter_G:  ; 8x5
    .db %00011100
    .db %00100000
    .db %01001110
    .db %00100010
    .db %00011100

Letter_H:  ; 8x5
    .db %00010010
    .db %00010010
    .db %00011110
    .db %00010010
    .db %00010010

Letter_I:  ; 8x5
    .db %01111100
    .db %00010000
    .db %00010000
    .db %00010000
    .db %01111100

Letter_J:  ; 8x5
    .db %00010000
    .db %00010000
    .db %00010000
    .db %01010000
    .db %00110000

Letter_K:  ; 8x5
    .db %00100010
    .db %00100100
    .db %00111000
    .db %00100100
    .db %00100010

Letter_L:  ; 8x5
    .db %00010000
    .db %00010000
    .db %00010000
    .db %00010000
    .db %00011111

Letter_M:  ; 8x5
    .db %01000100
    .db %01101100
    .db %01010100
    .db %01000100
    .db %01000100

Letter_N:  ; 8x5
    .db %00110010
    .db %00101010
    .db %00100110
    .db %00100010
    .db %00100010

Letter_O:  ; 8x5
    .db %00111100
    .db %01000010
    .db %10000001
    .db %01000010
    .db %00111100

Letter_P:  ; 8x5
    .db %00011100
    .db %00010100
    .db %00011000
    .db %00010000
    .db %00010000

Letter_Q:  ; 8x5
    .db %00011000
    .db %00100100
    .db %01001010
    .db %00100100
    .db %00011010

Letter_R:  ; 8x5
    .db %00011000
    .db %00010100
    .db %00011000
    .db %00010100
    .db %00010100

Letter_S:  ; 8x5
    .db %00011000
    .db %00100000
    .db %00011000
    .db %00000100
    .db %00011000

Letter_T:  ; 8x5
    .db %00111110
    .db %00001000
    .db %00001000
    .db %00001000
    .db %00001000

Letter_U:  ; 8x5
    .db %01000010
    .db %01000010
    .db %01000010
    .db %00100100
    .db %00011000

Letter_V:  ; 8x5
    .db %01000001
    .db %00100010
    .db %00100010
    .db %00010100
    .db %00001000

Letter_W:  ; 8x5
    .db %01000100
    .db %01000100
    .db %01010100
    .db %01101100
    .db %01000100

Letter_X:  ; 8x5
    .db %01000100
    .db %00101000
    .db %00110000
    .db %01001000
    .db %10000100

Letter_Y:  ; 8x5
    .db %00100100
    .db %00011000
    .db %00001000
    .db %00001000
    .db %00001000

Letter_Z:  ; 8x5
    .db %00111100
    .db %00001000
    .db %00010000
    .db %00100000
    .db %01111100

Letter_a:  ; 8x5
    .db %00011000
    .db %00100100
    .db %01000010
    .db %00100110
    .db %00011001

Letter_b:  ; 8x5
    .db %00010000
    .db %00010000
    .db %00011000
    .db %00010100
    .db %00011000

Letter_c:  ; 8x5
    .db %00011100
    .db %00100000
    .db %01000000
    .db %00100000
    .db %00011100

Letter_d:  ; 8x5
    .db %00001000
    .db %00001000
    .db %00011000
    .db %00101000
    .db %00011000

Letter_e:  ; 8x5
    .db %00001100
    .db %00010010
    .db %00011110
    .db %00010000
    .db %00001100

Letter_f:  ; 8x5
    .db %00001100
    .db %00010010
    .db %00111000
    .db %00010000
    .db %00010000

Letter_g:  ; 8x5
    .db %00001000
    .db %00010100
    .db %00001100
    .db %00100100
    .db %00011100

Letter_h:  ; 8x5
    .db %00010000
    .db %00010000
    .db %00011000
    .db %00010100
    .db %00010100

Letter_i:  ; 8x5
    .db %00010000
    .db %00000000
    .db %00010000
    .db %00010000
    .db %00010000

Letter_j:  ; 8x5
    .db %00010000
    .db %00010000
    .db %00010000
    .db %01010000
    .db %00110000

Letter_k:  ; 8x5
    .db %00010100
    .db %00011000
    .db %00011000
    .db %00010100
    .db %00010010

Letter_l:  ; 8x5
    .db %00010000
    .db %00010000
    .db %00010000
    .db %00010000
    .db %00010000

Letter_m:  ; 8x5
    .db %00010100
    .db %00101010
    .db %00101010
    .db %00101010
    .db %00101010

Letter_n:  ; 8x5
    .db %00101000
    .db %00110100
    .db %00100100
    .db %00100100
    .db %00100100

Letter_o:  ; 8x5
    .db %00011000
    .db %00100100
    .db %01000010
    .db %00100100
    .db %00011000

Letter_p:  ; 8x5
    .db %00011000
    .db %00010100
    .db %00011000
    .db %00010000
    .db %00010000

Letter_q:  ; 8x5
    .db %00010000
    .db %00101000
    .db %00011000
    .db %00001010
    .db %00000100

Letter_r:  ; 8x5
    .db %00010100
    .db %00011010
    .db %00010000
    .db %00010000
    .db %00010000

Letter_s:  ; 8x5
    .db %00011100
    .db %00100000
    .db %00011000
    .db %00000100
    .db %00111000

Letter_t:  ; 8x5
    .db %00010000
    .db %00111000
    .db %00010000
    .db %00010000
    .db %00010000

Letter_u:  ; 8x5
    .db %01000100
    .db %01000100
    .db %01000100
    .db %00101100
    .db %00010100

Letter_v:  ; 8x5
    .db %01000001
    .db %00100010
    .db %00010100
    .db %00010100
    .db %00001000

Letter_w:  ; 8x5
    .db %00100010
    .db %00100010
    .db %00101010
    .db %00110110
    .db %00100010

Letter_x:  ; 8x5
    .db %00100100
    .db %00011000
    .db %00011000
    .db %00100100
    .db %01000010

Letter_y:  ; 8x5
    .db %00100100
    .db %00011000
    .db %00001000
    .db %00001000
    .db %00001000

Letter_z:  ; 8x5
    .db %00111100
    .db %00001000
    .db %00010000
    .db %00100000
    .db %01111100

Symbol_Comma:  ; 8x5
    .db %00000000
    .db %00000000
    .db %00100000
    .db %00010000
    .db %00100000

Symbol_SemiColon:  ; 8x5
    .db %00010000
    .db %00000000
    .db %00000000
    .db %00000000
    .db %00010000

Symbol_DollarSign:  ; 8x5
    .db %00011100
    .db %00101000
    .db %00011100
    .db %00001010
    .db %00011110
