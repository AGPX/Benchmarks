; Compiled with 1.31.258.0
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 79 1c STX $1c79 ; (spentry + 0)
0811 : a2 1c __ LDX #$1c
0813 : a0 9c __ LDY #$9c
0815 : a9 00 __ LDA #$00
0817 : 85 25 __ STA IP + 0 
0819 : 86 26 __ STX IP + 1 
081b : e0 1c __ CPX #$1c
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 25 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 25 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 9c __ CPY #$9c
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 80 __ LDX #$80
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 80 __ CPX #$80
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 64 __ LDA #$64
083d : 85 2f __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 30 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s1000 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
0880 : 38 __ __ SEC
0881 : a5 2f __ LDA SP + 0 
0883 : e9 06 __ SBC #$06
0885 : 85 2f __ STA SP + 0 
0887 : b0 02 __ BCS $088b ; (main.s0 + 0)
0889 : c6 30 __ DEC SP + 1 
.s0:
088b : a9 cf __ LDA #$cf
088d : 8d 14 03 STA $0314 
0890 : a9 08 __ LDA #$08
0892 : 8d 15 03 STA $0315 
0895 : a9 64 __ LDA #$64
0897 : 85 48 __ STA T1 + 0 
.l3:
0899 : 20 db 08 JSR $08db ; (draw.s0 + 0)
089c : c6 48 __ DEC T1 + 0 
089e : d0 f9 __ BNE $0899 ; (main.l3 + 0)
.s5:
08a0 : 20 44 e5 JSR $e544 
08a3 : a9 42 __ LDA #$42
08a5 : a0 02 __ LDY #$02
08a7 : 91 2f __ STA (SP + 0),y 
08a9 : a9 17 __ LDA #$17
08ab : c8 __ __ INY
08ac : 91 2f __ STA (SP + 0),y 
08ae : ad 7a 1c LDA $1c7a ; (tm + 0)
08b1 : c8 __ __ INY
08b2 : 91 2f __ STA (SP + 0),y 
08b4 : ad 7b 1c LDA $1c7b ; (tm + 1)
08b7 : c8 __ __ INY
08b8 : 91 2f __ STA (SP + 0),y 
08ba : 20 47 09 JSR $0947 ; (printf.s0 + 0)
08bd : a9 00 __ LDA #$00
08bf : 85 27 __ STA ACCU + 0 
08c1 : 85 28 __ STA ACCU + 1 
.s1001:
08c3 : 18 __ __ CLC
08c4 : a5 2f __ LDA SP + 0 
08c6 : 69 06 __ ADC #$06
08c8 : 85 2f __ STA SP + 0 
08ca : 90 02 __ BCC $08ce ; (main.s1001 + 11)
08cc : e6 30 __ INC SP + 1 
08ce : 60 __ __ RTS
--------------------------------------------------------------------
timer: ; timer()->void
.s0:
08cf : ee 7a 1c INC $1c7a ; (tm + 0)
08d2 : d0 03 __ BNE $08d7 ; (timer.s1003 + 0)
.s1002:
08d4 : ee 7b 1c INC $1c7b ; (tm + 1)
.s1003:
08d7 : 4c 31 ea JMP $ea31 
.s1001:
08da : 60 __ __ RTS
--------------------------------------------------------------------
draw: ; draw(const u8)->void
.s0:
08db : a9 00 __ LDA #$00
08dd : 85 27 __ STA ACCU + 0 
08df : a9 04 __ LDA #$04
08e1 : 85 28 __ STA ACCU + 1 
.l2:
08e3 : a5 27 __ LDA ACCU + 0 
08e5 : 85 33 __ STA T1 + 0 
08e7 : a5 28 __ LDA ACCU + 1 
08e9 : 85 34 __ STA T1 + 1 
08eb : a9 14 __ LDA #$14
08ed : 85 29 __ STA ACCU + 2 
.l6:
08ef : a5 33 __ LDA T1 + 0 
08f1 : 85 35 __ STA T2 + 0 
08f3 : a5 34 __ LDA T1 + 1 
08f5 : 85 36 __ STA T2 + 1 
08f7 : a9 00 __ LDA #$00
08f9 : 85 2a __ STA ACCU + 3 
08fb : a9 02 __ LDA #$02
08fd : 85 37 __ STA T6 + 0 
.l10:
08ff : a6 2a __ LDX ACCU + 3 
0901 : e8 __ __ INX
0902 : 86 2a __ STX ACCU + 3 
0904 : bd 7b 1c LDA $1c7b,x ; (tm + 1)
0907 : a0 00 __ LDY #$00
0909 : 91 35 __ STA (T2 + 0),y 
090b : bd 7c 1c LDA $1c7c,x ; (tile + 0)
090e : c8 __ __ INY
090f : 91 35 __ STA (T2 + 0),y 
0911 : e6 2a __ INC ACCU + 3 
0913 : 18 __ __ CLC
0914 : a5 35 __ LDA T2 + 0 
0916 : 69 28 __ ADC #$28
0918 : 85 35 __ STA T2 + 0 
091a : 90 02 __ BCC $091e ; (draw.s1005 + 0)
.s1004:
091c : e6 36 __ INC T2 + 1 
.s1005:
091e : c6 37 __ DEC T6 + 0 
0920 : d0 dd __ BNE $08ff ; (draw.l10 + 0)
.s12:
0922 : 18 __ __ CLC
0923 : a5 33 __ LDA T1 + 0 
0925 : 69 02 __ ADC #$02
0927 : 85 33 __ STA T1 + 0 
0929 : 90 02 __ BCC $092d ; (draw.s1007 + 0)
.s1006:
092b : e6 34 __ INC T1 + 1 
.s1007:
092d : c6 29 __ DEC ACCU + 2 
092f : d0 be __ BNE $08ef ; (draw.l6 + 0)
.s8:
0931 : 18 __ __ CLC
0932 : a5 27 __ LDA ACCU + 0 
0934 : 69 50 __ ADC #$50
0936 : 85 27 __ STA ACCU + 0 
0938 : 90 02 __ BCC $093c ; (draw.s1009 + 0)
.s1008:
093a : e6 28 __ INC ACCU + 1 
.s1009:
093c : c9 c0 __ CMP #$c0
093e : d0 a3 __ BNE $08e3 ; (draw.l2 + 0)
.s1002:
0940 : a5 28 __ LDA ACCU + 1 
0942 : c9 07 __ CMP #$07
0944 : d0 9d __ BNE $08e3 ; (draw.l2 + 0)
.s1001:
0946 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
0947 : 18 __ __ CLC
0948 : a5 2f __ LDA SP + 0 
094a : 69 04 __ ADC #$04
094c : 85 3b __ STA T2 + 0 
094e : a5 30 __ LDA SP + 1 
0950 : 69 00 __ ADC #$00
0952 : 85 3c __ STA T2 + 1 
0954 : a9 00 __ LDA #$00
0956 : 85 37 __ STA T1 + 0 
0958 : a0 02 __ LDY #$02
095a : b1 2f __ LDA (SP + 0),y 
095c : 85 3d __ STA T3 + 0 
095e : c8 __ __ INY
095f : b1 2f __ LDA (SP + 0),y 
0961 : 85 3e __ STA T3 + 1 
.l2:
0963 : a0 00 __ LDY #$00
0965 : b1 3d __ LDA (T3 + 0),y 
0967 : d0 44 __ BNE $09ad ; (printf.s3 + 0)
.s4:
0969 : a6 37 __ LDX T1 + 0 
096b : 9d ce 9f STA $9fce,x ; (buff + 0)
096e : 8a __ __ TXA
096f : f0 0e __ BEQ $097f ; (printf.s1001 + 0)
.s344:
0971 : a9 ce __ LDA #$ce
0973 : 85 33 __ STA T0 + 0 
0975 : a9 9f __ LDA #$9f
0977 : 85 34 __ STA T0 + 1 
.l345:
0979 : a0 00 __ LDY #$00
097b : b1 33 __ LDA (T0 + 0),y 
097d : d0 01 __ BNE $0980 ; (printf.s346 + 0)
.s1001:
097f : 60 __ __ RTS
.s346:
0980 : aa __ __ TAX
0981 : e6 33 __ INC T0 + 0 
0983 : d0 02 __ BNE $0987 ; (printf.s1345 + 0)
.s1344:
0985 : e6 34 __ INC T0 + 1 
.s1345:
0987 : 8a __ __ TXA
0988 : e0 0a __ CPX #$0a
098a : d0 08 __ BNE $0994 ; (printf.s350 + 0)
.s349:
098c : a9 0d __ LDA #$0d
.s1103:
098e : 20 d2 ff JSR $ffd2 
0991 : 4c 79 09 JMP $0979 ; (printf.l345 + 0)
.s350:
0994 : c9 09 __ CMP #$09
0996 : d0 f6 __ BNE $098e ; (printf.s1103 + 0)
.s351:
0998 : a5 d3 __ LDA $d3 
099a : 29 03 __ AND #$03
099c : 85 37 __ STA T1 + 0 
.l354:
099e : a9 20 __ LDA #$20
09a0 : 20 d2 ff JSR $ffd2 
09a3 : e6 37 __ INC T1 + 0 
09a5 : a5 37 __ LDA T1 + 0 
09a7 : c9 04 __ CMP #$04
09a9 : 90 f3 __ BCC $099e ; (printf.l354 + 0)
09ab : b0 cc __ BCS $0979 ; (printf.l345 + 0)
.s3:
09ad : aa __ __ TAX
09ae : e6 3d __ INC T3 + 0 
09b0 : d0 02 __ BNE $09b4 ; (printf.s1303 + 0)
.s1302:
09b2 : e6 3e __ INC T3 + 1 
.s1303:
09b4 : 8a __ __ TXA
09b5 : e0 25 __ CPX #$25
09b7 : f0 50 __ BEQ $0a09 ; (printf.s5 + 0)
.s6:
09b9 : a6 37 __ LDX T1 + 0 
09bb : e8 __ __ INX
09bc : 86 37 __ STX T1 + 0 
09be : 9d cd 9f STA $9fcd,x ; (si + 7)
09c1 : e0 28 __ CPX #$28
09c3 : 90 9e __ BCC $0963 ; (printf.l2 + 0)
.s324:
09c5 : 98 __ __ TYA
09c6 : 9d ce 9f STA $9fce,x ; (buff + 0)
09c9 : a9 ce __ LDA #$ce
09cb : 85 33 __ STA T0 + 0 
09cd : a9 9f __ LDA #$9f
09cf : 85 34 __ STA T0 + 1 
.l326:
09d1 : a0 00 __ LDY #$00
09d3 : b1 33 __ LDA (T0 + 0),y 
09d5 : d0 05 __ BNE $09dc ; (printf.s327 + 0)
.s1104:
09d7 : 85 37 __ STA T1 + 0 
09d9 : 4c 63 09 JMP $0963 ; (printf.l2 + 0)
.s327:
09dc : aa __ __ TAX
09dd : e6 33 __ INC T0 + 0 
09df : d0 02 __ BNE $09e3 ; (printf.s1343 + 0)
.s1342:
09e1 : e6 34 __ INC T0 + 1 
.s1343:
09e3 : 8a __ __ TXA
09e4 : e0 0a __ CPX #$0a
09e6 : d0 08 __ BNE $09f0 ; (printf.s331 + 0)
.s330:
09e8 : a9 0d __ LDA #$0d
.s1102:
09ea : 20 d2 ff JSR $ffd2 
09ed : 4c d1 09 JMP $09d1 ; (printf.l326 + 0)
.s331:
09f0 : c9 09 __ CMP #$09
09f2 : d0 f6 __ BNE $09ea ; (printf.s1102 + 0)
.s332:
09f4 : a5 d3 __ LDA $d3 
09f6 : 29 03 __ AND #$03
09f8 : 85 37 __ STA T1 + 0 
.l335:
09fa : a9 20 __ LDA #$20
09fc : 20 d2 ff JSR $ffd2 
09ff : e6 37 __ INC T1 + 0 
0a01 : a5 37 __ LDA T1 + 0 
0a03 : c9 04 __ CMP #$04
0a05 : 90 f3 __ BCC $09fa ; (printf.l335 + 0)
0a07 : b0 c8 __ BCS $09d1 ; (printf.l326 + 0)
.s5:
0a09 : a6 37 __ LDX T1 + 0 
0a0b : f0 17 __ BEQ $0a24 ; (printf.s8 + 0)
.s7:
0a0d : 98 __ __ TYA
0a0e : 9d ce 9f STA $9fce,x ; (buff + 0)
0a11 : a9 ce __ LDA #$ce
0a13 : 85 33 __ STA T0 + 0 
0a15 : a9 9f __ LDA #$9f
0a17 : 85 34 __ STA T0 + 1 
.l10:
0a19 : a0 00 __ LDY #$00
0a1b : b1 33 __ LDA (T0 + 0),y 
0a1d : f0 03 __ BEQ $0a22 ; (printf.s9 + 0)
0a1f : 4c 14 17 JMP $1714 ; (printf.s11 + 0)
.s9:
0a22 : 85 37 __ STA T1 + 0 
.s8:
0a24 : 8c c7 9f STY $9fc7 ; (si + 1)
0a27 : 8c ca 9f STY $9fca ; (si + 4)
0a2a : 8c cb 9f STY $9fcb ; (si + 5)
0a2d : 8c cc 9f STY $9fcc ; (si + 6)
0a30 : 8c cd 9f STY $9fcd ; (si + 7)
0a33 : a9 20 __ LDA #$20
0a35 : 8d c6 9f STA $9fc6 ; (si + 0)
0a38 : a9 ff __ LDA #$ff
0a3a : 8d c8 9f STA $9fc8 ; (si + 2)
0a3d : a9 0a __ LDA #$0a
0a3f : 8d c9 9f STA $9fc9 ; (si + 3)
.l1771:
0a42 : b1 3d __ LDA (T3 + 0),y 
0a44 : aa __ __ TAX
0a45 : e6 3d __ INC T3 + 0 
0a47 : d0 02 __ BNE $0a4b ; (printf.s1307 + 0)
.s1306:
0a49 : e6 3e __ INC T3 + 1 
.s1307:
0a4b : 8a __ __ TXA
0a4c : e0 2b __ CPX #$2b
0a4e : d0 07 __ BNE $0a57 ; (printf.s30 + 0)
.s29:
0a50 : a9 01 __ LDA #$01
0a52 : 8d cb 9f STA $9fcb ; (si + 5)
0a55 : d0 eb __ BNE $0a42 ; (printf.l1771 + 0)
.s30:
0a57 : c9 30 __ CMP #$30
0a59 : d0 06 __ BNE $0a61 ; (printf.s32 + 0)
.s31:
0a5b : 8d c6 9f STA $9fc6 ; (si + 0)
0a5e : 4c 42 0a JMP $0a42 ; (printf.l1771 + 0)
.s32:
0a61 : c9 23 __ CMP #$23
0a63 : d0 07 __ BNE $0a6c ; (printf.s34 + 0)
.s33:
0a65 : a9 01 __ LDA #$01
0a67 : 8d cd 9f STA $9fcd ; (si + 7)
0a6a : d0 d6 __ BNE $0a42 ; (printf.l1771 + 0)
.s34:
0a6c : c9 2d __ CMP #$2d
0a6e : d0 07 __ BNE $0a77 ; (printf.s28 + 0)
.s35:
0a70 : a9 01 __ LDA #$01
0a72 : 8d cc 9f STA $9fcc ; (si + 6)
0a75 : d0 cb __ BNE $0a42 ; (printf.l1771 + 0)
.s28:
0a77 : 85 43 __ STA T7 + 0 
0a79 : c9 30 __ CMP #$30
0a7b : 90 33 __ BCC $0ab0 ; (printf.s37 + 0)
.s38:
0a7d : c9 3a __ CMP #$3a
0a7f : b0 2f __ BCS $0ab0 ; (printf.s37 + 0)
.s36:
0a81 : a0 00 __ LDY #$00
0a83 : 84 33 __ STY T0 + 0 
0a85 : e0 3a __ CPX #$3a
0a87 : b0 22 __ BCS $0aab ; (printf.s40 + 0)
.l39:
0a89 : a5 33 __ LDA T0 + 0 
0a8b : 0a __ __ ASL
0a8c : 0a __ __ ASL
0a8d : 18 __ __ CLC
0a8e : 65 33 __ ADC T0 + 0 
0a90 : 0a __ __ ASL
0a91 : 18 __ __ CLC
0a92 : 65 43 __ ADC T7 + 0 
0a94 : 38 __ __ SEC
0a95 : e9 30 __ SBC #$30
0a97 : 85 33 __ STA T0 + 0 
0a99 : b1 3d __ LDA (T3 + 0),y 
0a9b : 85 43 __ STA T7 + 0 
0a9d : e6 3d __ INC T3 + 0 
0a9f : d0 02 __ BNE $0aa3 ; (printf.s1341 + 0)
.s1340:
0aa1 : e6 3e __ INC T3 + 1 
.s1341:
0aa3 : c9 30 __ CMP #$30
0aa5 : 90 04 __ BCC $0aab ; (printf.s40 + 0)
.s41:
0aa7 : c9 3a __ CMP #$3a
0aa9 : 90 de __ BCC $0a89 ; (printf.l39 + 0)
.s40:
0aab : a6 33 __ LDX T0 + 0 
0aad : 8e c7 9f STX $9fc7 ; (si + 1)
.s37:
0ab0 : c9 2e __ CMP #$2e
0ab2 : d0 2d __ BNE $0ae1 ; (printf.s43 + 0)
.s42:
0ab4 : a9 00 __ LDA #$00
0ab6 : f0 0e __ BEQ $0ac6 ; (printf.l1776 + 0)
.s44:
0ab8 : a5 33 __ LDA T0 + 0 
0aba : 0a __ __ ASL
0abb : 0a __ __ ASL
0abc : 18 __ __ CLC
0abd : 65 33 __ ADC T0 + 0 
0abf : 0a __ __ ASL
0ac0 : 18 __ __ CLC
0ac1 : 65 43 __ ADC T7 + 0 
0ac3 : 38 __ __ SEC
0ac4 : e9 30 __ SBC #$30
.l1776:
0ac6 : 85 33 __ STA T0 + 0 
0ac8 : a0 00 __ LDY #$00
0aca : b1 3d __ LDA (T3 + 0),y 
0acc : 85 43 __ STA T7 + 0 
0ace : e6 3d __ INC T3 + 0 
0ad0 : d0 02 __ BNE $0ad4 ; (printf.s1309 + 0)
.s1308:
0ad2 : e6 3e __ INC T3 + 1 
.s1309:
0ad4 : c9 30 __ CMP #$30
0ad6 : 90 04 __ BCC $0adc ; (printf.s45 + 0)
.s46:
0ad8 : c9 3a __ CMP #$3a
0ada : 90 dc __ BCC $0ab8 ; (printf.s44 + 0)
.s45:
0adc : a6 33 __ LDX T0 + 0 
0ade : 8e c8 9f STX $9fc8 ; (si + 2)
.s43:
0ae1 : c9 64 __ CMP #$64
0ae3 : d0 03 __ BNE $0ae8 ; (printf.s51 + 0)
0ae5 : 4c f7 15 JMP $15f7 ; (printf.s47 + 0)
.s51:
0ae8 : c9 44 __ CMP #$44
0aea : f0 f9 __ BEQ $0ae5 ; (printf.s43 + 4)
.s50:
0aec : c9 69 __ CMP #$69
0aee : f0 f5 __ BEQ $0ae5 ; (printf.s43 + 4)
.s49:
0af0 : c9 49 __ CMP #$49
0af2 : f0 f1 __ BEQ $0ae5 ; (printf.s43 + 4)
.s48:
0af4 : c9 75 __ CMP #$75
0af6 : d0 03 __ BNE $0afb ; (printf.s77 + 0)
0af8 : 4c fb 14 JMP $14fb ; (printf.s75 + 0)
.s77:
0afb : c9 55 __ CMP #$55
0afd : f0 f9 __ BEQ $0af8 ; (printf.s48 + 4)
.s76:
0aff : c9 78 __ CMP #$78
0b01 : d0 03 __ BNE $0b06 ; (printf.s103 + 0)
0b03 : 4c 17 14 JMP $1417 ; (printf.s101 + 0)
.s103:
0b06 : c9 58 __ CMP #$58
0b08 : f0 f9 __ BEQ $0b03 ; (printf.s76 + 4)
.s102:
0b0a : c9 6c __ CMP #$6c
0b0c : d0 03 __ BNE $0b11 ; (printf.s129 + 0)
0b0e : 4c 72 10 JMP $1072 ; (printf.s127 + 0)
.s129:
0b11 : c9 4c __ CMP #$4c
0b13 : f0 f9 __ BEQ $0b0e ; (printf.s102 + 4)
.s128:
0b15 : c9 66 __ CMP #$66
0b17 : d0 03 __ BNE $0b1c ; (printf.s213 + 0)
0b19 : 4c 4b 0c JMP $0c4b ; (printf.s207 + 0)
.s213:
0b1c : c9 67 __ CMP #$67
0b1e : f0 f9 __ BEQ $0b19 ; (printf.s128 + 4)
.s212:
0b20 : c9 65 __ CMP #$65
0b22 : f0 f5 __ BEQ $0b19 ; (printf.s128 + 4)
.s211:
0b24 : c9 46 __ CMP #$46
0b26 : f0 f1 __ BEQ $0b19 ; (printf.s128 + 4)
.s210:
0b28 : c9 47 __ CMP #$47
0b2a : f0 ed __ BEQ $0b19 ; (printf.s128 + 4)
.s209:
0b2c : c9 45 __ CMP #$45
0b2e : f0 e9 __ BEQ $0b19 ; (printf.s128 + 4)
.s208:
0b30 : c9 73 __ CMP #$73
0b32 : f0 35 __ BEQ $0b69 ; (printf.s269 + 0)
.s271:
0b34 : c9 53 __ CMP #$53
0b36 : f0 31 __ BEQ $0b69 ; (printf.s269 + 0)
.s270:
0b38 : c9 63 __ CMP #$63
0b3a : f0 14 __ BEQ $0b50 ; (printf.s320 + 0)
.s322:
0b3c : c9 43 __ CMP #$43
0b3e : f0 10 __ BEQ $0b50 ; (printf.s320 + 0)
.s321:
0b40 : aa __ __ TAX
0b41 : d0 03 __ BNE $0b46 ; (printf.s323 + 0)
0b43 : 4c 63 09 JMP $0963 ; (printf.l2 + 0)
.s323:
0b46 : a6 37 __ LDX T1 + 0 
0b48 : 9d ce 9f STA $9fce,x ; (buff + 0)
0b4b : e6 37 __ INC T1 + 0 
0b4d : 4c 63 09 JMP $0963 ; (printf.l2 + 0)
.s320:
0b50 : a0 00 __ LDY #$00
0b52 : b1 3b __ LDA (T2 + 0),y 
0b54 : a6 37 __ LDX T1 + 0 
0b56 : 9d ce 9f STA $9fce,x ; (buff + 0)
0b59 : e6 37 __ INC T1 + 0 
0b5b : a9 02 __ LDA #$02
.s1114:
0b5d : 18 __ __ CLC
0b5e : 65 3b __ ADC T2 + 0 
0b60 : 85 3b __ STA T2 + 0 
0b62 : 90 e9 __ BCC $0b4d ; (printf.s323 + 7)
.s1324:
0b64 : e6 3c __ INC T2 + 1 
0b66 : 4c 63 09 JMP $0963 ; (printf.l2 + 0)
.s269:
0b69 : a0 00 __ LDY #$00
0b6b : 84 40 __ STY T5 + 0 
0b6d : b1 3b __ LDA (T2 + 0),y 
0b6f : 85 33 __ STA T0 + 0 
0b71 : c8 __ __ INY
0b72 : b1 3b __ LDA (T2 + 0),y 
0b74 : 85 34 __ STA T0 + 1 
0b76 : 18 __ __ CLC
0b77 : a5 3b __ LDA T2 + 0 
0b79 : 69 02 __ ADC #$02
0b7b : 85 3b __ STA T2 + 0 
0b7d : 90 02 __ BCC $0b81 ; (printf.s1335 + 0)
.s1334:
0b7f : e6 3c __ INC T2 + 1 
.s1335:
0b81 : ad c7 9f LDA $9fc7 ; (si + 1)
0b84 : 85 42 __ STA T6 + 0 
0b86 : f0 0d __ BEQ $0b95 ; (printf.s272 + 0)
.s1224:
0b88 : a0 00 __ LDY #$00
0b8a : b1 33 __ LDA (T0 + 0),y 
0b8c : f0 05 __ BEQ $0b93 ; (printf.s1225 + 0)
.l274:
0b8e : c8 __ __ INY
0b8f : b1 33 __ LDA (T0 + 0),y 
0b91 : d0 fb __ BNE $0b8e ; (printf.l274 + 0)
.s1225:
0b93 : 84 40 __ STY T5 + 0 
.s272:
0b95 : ad cc 9f LDA $9fcc ; (si + 6)
0b98 : 85 43 __ STA T7 + 0 
0b9a : d0 18 __ BNE $0bb4 ; (printf.s275 + 0)
.s276:
0b9c : a4 40 __ LDY T5 + 0 
0b9e : c4 42 __ CPY T6 + 0 
0ba0 : b0 12 __ BCS $0bb4 ; (printf.s275 + 0)
.s564:
0ba2 : ad c6 9f LDA $9fc6 ; (si + 0)
0ba5 : a6 37 __ LDX T1 + 0 
.l1097:
0ba7 : 9d ce 9f STA $9fce,x ; (buff + 0)
0baa : e8 __ __ INX
0bab : c8 __ __ INY
0bac : c4 42 __ CPY T6 + 0 
0bae : 90 f7 __ BCC $0ba7 ; (printf.l1097 + 0)
.s1094:
0bb0 : 86 37 __ STX T1 + 0 
0bb2 : 84 40 __ STY T5 + 0 
.s275:
0bb4 : a6 37 __ LDX T1 + 0 
0bb6 : f0 15 __ BEQ $0bcd ; (printf.l300 + 0)
.s279:
0bb8 : a9 00 __ LDA #$00
0bba : 9d ce 9f STA $9fce,x ; (buff + 0)
0bbd : a9 ce __ LDA #$ce
0bbf : 85 37 __ STA T1 + 0 
0bc1 : a9 9f __ LDA #$9f
0bc3 : 85 38 __ STA T1 + 1 
.l282:
0bc5 : a0 00 __ LDY #$00
0bc7 : b1 37 __ LDA (T1 + 0),y 
0bc9 : d0 52 __ BNE $0c1d ; (printf.s283 + 0)
.s281:
0bcb : 85 37 __ STA T1 + 0 
.l300:
0bcd : a0 00 __ LDY #$00
0bcf : b1 33 __ LDA (T0 + 0),y 
0bd1 : d0 1d __ BNE $0bf0 ; (printf.s301 + 0)
.s278:
0bd3 : a5 43 __ LDA T7 + 0 
0bd5 : f0 8f __ BEQ $0b66 ; (printf.s1324 + 2)
.s318:
0bd7 : a4 40 __ LDY T5 + 0 
0bd9 : c4 42 __ CPY T6 + 0 
0bdb : b0 89 __ BCS $0b66 ; (printf.s1324 + 2)
.s561:
0bdd : ad c6 9f LDA $9fc6 ; (si + 0)
0be0 : a6 37 __ LDX T1 + 0 
.l1095:
0be2 : 9d ce 9f STA $9fce,x ; (buff + 0)
0be5 : e8 __ __ INX
0be6 : c8 __ __ INY
0be7 : c4 42 __ CPY T6 + 0 
0be9 : 90 f7 __ BCC $0be2 ; (printf.l1095 + 0)
.s1092:
0beb : 86 37 __ STX T1 + 0 
0bed : 4c 63 09 JMP $0963 ; (printf.l2 + 0)
.s301:
0bf0 : aa __ __ TAX
0bf1 : e6 33 __ INC T0 + 0 
0bf3 : d0 02 __ BNE $0bf7 ; (printf.s1339 + 0)
.s1338:
0bf5 : e6 34 __ INC T0 + 1 
.s1339:
0bf7 : 8a __ __ TXA
0bf8 : e0 0a __ CPX #$0a
0bfa : d0 08 __ BNE $0c04 ; (printf.s305 + 0)
.s304:
0bfc : a9 0d __ LDA #$0d
.s1101:
0bfe : 20 d2 ff JSR $ffd2 
0c01 : 4c cd 0b JMP $0bcd ; (printf.l300 + 0)
.s305:
0c04 : c9 09 __ CMP #$09
0c06 : d0 f6 __ BNE $0bfe ; (printf.s1101 + 0)
.s306:
0c08 : a5 d3 __ LDA $d3 
0c0a : 29 03 __ AND #$03
0c0c : 85 3f __ STA T4 + 0 
.l309:
0c0e : a9 20 __ LDA #$20
0c10 : 20 d2 ff JSR $ffd2 
0c13 : e6 3f __ INC T4 + 0 
0c15 : a5 3f __ LDA T4 + 0 
0c17 : c9 04 __ CMP #$04
0c19 : 90 f3 __ BCC $0c0e ; (printf.l309 + 0)
0c1b : b0 b0 __ BCS $0bcd ; (printf.l300 + 0)
.s283:
0c1d : aa __ __ TAX
0c1e : e6 37 __ INC T1 + 0 
0c20 : d0 02 __ BNE $0c24 ; (printf.s1337 + 0)
.s1336:
0c22 : e6 38 __ INC T1 + 1 
.s1337:
0c24 : 8a __ __ TXA
0c25 : e0 0a __ CPX #$0a
0c27 : d0 08 __ BNE $0c31 ; (printf.s287 + 0)
.s286:
0c29 : a9 0d __ LDA #$0d
.s1100:
0c2b : 20 d2 ff JSR $ffd2 
0c2e : 4c c5 0b JMP $0bc5 ; (printf.l282 + 0)
.s287:
0c31 : c9 09 __ CMP #$09
0c33 : d0 f6 __ BNE $0c2b ; (printf.s1100 + 0)
.s288:
0c35 : a5 d3 __ LDA $d3 
0c37 : 29 03 __ AND #$03
0c39 : 85 3f __ STA T4 + 0 
.l291:
0c3b : a9 20 __ LDA #$20
0c3d : 20 d2 ff JSR $ffd2 
0c40 : e6 3f __ INC T4 + 0 
0c42 : a5 3f __ LDA T4 + 0 
0c44 : c9 04 __ CMP #$04
0c46 : 90 f3 __ BCC $0c3b ; (printf.l291 + 0)
0c48 : 4c c5 0b JMP $0bc5 ; (printf.l282 + 0)
.s207:
0c4b : a0 00 __ LDY #$00
0c4d : b1 3b __ LDA (T2 + 0),y 
0c4f : 85 33 __ STA T0 + 0 
0c51 : c8 __ __ INY
0c52 : b1 3b __ LDA (T2 + 0),y 
0c54 : 85 34 __ STA T0 + 1 
0c56 : c8 __ __ INY
0c57 : b1 3b __ LDA (T2 + 0),y 
0c59 : 85 35 __ STA T0 + 2 
0c5b : c8 __ __ INY
0c5c : b1 3b __ LDA (T2 + 0),y 
0c5e : 85 36 __ STA T0 + 3 
0c60 : 29 7f __ AND #$7f
0c62 : 05 35 __ ORA T0 + 2 
0c64 : 05 34 __ ORA T0 + 1 
0c66 : 05 33 __ ORA T0 + 0 
0c68 : f0 13 __ BEQ $0c7d ; (printf.s216 + 0)
.s1050:
0c6a : 24 36 __ BIT T0 + 3 
0c6c : 10 0f __ BPL $0c7d ; (printf.s216 + 0)
.s215:
0c6e : a5 36 __ LDA T0 + 3 
0c70 : 49 80 __ EOR #$80
0c72 : 85 36 __ STA T0 + 3 
0c74 : a9 2d __ LDA #$2d
.s1912:
0c76 : 8d ce 9f STA $9fce ; (buff + 0)
0c79 : a9 01 __ LDA #$01
0c7b : d0 09 __ BNE $0c86 ; (printf.s217 + 0)
.s216:
0c7d : ad cb 9f LDA $9fcb ; (si + 5)
0c80 : f0 04 __ BEQ $0c86 ; (printf.s217 + 0)
.s218:
0c82 : a9 2b __ LDA #$2b
0c84 : d0 f0 __ BNE $0c76 ; (printf.s1912 + 0)
.s217:
0c86 : 85 45 __ STA T9 + 0 
0c88 : a5 35 __ LDA T0 + 2 
0c8a : 0a __ __ ASL
0c8b : a5 35 __ LDA T0 + 2 
0c8d : 29 7f __ AND #$7f
0c8f : 2a __ __ ROL
0c90 : c9 ff __ CMP #$ff
0c92 : d0 18 __ BNE $0cac ; (printf.s220 + 0)
.s219:
0c94 : a9 49 __ LDA #$49
0c96 : a6 45 __ LDX T9 + 0 
0c98 : 9d ce 9f STA $9fce,x ; (buff + 0)
0c9b : a9 4e __ LDA #$4e
0c9d : 9d cf 9f STA $9fcf,x ; (buff + 1)
0ca0 : a9 46 __ LDA #$46
0ca2 : 9d d0 9f STA $9fd0,x ; (buff + 2)
0ca5 : 8a __ __ TXA
0ca6 : 18 __ __ CLC
0ca7 : 69 03 __ ADC #$03
0ca9 : 4c bb 0e JMP $0ebb ; (printf.s1113 + 0)
.s220:
0cac : ad c8 9f LDA $9fc8 ; (si + 2)
0caf : c9 ff __ CMP #$ff
0cb1 : d0 02 __ BNE $0cb5 ; (printf.s934 + 0)
.s935:
0cb3 : a9 06 __ LDA #$06
.s934:
0cb5 : 85 3f __ STA T4 + 0 
0cb7 : 85 44 __ STA T8 + 0 
0cb9 : a9 00 __ LDA #$00
0cbb : 85 40 __ STA T5 + 0 
0cbd : 85 41 __ STA T5 + 1 
0cbf : a5 36 __ LDA T0 + 3 
0cc1 : 29 7f __ AND #$7f
0cc3 : 05 35 __ ORA T0 + 2 
0cc5 : 05 34 __ ORA T0 + 1 
0cc7 : 05 33 __ ORA T0 + 0 
0cc9 : f0 03 __ BEQ $0cce ; (printf.s222 + 0)
0ccb : 4c 8c 0f JMP $0f8c ; (printf.s223 + 0)
.s222:
0cce : a5 43 __ LDA T7 + 0 
0cd0 : c9 65 __ CMP #$65
0cd2 : d0 04 __ BNE $0cd8 ; (printf.s1003 + 0)
.s1002:
0cd4 : a9 01 __ LDA #$01
0cd6 : d0 02 __ BNE $0cda ; (printf.s1004 + 0)
.s1003:
0cd8 : a9 00 __ LDA #$00
.s1004:
0cda : 85 46 __ STA T10 + 0 
0cdc : a6 3f __ LDX T4 + 0 
0cde : e8 __ __ INX
0cdf : 86 42 __ STX T6 + 0 
0ce1 : a5 43 __ LDA T7 + 0 
0ce3 : c9 67 __ CMP #$67
0ce5 : d0 13 __ BNE $0cfa ; (printf.s230 + 0)
.s229:
0ce7 : a5 41 __ LDA T5 + 1 
0ce9 : 30 08 __ BMI $0cf3 ; (printf.s231 + 0)
.s1025:
0ceb : d0 06 __ BNE $0cf3 ; (printf.s231 + 0)
.s1024:
0ced : a5 40 __ LDA T5 + 0 
0cef : c9 04 __ CMP #$04
0cf1 : 90 07 __ BCC $0cfa ; (printf.s230 + 0)
.s231:
0cf3 : a9 01 __ LDA #$01
0cf5 : 85 46 __ STA T10 + 0 
0cf7 : 4c 28 0f JMP $0f28 ; (printf.s233 + 0)
.s230:
0cfa : a5 46 __ LDA T10 + 0 
0cfc : d0 f9 __ BNE $0cf7 ; (printf.s231 + 4)
.s235:
0cfe : 24 41 __ BIT T5 + 1 
0d00 : 10 3b __ BPL $0d3d ; (printf.s237 + 0)
.s236:
0d02 : a5 33 __ LDA T0 + 0 
0d04 : 85 27 __ STA ACCU + 0 
0d06 : a5 34 __ LDA T0 + 1 
0d08 : 85 28 __ STA ACCU + 1 
0d0a : a5 35 __ LDA T0 + 2 
0d0c : 85 29 __ STA ACCU + 2 
0d0e : a5 36 __ LDA T0 + 3 
0d10 : 85 2a __ STA ACCU + 3 
.l1300:
0d12 : a9 00 __ LDA #$00
0d14 : 85 03 __ STA WORK + 0 
0d16 : 85 04 __ STA WORK + 1 
0d18 : 20 5b 1c JSR $1c5b ; (freg@proxy + 0)
0d1b : 20 46 19 JSR $1946 ; (crt_fdiv + 0)
0d1e : 18 __ __ CLC
0d1f : a5 40 __ LDA T5 + 0 
0d21 : 69 01 __ ADC #$01
0d23 : 85 40 __ STA T5 + 0 
0d25 : a5 41 __ LDA T5 + 1 
0d27 : 69 00 __ ADC #$00
0d29 : 85 41 __ STA T5 + 1 
0d2b : 30 e5 __ BMI $0d12 ; (printf.l1300 + 0)
.s1301:
0d2d : a5 2a __ LDA ACCU + 3 
0d2f : 85 36 __ STA T0 + 3 
0d31 : a5 29 __ LDA ACCU + 2 
0d33 : 85 35 __ STA T0 + 2 
0d35 : a5 28 __ LDA ACCU + 1 
0d37 : 85 34 __ STA T0 + 1 
0d39 : a5 27 __ LDA ACCU + 0 
0d3b : 85 33 __ STA T0 + 0 
.s237:
0d3d : 18 __ __ CLC
0d3e : a5 3f __ LDA T4 + 0 
0d40 : 65 40 __ ADC T5 + 0 
0d42 : 18 __ __ CLC
0d43 : 69 01 __ ADC #$01
0d45 : 85 42 __ STA T6 + 0 
0d47 : c9 07 __ CMP #$07
0d49 : 90 14 __ BCC $0d5f ; (printf.s238 + 0)
.s239:
0d4b : ad 98 1c LDA $1c98 ; (fround5 + 24)
0d4e : 85 37 __ STA T1 + 0 
0d50 : ad 99 1c LDA $1c99 ; (fround5 + 25)
0d53 : 85 38 __ STA T1 + 1 
0d55 : ad 9a 1c LDA $1c9a ; (fround5 + 26)
0d58 : 85 39 __ STA T1 + 2 
0d5a : ad 9b 1c LDA $1c9b ; (fround5 + 27)
0d5d : b0 15 __ BCS $0d74 ; (printf.s1889 + 0)
.s238:
0d5f : 0a __ __ ASL
0d60 : 0a __ __ ASL
0d61 : aa __ __ TAX
0d62 : bd 7c 1c LDA $1c7c,x ; (tile + 0)
0d65 : 85 37 __ STA T1 + 0 
0d67 : bd 7d 1c LDA $1c7d,x ; (tile + 1)
0d6a : 85 38 __ STA T1 + 1 
0d6c : bd 7e 1c LDA $1c7e,x ; (tile + 2)
0d6f : 85 39 __ STA T1 + 2 
0d71 : bd 7f 1c LDA $1c7f,x ; (tile + 3)
.s1889:
0d74 : 85 3a __ STA T1 + 3 
0d76 : a2 37 __ LDX #$37
0d78 : 20 66 1c JSR $1c66 ; (freg@proxy + 0)
0d7b : 20 97 17 JSR $1797 ; (faddsub + 6)
0d7e : a5 27 __ LDA ACCU + 0 
0d80 : 85 33 __ STA T0 + 0 
0d82 : a5 28 __ LDA ACCU + 1 
0d84 : 85 34 __ STA T0 + 1 
0d86 : a6 29 __ LDX ACCU + 2 
0d88 : 86 35 __ STX T0 + 2 
0d8a : a5 2a __ LDA ACCU + 3 
0d8c : 85 36 __ STA T0 + 3 
0d8e : 30 2b __ BMI $0dbb ; (printf.s234 + 0)
.s1011:
0d90 : c9 41 __ CMP #$41
0d92 : d0 04 __ BNE $0d98 ; (printf.s1015 + 0)
.s1012:
0d94 : e0 20 __ CPX #$20
0d96 : f0 02 __ BEQ $0d9a ; (printf.s240 + 0)
.s1015:
0d98 : 90 21 __ BCC $0dbb ; (printf.s234 + 0)
.s240:
0d9a : a6 3f __ LDX T4 + 0 
0d9c : ca __ __ DEX
0d9d : 86 44 __ STX T8 + 0 
.s1913:
0d9f : a9 00 __ LDA #$00
0da1 : 85 03 __ STA WORK + 0 
0da3 : 85 04 __ STA WORK + 1 
0da5 : 20 5b 1c JSR $1c5b ; (freg@proxy + 0)
0da8 : 20 46 19 JSR $1946 ; (crt_fdiv + 0)
0dab : a5 27 __ LDA ACCU + 0 
0dad : 85 33 __ STA T0 + 0 
0daf : a5 28 __ LDA ACCU + 1 
0db1 : 85 34 __ STA T0 + 1 
0db3 : a5 29 __ LDA ACCU + 2 
0db5 : 85 35 __ STA T0 + 2 
0db7 : a5 2a __ LDA ACCU + 3 
0db9 : 85 36 __ STA T0 + 3 
.s234:
0dbb : 38 __ __ SEC
0dbc : a5 42 __ LDA T6 + 0 
0dbe : e5 44 __ SBC T8 + 0 
0dc0 : 85 3f __ STA T4 + 0 
0dc2 : a9 14 __ LDA #$14
0dc4 : c5 42 __ CMP T6 + 0 
0dc6 : b0 02 __ BCS $0dca ; (printf.s245 + 0)
.s244:
0dc8 : 85 42 __ STA T6 + 0 
.s245:
0dca : a5 3f __ LDA T4 + 0 
0dcc : d0 09 __ BNE $0dd7 ; (printf.s1914 + 0)
.s246:
0dce : a9 30 __ LDA #$30
0dd0 : a6 45 __ LDX T9 + 0 
0dd2 : 9d ce 9f STA $9fce,x ; (buff + 0)
0dd5 : e6 45 __ INC T9 + 0 
.s1914:
0dd7 : a9 00 __ LDA #$00
0dd9 : 85 47 __ STA T11 + 0 
0ddb : c5 3f __ CMP T4 + 0 
0ddd : f0 65 __ BEQ $0e44 ; (printf.l250 + 0)
.s251:
0ddf : c9 07 __ CMP #$07
0de1 : 90 09 __ BCC $0dec ; (printf.s253 + 0)
.l252:
0de3 : a9 30 __ LDA #$30
0de5 : a6 45 __ LDX T9 + 0 
0de7 : 9d ce 9f STA $9fce,x ; (buff + 0)
0dea : b0 4a __ BCS $0e36 ; (printf.l1319 + 0)
.s253:
0dec : a5 33 __ LDA T0 + 0 
0dee : 85 27 __ STA ACCU + 0 
0df0 : a5 34 __ LDA T0 + 1 
0df2 : 85 28 __ STA ACCU + 1 
0df4 : a5 35 __ LDA T0 + 2 
0df6 : 85 29 __ STA ACCU + 2 
0df8 : a5 36 __ LDA T0 + 3 
0dfa : 85 2a __ STA ACCU + 3 
0dfc : 20 e1 1a JSR $1ae1 ; (f32_to_i16 + 0)
0dff : 18 __ __ CLC
0e00 : a5 27 __ LDA ACCU + 0 
0e02 : 69 30 __ ADC #$30
0e04 : a6 45 __ LDX T9 + 0 
0e06 : 9d ce 9f STA $9fce,x ; (buff + 0)
0e09 : 20 2f 1b JSR $1b2f ; (sint16_to_float + 0)
0e0c : a2 33 __ LDX #$33
0e0e : 20 50 17 JSR $1750 ; (freg + 4)
0e11 : a5 2a __ LDA ACCU + 3 
0e13 : 49 80 __ EOR #$80
0e15 : 85 2a __ STA ACCU + 3 
0e17 : 20 97 17 JSR $1797 ; (faddsub + 6)
0e1a : a9 00 __ LDA #$00
0e1c : 85 03 __ STA WORK + 0 
0e1e : 85 04 __ STA WORK + 1 
0e20 : 20 5b 1c JSR $1c5b ; (freg@proxy + 0)
0e23 : 20 7e 18 JSR $187e ; (crt_fmul + 0)
0e26 : a5 27 __ LDA ACCU + 0 
0e28 : 85 33 __ STA T0 + 0 
0e2a : a5 28 __ LDA ACCU + 1 
0e2c : 85 34 __ STA T0 + 1 
0e2e : a5 29 __ LDA ACCU + 2 
0e30 : 85 35 __ STA T0 + 2 
0e32 : a5 2a __ LDA ACCU + 3 
0e34 : 85 36 __ STA T0 + 3 
.l1319:
0e36 : e6 45 __ INC T9 + 0 
0e38 : e6 47 __ INC T11 + 0 
0e3a : a5 47 __ LDA T11 + 0 
0e3c : c5 42 __ CMP T6 + 0 
0e3e : b0 15 __ BCS $0e55 ; (printf.s249 + 0)
.s248:
0e40 : c5 3f __ CMP T4 + 0 
0e42 : d0 9b __ BNE $0ddf ; (printf.s251 + 0)
.l250:
0e44 : a9 2e __ LDA #$2e
0e46 : a6 45 __ LDX T9 + 0 
0e48 : 9d ce 9f STA $9fce,x ; (buff + 0)
0e4b : e6 45 __ INC T9 + 0 
0e4d : a5 47 __ LDA T11 + 0 
0e4f : c9 07 __ CMP #$07
0e51 : 90 99 __ BCC $0dec ; (printf.s253 + 0)
0e53 : b0 8e __ BCS $0de3 ; (printf.l252 + 0)
.s249:
0e55 : a5 46 __ LDA T10 + 0 
0e57 : f0 64 __ BEQ $0ebd ; (printf.s221 + 0)
.s254:
0e59 : a9 45 __ LDA #$45
0e5b : a6 45 __ LDX T9 + 0 
0e5d : 9d ce 9f STA $9fce,x ; (buff + 0)
0e60 : 24 41 __ BIT T5 + 1 
0e62 : 30 07 __ BMI $0e6b ; (printf.s255 + 0)
.s256:
0e64 : a9 2b __ LDA #$2b
0e66 : 9d cf 9f STA $9fcf,x ; (buff + 1)
0e69 : b0 12 __ BCS $0e7d ; (printf.s257 + 0)
.s255:
0e6b : a9 2d __ LDA #$2d
0e6d : 9d cf 9f STA $9fcf,x ; (buff + 1)
0e70 : 38 __ __ SEC
0e71 : a9 00 __ LDA #$00
0e73 : e5 40 __ SBC T5 + 0 
0e75 : 85 40 __ STA T5 + 0 
0e77 : a9 00 __ LDA #$00
0e79 : e5 41 __ SBC T5 + 1 
0e7b : 85 41 __ STA T5 + 1 
.s257:
0e7d : a5 40 __ LDA T5 + 0 
0e7f : 85 27 __ STA ACCU + 0 
0e81 : a5 41 __ LDA T5 + 1 
0e83 : 85 28 __ STA ACCU + 1 
0e85 : a9 0a __ LDA #$0a
0e87 : 85 03 __ STA WORK + 0 
0e89 : a9 00 __ LDA #$00
0e8b : 85 04 __ STA WORK + 1 
0e8d : 20 f4 19 JSR $19f4 ; (divs16 + 0)
0e90 : 18 __ __ CLC
0e91 : a5 27 __ LDA ACCU + 0 
0e93 : 69 30 __ ADC #$30
0e95 : a6 45 __ LDX T9 + 0 
0e97 : 9d d0 9f STA $9fd0,x ; (buff + 2)
0e9a : a5 40 __ LDA T5 + 0 
0e9c : 85 27 __ STA ACCU + 0 
0e9e : a5 41 __ LDA T5 + 1 
0ea0 : 85 28 __ STA ACCU + 1 
0ea2 : a9 0a __ LDA #$0a
0ea4 : 85 03 __ STA WORK + 0 
0ea6 : a9 00 __ LDA #$00
0ea8 : 85 04 __ STA WORK + 1 
0eaa : 20 b8 1a JSR $1ab8 ; (mods16 + 0)
0ead : 18 __ __ CLC
0eae : a5 05 __ LDA WORK + 2 
0eb0 : 69 30 __ ADC #$30
0eb2 : a6 45 __ LDX T9 + 0 
0eb4 : 9d d1 9f STA $9fd1,x ; (buff + 3)
0eb7 : 8a __ __ TXA
0eb8 : 18 __ __ CLC
0eb9 : 69 04 __ ADC #$04
.s1113:
0ebb : 85 45 __ STA T9 + 0 
.s221:
0ebd : ad c7 9f LDA $9fc7 ; (si + 1)
0ec0 : 85 42 __ STA T6 + 0 
0ec2 : a5 45 __ LDA T9 + 0 
0ec4 : 85 37 __ STA T1 + 0 
0ec6 : c5 42 __ CMP T6 + 0 
0ec8 : b0 4b __ BCS $0f15 ; (printf.s214 + 0)
.s258:
0eca : ad cc 9f LDA $9fcc ; (si + 6)
0ecd : d0 4b __ BNE $0f1a ; (printf.s264 + 0)
.s261:
0ecf : a9 01 __ LDA #$01
0ed1 : 85 43 __ STA T7 + 0 
0ed3 : 85 3f __ STA T4 + 0 
0ed5 : a5 45 __ LDA T9 + 0 
0ed7 : 38 __ __ SEC
.l1280:
0ed8 : e5 3f __ SBC T4 + 0 
0eda : aa __ __ TAX
0edb : 38 __ __ SEC
0edc : a5 42 __ LDA T6 + 0 
0ede : e5 3f __ SBC T4 + 0 
0ee0 : a8 __ __ TAY
0ee1 : bd ce 9f LDA $9fce,x ; (buff + 0)
0ee4 : 99 ce 9f STA $9fce,y ; (buff + 0)
0ee7 : e6 3f __ INC T4 + 0 
0ee9 : e6 43 __ INC T7 + 0 
0eeb : a5 45 __ LDA T9 + 0 
0eed : c5 43 __ CMP T7 + 0 
0eef : b0 e7 __ BCS $0ed8 ; (printf.l1280 + 0)
.s266:
0ef1 : 38 __ __ SEC
0ef2 : a5 42 __ LDA T6 + 0 
0ef4 : e5 45 __ SBC T9 + 0 
0ef6 : 85 33 __ STA T0 + 0 
0ef8 : a9 00 __ LDA #$00
0efa : e9 00 __ SBC #$00
0efc : a8 __ __ TAY
0efd : a2 00 __ LDX #$00
0eff : 98 __ __ TYA
0f00 : d0 04 __ BNE $0f06 ; (printf.l268 + 0)
.s1005:
0f02 : e4 33 __ CPX T0 + 0 
0f04 : b0 0b __ BCS $0f11 ; (printf.s262 + 0)
.l268:
0f06 : a9 20 __ LDA #$20
0f08 : 9d ce 9f STA $9fce,x ; (buff + 0)
0f0b : e8 __ __ INX
0f0c : 98 __ __ TYA
0f0d : d0 f7 __ BNE $0f06 ; (printf.l268 + 0)
0f0f : f0 f1 __ BEQ $0f02 ; (printf.s1005 + 0)
.s262:
0f11 : a5 42 __ LDA T6 + 0 
0f13 : 85 37 __ STA T1 + 0 
.s214:
0f15 : a9 04 __ LDA #$04
0f17 : 4c 5d 0b JMP $0b5d ; (printf.s1114 + 0)
.s264:
0f1a : a9 20 __ LDA #$20
0f1c : a6 45 __ LDX T9 + 0 
.l1089:
0f1e : 9d ce 9f STA $9fce,x ; (buff + 0)
0f21 : e8 __ __ INX
0f22 : e4 42 __ CPX T6 + 0 
0f24 : 90 f8 __ BCC $0f1e ; (printf.l1089 + 0)
0f26 : b0 e9 __ BCS $0f11 ; (printf.s262 + 0)
.s233:
0f28 : a5 42 __ LDA T6 + 0 
0f2a : c9 07 __ CMP #$07
0f2c : 90 14 __ BCC $0f42 ; (printf.s241 + 0)
.s242:
0f2e : ad 98 1c LDA $1c98 ; (fround5 + 24)
0f31 : 85 37 __ STA T1 + 0 
0f33 : ad 99 1c LDA $1c99 ; (fround5 + 25)
0f36 : 85 38 __ STA T1 + 1 
0f38 : ad 9a 1c LDA $1c9a ; (fround5 + 26)
0f3b : 85 39 __ STA T1 + 2 
0f3d : ad 9b 1c LDA $1c9b ; (fround5 + 27)
0f40 : b0 15 __ BCS $0f57 ; (printf.s1880 + 0)
.s241:
0f42 : 0a __ __ ASL
0f43 : 0a __ __ ASL
0f44 : aa __ __ TAX
0f45 : bd 7c 1c LDA $1c7c,x ; (tile + 0)
0f48 : 85 37 __ STA T1 + 0 
0f4a : bd 7d 1c LDA $1c7d,x ; (tile + 1)
0f4d : 85 38 __ STA T1 + 1 
0f4f : bd 7e 1c LDA $1c7e,x ; (tile + 2)
0f52 : 85 39 __ STA T1 + 2 
0f54 : bd 7f 1c LDA $1c7f,x ; (tile + 3)
.s1880:
0f57 : 85 3a __ STA T1 + 3 
0f59 : a2 37 __ LDX #$37
0f5b : 20 66 1c JSR $1c66 ; (freg@proxy + 0)
0f5e : 20 97 17 JSR $1797 ; (faddsub + 6)
0f61 : a5 27 __ LDA ACCU + 0 
0f63 : 85 33 __ STA T0 + 0 
0f65 : a5 28 __ LDA ACCU + 1 
0f67 : 85 34 __ STA T0 + 1 
0f69 : a6 29 __ LDX ACCU + 2 
0f6b : 86 35 __ STX T0 + 2 
0f6d : a5 2a __ LDA ACCU + 3 
0f6f : 85 36 __ STA T0 + 3 
0f71 : 10 03 __ BPL $0f76 ; (printf.s1019 + 0)
0f73 : 4c bb 0d JMP $0dbb ; (printf.s234 + 0)
.s1019:
0f76 : c9 41 __ CMP #$41
0f78 : d0 04 __ BNE $0f7e ; (printf.s1023 + 0)
.s1020:
0f7a : e0 20 __ CPX #$20
0f7c : f0 02 __ BEQ $0f80 ; (printf.s243 + 0)
.s1023:
0f7e : 90 f3 __ BCC $0f73 ; (printf.s1880 + 28)
.s243:
0f80 : e6 40 __ INC T5 + 0 
0f82 : f0 03 __ BEQ $0f87 ; (printf.s1330 + 0)
0f84 : 4c 9f 0d JMP $0d9f ; (printf.s1913 + 0)
.s1330:
0f87 : e6 41 __ INC T5 + 1 
0f89 : 4c 9f 0d JMP $0d9f ; (printf.s1913 + 0)
.s223:
0f8c : a5 36 __ LDA T0 + 3 
0f8e : 30 6a __ BMI $0ffa ; (printf.l226 + 0)
.l1045:
0f90 : c9 44 __ CMP #$44
0f92 : d0 09 __ BNE $0f9d ; (printf.s1049 + 0)
.s1046:
0f94 : a5 35 __ LDA T0 + 2 
0f96 : c9 7a __ CMP #$7a
0f98 : d0 03 __ BNE $0f9d ; (printf.s1049 + 0)
0f9a : 4c 2e 10 JMP $102e ; (printf.s224 + 0)
.s1049:
0f9d : b0 fb __ BCS $0f9a ; (printf.s1046 + 6)
.s225:
0f9f : a5 36 __ LDA T0 + 3 
0fa1 : 30 57 __ BMI $0ffa ; (printf.l226 + 0)
.s1037:
0fa3 : c9 3f __ CMP #$3f
0fa5 : d0 06 __ BNE $0fad ; (printf.s1041 + 0)
.s1038:
0fa7 : a5 35 __ LDA T0 + 2 
0fa9 : c9 80 __ CMP #$80
0fab : f0 02 __ BEQ $0faf ; (printf.s227 + 0)
.s1041:
0fad : 90 4b __ BCC $0ffa ; (printf.l226 + 0)
.s227:
0faf : a5 36 __ LDA T0 + 3 
0fb1 : c9 41 __ CMP #$41
0fb3 : d0 06 __ BNE $0fbb ; (printf.l1033 + 0)
.s1030:
0fb5 : a5 35 __ LDA T0 + 2 
0fb7 : c9 20 __ CMP #$20
0fb9 : f0 05 __ BEQ $0fc0 ; (printf.l228 + 0)
.l1033:
0fbb : b0 03 __ BCS $0fc0 ; (printf.l228 + 0)
0fbd : 4c ce 0c JMP $0cce ; (printf.s222 + 0)
.l228:
0fc0 : e6 40 __ INC T5 + 0 
0fc2 : d0 02 __ BNE $0fc6 ; (printf.s1329 + 0)
.s1328:
0fc4 : e6 41 __ INC T5 + 1 
.s1329:
0fc6 : a5 33 __ LDA T0 + 0 
0fc8 : 85 27 __ STA ACCU + 0 
0fca : a5 34 __ LDA T0 + 1 
0fcc : 85 28 __ STA ACCU + 1 
0fce : a5 35 __ LDA T0 + 2 
0fd0 : 85 29 __ STA ACCU + 2 
0fd2 : a5 36 __ LDA T0 + 3 
0fd4 : 85 2a __ STA ACCU + 3 
0fd6 : a9 00 __ LDA #$00
0fd8 : 85 03 __ STA WORK + 0 
0fda : 85 04 __ STA WORK + 1 
0fdc : 20 5b 1c JSR $1c5b ; (freg@proxy + 0)
0fdf : 20 46 19 JSR $1946 ; (crt_fdiv + 0)
0fe2 : a5 27 __ LDA ACCU + 0 
0fe4 : 85 33 __ STA T0 + 0 
0fe6 : a5 28 __ LDA ACCU + 1 
0fe8 : 85 34 __ STA T0 + 1 
0fea : a5 29 __ LDA ACCU + 2 
0fec : 85 35 __ STA T0 + 2 
0fee : a5 2a __ LDA ACCU + 3 
0ff0 : 85 36 __ STA T0 + 3 
0ff2 : 30 c9 __ BMI $0fbd ; (printf.l1033 + 2)
.s1029:
0ff4 : c9 41 __ CMP #$41
0ff6 : d0 c3 __ BNE $0fbb ; (printf.l1033 + 0)
0ff8 : f0 bb __ BEQ $0fb5 ; (printf.s1030 + 0)
.l226:
0ffa : 38 __ __ SEC
0ffb : a5 40 __ LDA T5 + 0 
0ffd : e9 03 __ SBC #$03
0fff : 85 40 __ STA T5 + 0 
1001 : b0 02 __ BCS $1005 ; (printf.s1327 + 0)
.s1326:
1003 : c6 41 __ DEC T5 + 1 
.s1327:
1005 : a9 00 __ LDA #$00
1007 : 85 27 __ STA ACCU + 0 
1009 : 85 28 __ STA ACCU + 1 
100b : a9 7a __ LDA #$7a
100d : 85 29 __ STA ACCU + 2 
100f : a9 44 __ LDA #$44
1011 : 85 2a __ STA ACCU + 3 
1013 : a2 33 __ LDX #$33
1015 : 20 50 17 JSR $1750 ; (freg + 4)
1018 : 20 7e 18 JSR $187e ; (crt_fmul + 0)
101b : a5 27 __ LDA ACCU + 0 
101d : 85 33 __ STA T0 + 0 
101f : a5 28 __ LDA ACCU + 1 
1021 : 85 34 __ STA T0 + 1 
1023 : a5 29 __ LDA ACCU + 2 
1025 : 85 35 __ STA T0 + 2 
1027 : a5 2a __ LDA ACCU + 3 
1029 : 85 36 __ STA T0 + 3 
102b : 4c 9f 0f JMP $0f9f ; (printf.s225 + 0)
.s224:
102e : 18 __ __ CLC
102f : a5 40 __ LDA T5 + 0 
1031 : 69 03 __ ADC #$03
1033 : 85 40 __ STA T5 + 0 
1035 : 90 02 __ BCC $1039 ; (printf.s1333 + 0)
.s1332:
1037 : e6 41 __ INC T5 + 1 
.s1333:
1039 : a5 33 __ LDA T0 + 0 
103b : 85 27 __ STA ACCU + 0 
103d : a5 34 __ LDA T0 + 1 
103f : 85 28 __ STA ACCU + 1 
1041 : a5 35 __ LDA T0 + 2 
1043 : 85 29 __ STA ACCU + 2 
1045 : a5 36 __ LDA T0 + 3 
1047 : 85 2a __ STA ACCU + 3 
1049 : a9 00 __ LDA #$00
104b : 85 03 __ STA WORK + 0 
104d : 85 04 __ STA WORK + 1 
104f : a9 7a __ LDA #$7a
1051 : 85 05 __ STA WORK + 2 
1053 : a9 44 __ LDA #$44
1055 : 85 06 __ STA WORK + 3 
1057 : 20 60 17 JSR $1760 ; (freg + 20)
105a : 20 46 19 JSR $1946 ; (crt_fdiv + 0)
105d : a5 27 __ LDA ACCU + 0 
105f : 85 33 __ STA T0 + 0 
1061 : a5 28 __ LDA ACCU + 1 
1063 : 85 34 __ STA T0 + 1 
1065 : a5 29 __ LDA ACCU + 2 
1067 : 85 35 __ STA T0 + 2 
1069 : a5 2a __ LDA ACCU + 3 
106b : 85 36 __ STA T0 + 3 
106d : 30 8b __ BMI $0ffa ; (printf.l226 + 0)
106f : 4c 90 0f JMP $0f90 ; (printf.l1045 + 0)
.s127:
1072 : a0 00 __ LDY #$00
1074 : b1 3b __ LDA (T2 + 0),y 
1076 : 85 33 __ STA T0 + 0 
1078 : c8 __ __ INY
1079 : b1 3b __ LDA (T2 + 0),y 
107b : 85 34 __ STA T0 + 1 
107d : c8 __ __ INY
107e : b1 3b __ LDA (T2 + 0),y 
1080 : 85 35 __ STA T0 + 2 
1082 : c8 __ __ INY
1083 : b1 3b __ LDA (T2 + 0),y 
1085 : 85 36 __ STA T0 + 3 
1087 : 18 __ __ CLC
1088 : a5 3b __ LDA T2 + 0 
108a : 69 04 __ ADC #$04
108c : 85 3b __ STA T2 + 0 
108e : 90 02 __ BCC $1092 ; (printf.s1319 + 0)
.s1318:
1090 : e6 3c __ INC T2 + 1 
.s1319:
1092 : a0 00 __ LDY #$00
1094 : b1 3d __ LDA (T3 + 0),y 
1096 : aa __ __ TAX
1097 : e6 3d __ INC T3 + 0 
1099 : d0 02 __ BNE $109d ; (printf.s1321 + 0)
.s1320:
109b : e6 3e __ INC T3 + 1 
.s1321:
109d : 8a __ __ TXA
109e : e0 64 __ CPX #$64
10a0 : d0 03 __ BNE $10a5 ; (printf.s132 + 0)
10a2 : 4c bf 12 JMP $12bf ; (printf.s130 + 0)
.s132:
10a5 : c9 44 __ CMP #$44
10a7 : f0 f9 __ BEQ $10a2 ; (printf.s1321 + 5)
.s131:
10a9 : c9 75 __ CMP #$75
10ab : d0 03 __ BNE $10b0 ; (printf.s158 + 0)
10ad : 4c b6 11 JMP $11b6 ; (printf.s156 + 0)
.s158:
10b0 : c9 55 __ CMP #$55
10b2 : f0 f9 __ BEQ $10ad ; (printf.s131 + 4)
.s157:
10b4 : c9 78 __ CMP #$78
10b6 : f0 07 __ BEQ $10bf ; (printf.s182 + 0)
.s183:
10b8 : c9 58 __ CMP #$58
10ba : f0 03 __ BEQ $10bf ; (printf.s182 + 0)
10bc : 4c 63 09 JMP $0963 ; (printf.l2 + 0)
.s182:
10bf : 8c ca 9f STY $9fca ; (si + 4)
10c2 : a9 10 __ LDA #$10
10c4 : 8d c9 9f STA $9fc9 ; (si + 3)
10c7 : 85 40 __ STA T5 + 0 
10c9 : a4 36 __ LDY T0 + 3 
10cb : f0 03 __ BEQ $10d0 ; (printf.s1054 + 0)
10cd : 4c 8b 11 JMP $118b ; (printf.s187 + 0)
.s1054:
10d0 : a5 35 __ LDA T0 + 2 
10d2 : d0 f9 __ BNE $10cd ; (printf.s182 + 14)
.s1055:
10d4 : a5 34 __ LDA T0 + 1 
10d6 : d0 f5 __ BNE $10cd ; (printf.s182 + 14)
.s1056:
10d8 : c5 33 __ CMP T0 + 0 
10da : 90 f1 __ BCC $10cd ; (printf.s182 + 14)
.s188:
10dc : ae c8 9f LDX $9fc8 ; (si + 2)
10df : e8 __ __ INX
10e0 : d0 04 __ BNE $10e6 ; (printf.s931 + 0)
.s932:
10e2 : a9 0f __ LDA #$0f
10e4 : b0 06 __ BCS $10ec ; (printf.s1120 + 0)
.s931:
10e6 : 38 __ __ SEC
10e7 : a9 10 __ LDA #$10
10e9 : ed c8 9f SBC $9fc8 ; (si + 2)
.s1120:
10ec : a8 __ __ TAY
10ed : c4 40 __ CPY T5 + 0 
10ef : b0 0d __ BCS $10fe ; (printf.s190 + 0)
.s189:
10f1 : a9 30 __ LDA #$30
.l1294:
10f3 : c6 40 __ DEC T5 + 0 
10f5 : a6 40 __ LDX T5 + 0 
10f7 : 9d 66 9f STA $9f66,x ; (buffer + 0)
10fa : c4 40 __ CPY T5 + 0 
10fc : 90 f5 __ BCC $10f3 ; (printf.l1294 + 0)
.s190:
10fe : ad cd 9f LDA $9fcd ; (si + 7)
1101 : f0 13 __ BEQ $1116 ; (printf.s195 + 0)
.s193:
1103 : a9 58 __ LDA #$58
1105 : a6 40 __ LDX T5 + 0 
1107 : 9d 65 9f STA $9f65,x 
110a : 8a __ __ TXA
110b : 18 __ __ CLC
110c : 69 fe __ ADC #$fe
110e : 85 40 __ STA T5 + 0 
1110 : aa __ __ TAX
1111 : a9 30 __ LDA #$30
1113 : 9d 66 9f STA $9f66,x ; (buffer + 0)
.s195:
1116 : a9 00 __ LDA #$00
1118 : 85 3f __ STA T4 + 0 
111a : ad cb 9f LDA $9fcb ; (si + 5)
111d : f0 09 __ BEQ $1128 ; (printf.s1861 + 0)
.s197:
111f : c6 40 __ DEC T5 + 0 
1121 : a9 2b __ LDA #$2b
1123 : a6 40 __ LDX T5 + 0 
1125 : 9d 66 9f STA $9f66,x ; (buffer + 0)
.s1861:
1128 : ad cc 9f LDA $9fcc ; (si + 6)
112b : d0 35 __ BNE $1162 ; (printf.l199 + 0)
.s1212:
112d : a6 40 __ LDX T5 + 0 
112f : 4c 39 11 JMP $1139 ; (printf.l203 + 0)
.s204:
1132 : ad c6 9f LDA $9fc6 ; (si + 0)
1135 : 9d 65 9f STA $9f65,x 
1138 : ca __ __ DEX
.l203:
1139 : 8a __ __ TXA
113a : 18 __ __ CLC
113b : 6d c7 9f ADC $9fc7 ; (si + 1)
113e : b0 f2 __ BCS $1132 ; (printf.s204 + 0)
.s1051:
1140 : c9 11 __ CMP #$11
1142 : b0 ee __ BCS $1132 ; (printf.s204 + 0)
.s1213:
1144 : e0 10 __ CPX #$10
1146 : b0 15 __ BCS $115d ; (printf.s66 + 0)
.s206:
1148 : 86 40 __ STX T5 + 0 
114a : a0 00 __ LDY #$00
.l1278:
114c : bd 66 9f LDA $9f66,x ; (buffer + 0)
114f : 99 ce 9f STA $9fce,y ; (buff + 0)
1152 : e6 40 __ INC T5 + 0 
1154 : a6 40 __ LDX T5 + 0 
1156 : e0 10 __ CPX #$10
1158 : c8 __ __ INY
1159 : 90 f1 __ BCC $114c ; (printf.l1278 + 0)
.s1181:
115b : 84 3f __ STY T4 + 0 
.s66:
115d : a5 3f __ LDA T4 + 0 
115f : 4c d7 09 JMP $09d7 ; (printf.s1104 + 0)
.l199:
1162 : a6 40 __ LDX T5 + 0 
1164 : e0 10 __ CPX #$10
1166 : b0 0e __ BCS $1176 ; (printf.s1180 + 0)
.s200:
1168 : bd 66 9f LDA $9f66,x ; (buffer + 0)
116b : a6 3f __ LDX T4 + 0 
116d : 9d ce 9f STA $9fce,x ; (buff + 0)
1170 : e6 3f __ INC T4 + 0 
1172 : e6 40 __ INC T5 + 0 
1174 : 90 ec __ BCC $1162 ; (printf.l199 + 0)
.s1180:
1176 : a4 3f __ LDY T4 + 0 
1178 : cc c7 9f CPY $9fc7 ; (si + 1)
117b : b0 de __ BCS $115b ; (printf.s1181 + 0)
.l70:
117d : ad c6 9f LDA $9fc6 ; (si + 0)
1180 : 99 ce 9f STA $9fce,y ; (buff + 0)
1183 : c8 __ __ INY
1184 : cc c7 9f CPY $9fc7 ; (si + 1)
1187 : 90 f4 __ BCC $117d ; (printf.l70 + 0)
1189 : b0 d0 __ BCS $115b ; (printf.s1181 + 0)
.s187:
118b : a5 33 __ LDA T0 + 0 
118d : 29 0f __ AND #$0f
118f : 85 37 __ STA T1 + 0 
1191 : c9 0a __ CMP #$0a
1193 : a9 37 __ LDA #$37
1195 : b0 02 __ BCS $1199 ; (printf.s930 + 0)
.s929:
1197 : a9 30 __ LDA #$30
.s930:
1199 : c6 40 __ DEC T5 + 0 
119b : 18 __ __ CLC
119c : 65 37 __ ADC T1 + 0 
119e : a6 40 __ LDX T5 + 0 
11a0 : 9d 66 9f STA $9f66,x ; (buffer + 0)
11a3 : 98 __ __ TYA
11a4 : a2 04 __ LDX #$04
.l1052:
11a6 : 4a __ __ LSR
11a7 : 66 35 __ ROR T0 + 2 
11a9 : 66 34 __ ROR T0 + 1 
11ab : 66 33 __ ROR T0 + 0 
11ad : ca __ __ DEX
11ae : d0 f6 __ BNE $11a6 ; (printf.l1052 + 0)
.s1053:
11b0 : a8 __ __ TAY
11b1 : d0 d8 __ BNE $118b ; (printf.s187 + 0)
11b3 : 4c d0 10 JMP $10d0 ; (printf.s1054 + 0)
.s156:
11b6 : a9 10 __ LDA #$10
11b8 : 85 40 __ STA T5 + 0 
11ba : a5 36 __ LDA T0 + 3 
11bc : f0 03 __ BEQ $11c1 ; (printf.s1061 + 0)
11be : 4c 75 12 JMP $1275 ; (printf.l162 + 0)
.s1061:
11c1 : a5 35 __ LDA T0 + 2 
11c3 : d0 f9 __ BNE $11be ; (printf.s156 + 8)
.s1062:
11c5 : a5 34 __ LDA T0 + 1 
11c7 : d0 f5 __ BNE $11be ; (printf.s156 + 8)
.s1063:
11c9 : c5 33 __ CMP T0 + 0 
11cb : 90 f1 __ BCC $11be ; (printf.s156 + 8)
.s163:
11cd : ae c8 9f LDX $9fc8 ; (si + 2)
11d0 : e8 __ __ INX
11d1 : d0 04 __ BNE $11d7 ; (printf.s925 + 0)
.s926:
11d3 : a9 0f __ LDA #$0f
11d5 : b0 06 __ BCS $11dd ; (printf.s1119 + 0)
.s925:
11d7 : 38 __ __ SEC
11d8 : a9 10 __ LDA #$10
11da : ed c8 9f SBC $9fc8 ; (si + 2)
.s1119:
11dd : a8 __ __ TAY
11de : c4 40 __ CPY T5 + 0 
11e0 : b0 0d __ BCS $11ef ; (printf.s165 + 0)
.s164:
11e2 : a9 30 __ LDA #$30
.l1292:
11e4 : c6 40 __ DEC T5 + 0 
11e6 : a6 40 __ LDX T5 + 0 
11e8 : 9d 76 9f STA $9f76,x ; (buffer + 0)
11eb : c4 40 __ CPY T5 + 0 
11ed : 90 f5 __ BCC $11e4 ; (printf.l1292 + 0)
.s165:
11ef : ad cd 9f LDA $9fcd ; (si + 7)
11f2 : f0 1f __ BEQ $1213 ; (printf.s170 + 0)
.s168:
11f4 : ad ca 9f LDA $9fca ; (si + 4)
11f7 : d0 1a __ BNE $1213 ; (printf.s170 + 0)
.s1060:
11f9 : ad c9 9f LDA $9fc9 ; (si + 3)
11fc : c9 10 __ CMP #$10
11fe : d0 13 __ BNE $1213 ; (printf.s170 + 0)
.s166:
1200 : a9 58 __ LDA #$58
1202 : a6 40 __ LDX T5 + 0 
1204 : 9d 75 9f STA $9f75,x ; (buffer + 15)
1207 : 8a __ __ TXA
1208 : 18 __ __ CLC
1209 : 69 fe __ ADC #$fe
120b : 85 40 __ STA T5 + 0 
120d : aa __ __ TAX
120e : a9 30 __ LDA #$30
1210 : 9d 76 9f STA $9f76,x ; (buffer + 0)
.s170:
1213 : a9 00 __ LDA #$00
1215 : 85 3f __ STA T4 + 0 
1217 : ad cb 9f LDA $9fcb ; (si + 5)
121a : f0 09 __ BEQ $1225 ; (printf.s1848 + 0)
.s172:
121c : c6 40 __ DEC T5 + 0 
121e : a9 2b __ LDA #$2b
1220 : a6 40 __ LDX T5 + 0 
1222 : 9d 76 9f STA $9f76,x ; (buffer + 0)
.s1848:
1225 : ad cc 9f LDA $9fcc ; (si + 6)
1228 : f0 17 __ BEQ $1241 ; (printf.s1206 + 0)
.l174:
122a : a6 40 __ LDX T5 + 0 
122c : e0 10 __ CPX #$10
122e : 90 03 __ BCC $1233 ; (printf.s175 + 0)
1230 : 4c 76 11 JMP $1176 ; (printf.s1180 + 0)
.s175:
1233 : bd 76 9f LDA $9f76,x ; (buffer + 0)
1236 : a6 3f __ LDX T4 + 0 
1238 : 9d ce 9f STA $9fce,x ; (buff + 0)
123b : e6 3f __ INC T4 + 0 
123d : e6 40 __ INC T5 + 0 
123f : 90 e9 __ BCC $122a ; (printf.l174 + 0)
.s1206:
1241 : a6 40 __ LDX T5 + 0 
1243 : 4c 4d 12 JMP $124d ; (printf.l178 + 0)
.s179:
1246 : ad c6 9f LDA $9fc6 ; (si + 0)
1249 : 9d 75 9f STA $9f75,x ; (buffer + 15)
124c : ca __ __ DEX
.l178:
124d : 8a __ __ TXA
124e : 18 __ __ CLC
124f : 6d c7 9f ADC $9fc7 ; (si + 1)
1252 : b0 f2 __ BCS $1246 ; (printf.s179 + 0)
.s1059:
1254 : c9 11 __ CMP #$11
1256 : b0 ee __ BCS $1246 ; (printf.s179 + 0)
.s1207:
1258 : e0 10 __ CPX #$10
125a : 90 03 __ BCC $125f ; (printf.s181 + 0)
125c : 4c 5d 11 JMP $115d ; (printf.s66 + 0)
.s181:
125f : 86 40 __ STX T5 + 0 
1261 : a0 00 __ LDY #$00
.l1276:
1263 : bd 76 9f LDA $9f76,x ; (buffer + 0)
1266 : 99 ce 9f STA $9fce,y ; (buff + 0)
1269 : e6 40 __ INC T5 + 0 
126b : a6 40 __ LDX T5 + 0 
126d : e0 10 __ CPX #$10
126f : c8 __ __ INY
1270 : 90 f1 __ BCC $1263 ; (printf.l1276 + 0)
1272 : 4c 5b 11 JMP $115b ; (printf.s1181 + 0)
.l162:
1275 : a5 33 __ LDA T0 + 0 
1277 : 85 27 __ STA ACCU + 0 
1279 : a5 34 __ LDA T0 + 1 
127b : 85 28 __ STA ACCU + 1 
127d : a5 35 __ LDA T0 + 2 
127f : 85 29 __ STA ACCU + 2 
1281 : a5 36 __ LDA T0 + 3 
1283 : 85 2a __ STA ACCU + 3 
1285 : a9 00 __ LDA #$00
1287 : 85 04 __ STA WORK + 1 
1289 : 85 05 __ STA WORK + 2 
128b : 85 06 __ STA WORK + 3 
128d : 20 7a 1b JSR $1b7a ; (divmod32@proxy + 0)
1290 : a5 27 __ LDA ACCU + 0 
1292 : 85 33 __ STA T0 + 0 
1294 : a5 28 __ LDA ACCU + 1 
1296 : 85 34 __ STA T0 + 1 
1298 : a5 29 __ LDA ACCU + 2 
129a : 85 35 __ STA T0 + 2 
129c : a5 2a __ LDA ACCU + 3 
129e : 85 36 __ STA T0 + 3 
12a0 : a5 07 __ LDA WORK + 4 
12a2 : 30 04 __ BMI $12a8 ; (printf.s923 + 0)
.s1323:
12a4 : c9 0a __ CMP #$0a
12a6 : b0 04 __ BCS $12ac ; (printf.s922 + 0)
.s923:
12a8 : a9 30 __ LDA #$30
12aa : d0 02 __ BNE $12ae ; (printf.s924 + 0)
.s922:
12ac : a9 37 __ LDA #$37
.s924:
12ae : c6 40 __ DEC T5 + 0 
12b0 : 18 __ __ CLC
12b1 : 65 07 __ ADC WORK + 4 
12b3 : a6 40 __ LDX T5 + 0 
12b5 : 9d 76 9f STA $9f76,x ; (buffer + 0)
12b8 : a5 2a __ LDA ACCU + 3 
12ba : d0 b9 __ BNE $1275 ; (printf.l162 + 0)
12bc : 4c c1 11 JMP $11c1 ; (printf.s1061 + 0)
.s130:
12bf : a9 10 __ LDA #$10
12c1 : 85 40 __ STA T5 + 0 
12c3 : a5 36 __ LDA T0 + 3 
12c5 : f0 05 __ BEQ $12cc ; (printf.s134 + 0)
.s1088:
12c7 : 10 03 __ BPL $12cc ; (printf.s134 + 0)
12c9 : 4c fa 13 JMP $13fa ; (printf.s133 + 0)
.s134:
12cc : 84 42 __ STY T6 + 0 
12ce : a5 33 __ LDA T0 + 0 
12d0 : 85 37 __ STA T1 + 0 
12d2 : a5 34 __ LDA T0 + 1 
12d4 : 85 38 __ STA T1 + 1 
12d6 : a5 35 __ LDA T0 + 2 
12d8 : 85 39 __ STA T1 + 2 
12da : a5 36 __ LDA T0 + 3 
12dc : 85 3a __ STA T1 + 3 
12de : c4 36 __ CPY T0 + 3 
12e0 : d0 0d __ BNE $12ef ; (printf.s1076 + 0)
.s1073:
12e2 : a5 35 __ LDA T0 + 2 
12e4 : f0 03 __ BEQ $12e9 ; (printf.s1074 + 0)
12e6 : 4c a6 13 JMP $13a6 ; (printf.l136 + 0)
.s1074:
12e9 : a5 34 __ LDA T0 + 1 
12eb : d0 f9 __ BNE $12e6 ; (printf.s1073 + 4)
.s1075:
12ed : c5 33 __ CMP T0 + 0 
.s1076:
12ef : 90 f5 __ BCC $12e6 ; (printf.s1073 + 4)
.s137:
12f1 : ae c8 9f LDX $9fc8 ; (si + 2)
12f4 : e8 __ __ INX
12f5 : d0 04 __ BNE $12fb ; (printf.s919 + 0)
.s920:
12f7 : a9 0f __ LDA #$0f
12f9 : b0 06 __ BCS $1301 ; (printf.s1118 + 0)
.s919:
12fb : 38 __ __ SEC
12fc : a9 10 __ LDA #$10
12fe : ed c8 9f SBC $9fc8 ; (si + 2)
.s1118:
1301 : a8 __ __ TAY
1302 : c4 40 __ CPY T5 + 0 
1304 : b0 0d __ BCS $1313 ; (printf.s139 + 0)
.s138:
1306 : a9 30 __ LDA #$30
.l1290:
1308 : c6 40 __ DEC T5 + 0 
130a : a6 40 __ LDX T5 + 0 
130c : 9d 86 9f STA $9f86,x ; (buffer + 0)
130f : c4 40 __ CPY T5 + 0 
1311 : 90 f5 __ BCC $1308 ; (printf.l1290 + 0)
.s139:
1313 : ad cd 9f LDA $9fcd ; (si + 7)
1316 : f0 1f __ BEQ $1337 ; (printf.s141 + 0)
.s142:
1318 : ad ca 9f LDA $9fca ; (si + 4)
131b : d0 1a __ BNE $1337 ; (printf.s141 + 0)
.s1067:
131d : ad c9 9f LDA $9fc9 ; (si + 3)
1320 : c9 10 __ CMP #$10
1322 : d0 13 __ BNE $1337 ; (printf.s141 + 0)
.s140:
1324 : a9 58 __ LDA #$58
1326 : a6 40 __ LDX T5 + 0 
1328 : 9d 85 9f STA $9f85,x ; (buffer + 15)
132b : 8a __ __ TXA
132c : 18 __ __ CLC
132d : 69 fe __ ADC #$fe
132f : 85 40 __ STA T5 + 0 
1331 : aa __ __ TAX
1332 : a9 30 __ LDA #$30
1334 : 9d 86 9f STA $9f86,x ; (buffer + 0)
.s141:
1337 : a9 00 __ LDA #$00
1339 : 85 3f __ STA T4 + 0 
133b : a5 42 __ LDA T6 + 0 
133d : f0 0c __ BEQ $134b ; (printf.s144 + 0)
.s143:
133f : c6 40 __ DEC T5 + 0 
1341 : a9 2d __ LDA #$2d
.s1110:
1343 : a6 40 __ LDX T5 + 0 
1345 : 9d 86 9f STA $9f86,x ; (buffer + 0)
1348 : 4c 56 13 JMP $1356 ; (printf.s1831 + 0)
.s144:
134b : ad cb 9f LDA $9fcb ; (si + 5)
134e : f0 06 __ BEQ $1356 ; (printf.s1831 + 0)
.s146:
1350 : c6 40 __ DEC T5 + 0 
1352 : a9 2b __ LDA #$2b
1354 : d0 ed __ BNE $1343 ; (printf.s1110 + 0)
.s1831:
1356 : ad cc 9f LDA $9fcc ; (si + 6)
1359 : f0 17 __ BEQ $1372 ; (printf.s1200 + 0)
.l148:
135b : a6 40 __ LDX T5 + 0 
135d : e0 10 __ CPX #$10
135f : 90 03 __ BCC $1364 ; (printf.s149 + 0)
1361 : 4c 76 11 JMP $1176 ; (printf.s1180 + 0)
.s149:
1364 : bd 86 9f LDA $9f86,x ; (buffer + 0)
1367 : a6 3f __ LDX T4 + 0 
1369 : 9d ce 9f STA $9fce,x ; (buff + 0)
136c : e6 3f __ INC T4 + 0 
136e : e6 40 __ INC T5 + 0 
1370 : 90 e9 __ BCC $135b ; (printf.l148 + 0)
.s1200:
1372 : a6 40 __ LDX T5 + 0 
1374 : 4c 7e 13 JMP $137e ; (printf.l152 + 0)
.s153:
1377 : ad c6 9f LDA $9fc6 ; (si + 0)
137a : 9d 85 9f STA $9f85,x ; (buffer + 15)
137d : ca __ __ DEX
.l152:
137e : 8a __ __ TXA
137f : 18 __ __ CLC
1380 : 6d c7 9f ADC $9fc7 ; (si + 1)
1383 : b0 f2 __ BCS $1377 ; (printf.s153 + 0)
.s1066:
1385 : c9 11 __ CMP #$11
1387 : b0 ee __ BCS $1377 ; (printf.s153 + 0)
.s1201:
1389 : e0 10 __ CPX #$10
138b : 90 03 __ BCC $1390 ; (printf.s155 + 0)
138d : 4c 5d 11 JMP $115d ; (printf.s66 + 0)
.s155:
1390 : 86 40 __ STX T5 + 0 
1392 : a0 00 __ LDY #$00
.l1274:
1394 : bd 86 9f LDA $9f86,x ; (buffer + 0)
1397 : 99 ce 9f STA $9fce,y ; (buff + 0)
139a : e6 40 __ INC T5 + 0 
139c : a6 40 __ LDX T5 + 0 
139e : e0 10 __ CPX #$10
13a0 : c8 __ __ INY
13a1 : 90 f1 __ BCC $1394 ; (printf.l1274 + 0)
13a3 : 4c 5b 11 JMP $115b ; (printf.s1181 + 0)
.l136:
13a6 : a5 37 __ LDA T1 + 0 
13a8 : 85 27 __ STA ACCU + 0 
13aa : a5 38 __ LDA T1 + 1 
13ac : 85 28 __ STA ACCU + 1 
13ae : a5 39 __ LDA T1 + 2 
13b0 : 85 29 __ STA ACCU + 2 
13b2 : a5 3a __ LDA T1 + 3 
13b4 : 85 2a __ STA ACCU + 3 
13b6 : a9 00 __ LDA #$00
13b8 : 85 04 __ STA WORK + 1 
13ba : 85 05 __ STA WORK + 2 
13bc : 85 06 __ STA WORK + 3 
13be : 20 7a 1b JSR $1b7a ; (divmod32@proxy + 0)
13c1 : a5 27 __ LDA ACCU + 0 
13c3 : 85 37 __ STA T1 + 0 
13c5 : a5 28 __ LDA ACCU + 1 
13c7 : 85 38 __ STA T1 + 1 
13c9 : a5 29 __ LDA ACCU + 2 
13cb : 85 39 __ STA T1 + 2 
13cd : a5 2a __ LDA ACCU + 3 
13cf : 85 3a __ STA T1 + 3 
13d1 : a5 07 __ LDA WORK + 4 
13d3 : 30 04 __ BMI $13d9 ; (printf.s917 + 0)
.s1322:
13d5 : c9 0a __ CMP #$0a
13d7 : b0 04 __ BCS $13dd ; (printf.s916 + 0)
.s917:
13d9 : a9 30 __ LDA #$30
13db : d0 02 __ BNE $13df ; (printf.s918 + 0)
.s916:
13dd : a9 37 __ LDA #$37
.s918:
13df : c6 40 __ DEC T5 + 0 
13e1 : 18 __ __ CLC
13e2 : 65 07 __ ADC WORK + 4 
13e4 : a6 40 __ LDX T5 + 0 
13e6 : 9d 86 9f STA $9f86,x ; (buffer + 0)
13e9 : a5 2a __ LDA ACCU + 3 
13eb : d0 b9 __ BNE $13a6 ; (printf.l136 + 0)
.s1068:
13ed : a5 39 __ LDA T1 + 2 
13ef : d0 b5 __ BNE $13a6 ; (printf.l136 + 0)
.s1069:
13f1 : a5 38 __ LDA T1 + 1 
13f3 : d0 b1 __ BNE $13a6 ; (printf.l136 + 0)
.s1070:
13f5 : c5 37 __ CMP T1 + 0 
13f7 : 4c ef 12 JMP $12ef ; (printf.s1076 + 0)
.s133:
13fa : 98 __ __ TYA
13fb : 38 __ __ SEC
13fc : e5 33 __ SBC T0 + 0 
13fe : 85 37 __ STA T1 + 0 
1400 : 98 __ __ TYA
1401 : e5 34 __ SBC T0 + 1 
1403 : 85 38 __ STA T1 + 1 
1405 : 98 __ __ TYA
1406 : e5 35 __ SBC T0 + 2 
1408 : 85 39 __ STA T1 + 2 
140a : a9 01 __ LDA #$01
140c : 85 42 __ STA T6 + 0 
140e : 98 __ __ TYA
140f : e5 36 __ SBC T0 + 3 
1411 : 85 3a __ STA T1 + 3 
1413 : f0 d8 __ BEQ $13ed ; (printf.s1068 + 0)
1415 : d0 8f __ BNE $13a6 ; (printf.l136 + 0)
.s101:
1417 : a0 00 __ LDY #$00
1419 : 8c ca 9f STY $9fca ; (si + 4)
141c : a9 10 __ LDA #$10
141e : 8d c9 9f STA $9fc9 ; (si + 3)
1421 : b1 3b __ LDA (T2 + 0),y 
1423 : aa __ __ TAX
1424 : c8 __ __ INY
1425 : b1 3b __ LDA (T2 + 0),y 
1427 : 85 34 __ STA T0 + 1 
1429 : 18 __ __ CLC
142a : a5 3b __ LDA T2 + 0 
142c : 69 02 __ ADC #$02
142e : 85 3b __ STA T2 + 0 
1430 : 90 02 __ BCC $1434 ; (printf.s1317 + 0)
.s1316:
1432 : e6 3c __ INC T2 + 1 
.s1317:
1434 : 8a __ __ TXA
1435 : a8 __ __ TAY
1436 : a2 10 __ LDX #$10
1438 : 05 34 __ ORA T0 + 1 
143a : f0 26 __ BEQ $1462 ; (printf.s108 + 0)
.l107:
143c : 98 __ __ TYA
143d : 29 0f __ AND #$0f
143f : 85 37 __ STA T1 + 0 
1441 : c9 0a __ CMP #$0a
1443 : a9 37 __ LDA #$37
1445 : b0 02 __ BCS $1449 ; (printf.s912 + 0)
.s911:
1447 : a9 30 __ LDA #$30
.s912:
1449 : 18 __ __ CLC
144a : 65 37 __ ADC T1 + 0 
144c : 9d 95 9f STA $9f95,x ; (buffer + 15)
144f : 98 __ __ TYA
1450 : 46 34 __ LSR T0 + 1 
1452 : 6a __ __ ROR
1453 : 46 34 __ LSR T0 + 1 
1455 : 6a __ __ ROR
1456 : 46 34 __ LSR T0 + 1 
1458 : 6a __ __ ROR
1459 : 46 34 __ LSR T0 + 1 
145b : 6a __ __ ROR
145c : a8 __ __ TAY
145d : ca __ __ DEX
145e : 05 34 __ ORA T0 + 1 
1460 : d0 da __ BNE $143c ; (printf.l107 + 0)
.s108:
1462 : 86 40 __ STX T5 + 0 
1464 : ac c8 9f LDY $9fc8 ; (si + 2)
1467 : c8 __ __ INY
1468 : d0 04 __ BNE $146e ; (printf.s913 + 0)
.s914:
146a : a9 0f __ LDA #$0f
146c : d0 06 __ BNE $1474 ; (printf.s1117 + 0)
.s913:
146e : 38 __ __ SEC
146f : a9 10 __ LDA #$10
1471 : ed c8 9f SBC $9fc8 ; (si + 2)
.s1117:
1474 : a8 __ __ TAY
1475 : c4 40 __ CPY T5 + 0 
1477 : b0 0d __ BCS $1486 ; (printf.s110 + 0)
.s109:
1479 : a9 30 __ LDA #$30
.l1288:
147b : c6 40 __ DEC T5 + 0 
147d : a6 40 __ LDX T5 + 0 
147f : 9d 96 9f STA $9f96,x ; (buffer + 0)
1482 : c4 40 __ CPY T5 + 0 
1484 : 90 f5 __ BCC $147b ; (printf.l1288 + 0)
.s110:
1486 : ad cd 9f LDA $9fcd ; (si + 7)
1489 : f0 11 __ BEQ $149c ; (printf.s115 + 0)
.s113:
148b : a9 58 __ LDA #$58
148d : 9d 95 9f STA $9f95,x ; (buffer + 15)
1490 : 8a __ __ TXA
1491 : 18 __ __ CLC
1492 : 69 fe __ ADC #$fe
1494 : 85 40 __ STA T5 + 0 
1496 : aa __ __ TAX
1497 : a9 30 __ LDA #$30
1499 : 9d 96 9f STA $9f96,x ; (buffer + 0)
.s115:
149c : a9 00 __ LDA #$00
149e : 85 3f __ STA T4 + 0 
14a0 : ad cb 9f LDA $9fcb ; (si + 5)
14a3 : f0 09 __ BEQ $14ae ; (printf.s1816 + 0)
.s117:
14a5 : c6 40 __ DEC T5 + 0 
14a7 : a9 2b __ LDA #$2b
14a9 : a6 40 __ LDX T5 + 0 
14ab : 9d 96 9f STA $9f96,x ; (buffer + 0)
.s1816:
14ae : ad cc 9f LDA $9fcc ; (si + 6)
14b1 : f0 17 __ BEQ $14ca ; (printf.l123 + 0)
.l119:
14b3 : a6 40 __ LDX T5 + 0 
14b5 : e0 10 __ CPX #$10
14b7 : 90 03 __ BCC $14bc ; (printf.s120 + 0)
14b9 : 4c 76 11 JMP $1176 ; (printf.s1180 + 0)
.s120:
14bc : bd 96 9f LDA $9f96,x ; (buffer + 0)
14bf : a6 3f __ LDX T4 + 0 
14c1 : 9d ce 9f STA $9fce,x ; (buff + 0)
14c4 : e6 3f __ INC T4 + 0 
14c6 : e6 40 __ INC T5 + 0 
14c8 : 90 e9 __ BCC $14b3 ; (printf.l119 + 0)
.l123:
14ca : 8a __ __ TXA
14cb : 18 __ __ CLC
14cc : 6d c7 9f ADC $9fc7 ; (si + 1)
14cf : b0 04 __ BCS $14d5 ; (printf.s124 + 0)
.s1083:
14d1 : c9 11 __ CMP #$11
14d3 : 90 09 __ BCC $14de ; (printf.s1195 + 0)
.s124:
14d5 : ad c6 9f LDA $9fc6 ; (si + 0)
14d8 : 9d 95 9f STA $9f95,x ; (buffer + 15)
14db : ca __ __ DEX
14dc : b0 ec __ BCS $14ca ; (printf.l123 + 0)
.s1195:
14de : e0 10 __ CPX #$10
14e0 : 90 03 __ BCC $14e5 ; (printf.s126 + 0)
14e2 : 4c 5d 11 JMP $115d ; (printf.s66 + 0)
.s126:
14e5 : 86 40 __ STX T5 + 0 
14e7 : a0 00 __ LDY #$00
.l1272:
14e9 : bd 96 9f LDA $9f96,x ; (buffer + 0)
14ec : 99 ce 9f STA $9fce,y ; (buff + 0)
14ef : e6 40 __ INC T5 + 0 
14f1 : a6 40 __ LDX T5 + 0 
14f3 : e0 10 __ CPX #$10
14f5 : c8 __ __ INY
14f6 : 90 f1 __ BCC $14e9 ; (printf.l1272 + 0)
14f8 : 4c 5b 11 JMP $115b ; (printf.s1181 + 0)
.s75:
14fb : a0 00 __ LDY #$00
14fd : b1 3b __ LDA (T2 + 0),y 
14ff : 85 33 __ STA T0 + 0 
1501 : c8 __ __ INY
1502 : b1 3b __ LDA (T2 + 0),y 
1504 : 85 34 __ STA T0 + 1 
1506 : 18 __ __ CLC
1507 : a5 3b __ LDA T2 + 0 
1509 : 69 02 __ ADC #$02
150b : 85 3b __ STA T2 + 0 
150d : 90 02 __ BCC $1511 ; (printf.s1314 + 0)
.s1313:
150f : e6 3c __ INC T2 + 1 
.s1314:
1511 : a9 10 __ LDA #$10
1513 : 85 40 __ STA T5 + 0 
1515 : d0 0a __ BNE $1521 ; (printf.l2010 + 0)
.s906:
1517 : c6 40 __ DEC T5 + 0 
1519 : 18 __ __ CLC
151a : 65 05 __ ADC WORK + 2 
151c : a6 40 __ LDX T5 + 0 
151e : 9d a6 9f STA $9fa6,x ; (buffer + 0)
.l2010:
1521 : a5 33 __ LDA T0 + 0 
1523 : 05 34 __ ORA T0 + 1 
1525 : f0 03 __ BEQ $152a ; (printf.s82 + 0)
1527 : 4c d2 15 JMP $15d2 ; (printf.s81 + 0)
.s82:
152a : ae c8 9f LDX $9fc8 ; (si + 2)
152d : e8 __ __ INX
152e : d0 04 __ BNE $1534 ; (printf.s907 + 0)
.s908:
1530 : a9 0f __ LDA #$0f
1532 : d0 06 __ BNE $153a ; (printf.s1116 + 0)
.s907:
1534 : 38 __ __ SEC
1535 : a9 10 __ LDA #$10
1537 : ed c8 9f SBC $9fc8 ; (si + 2)
.s1116:
153a : a8 __ __ TAY
153b : c4 40 __ CPY T5 + 0 
153d : b0 0d __ BCS $154c ; (printf.s84 + 0)
.s83:
153f : a9 30 __ LDA #$30
.l1286:
1541 : c6 40 __ DEC T5 + 0 
1543 : a6 40 __ LDX T5 + 0 
1545 : 9d a6 9f STA $9fa6,x ; (buffer + 0)
1548 : c4 40 __ CPY T5 + 0 
154a : 90 f5 __ BCC $1541 ; (printf.l1286 + 0)
.s84:
154c : ad cd 9f LDA $9fcd ; (si + 7)
154f : f0 1f __ BEQ $1570 ; (printf.s89 + 0)
.s87:
1551 : ad ca 9f LDA $9fca ; (si + 4)
1554 : d0 1a __ BNE $1570 ; (printf.s89 + 0)
.s1085:
1556 : ad c9 9f LDA $9fc9 ; (si + 3)
1559 : c9 10 __ CMP #$10
155b : d0 13 __ BNE $1570 ; (printf.s89 + 0)
.s85:
155d : a9 58 __ LDA #$58
155f : a6 40 __ LDX T5 + 0 
1561 : 9d a5 9f STA $9fa5,x ; (buffer + 15)
1564 : 8a __ __ TXA
1565 : 18 __ __ CLC
1566 : 69 fe __ ADC #$fe
1568 : 85 40 __ STA T5 + 0 
156a : aa __ __ TAX
156b : a9 30 __ LDA #$30
156d : 9d a6 9f STA $9fa6,x ; (buffer + 0)
.s89:
1570 : a9 00 __ LDA #$00
1572 : 85 3f __ STA T4 + 0 
1574 : ad cb 9f LDA $9fcb ; (si + 5)
1577 : f0 09 __ BEQ $1582 ; (printf.s1803 + 0)
.s91:
1579 : c6 40 __ DEC T5 + 0 
157b : a9 2b __ LDA #$2b
157d : a6 40 __ LDX T5 + 0 
157f : 9d a6 9f STA $9fa6,x ; (buffer + 0)
.s1803:
1582 : ad cc 9f LDA $9fcc ; (si + 6)
1585 : f0 17 __ BEQ $159e ; (printf.s1188 + 0)
.l93:
1587 : a6 40 __ LDX T5 + 0 
1589 : e0 10 __ CPX #$10
158b : 90 03 __ BCC $1590 ; (printf.s94 + 0)
158d : 4c 76 11 JMP $1176 ; (printf.s1180 + 0)
.s94:
1590 : bd a6 9f LDA $9fa6,x ; (buffer + 0)
1593 : a6 3f __ LDX T4 + 0 
1595 : 9d ce 9f STA $9fce,x ; (buff + 0)
1598 : e6 3f __ INC T4 + 0 
159a : e6 40 __ INC T5 + 0 
159c : 90 e9 __ BCC $1587 ; (printf.l93 + 0)
.s1188:
159e : a6 40 __ LDX T5 + 0 
15a0 : 4c aa 15 JMP $15aa ; (printf.l97 + 0)
.s98:
15a3 : ad c6 9f LDA $9fc6 ; (si + 0)
15a6 : 9d a5 9f STA $9fa5,x ; (buffer + 15)
15a9 : ca __ __ DEX
.l97:
15aa : 8a __ __ TXA
15ab : 18 __ __ CLC
15ac : 6d c7 9f ADC $9fc7 ; (si + 1)
15af : b0 f2 __ BCS $15a3 ; (printf.s98 + 0)
.s1084:
15b1 : c9 11 __ CMP #$11
15b3 : b0 ee __ BCS $15a3 ; (printf.s98 + 0)
.s1189:
15b5 : e0 10 __ CPX #$10
15b7 : 90 03 __ BCC $15bc ; (printf.s100 + 0)
15b9 : 4c 5d 11 JMP $115d ; (printf.s66 + 0)
.s100:
15bc : 86 40 __ STX T5 + 0 
15be : a0 00 __ LDY #$00
.l1270:
15c0 : bd a6 9f LDA $9fa6,x ; (buffer + 0)
15c3 : 99 ce 9f STA $9fce,y ; (buff + 0)
15c6 : e6 40 __ INC T5 + 0 
15c8 : a6 40 __ LDX T5 + 0 
15ca : e0 10 __ CPX #$10
15cc : c8 __ __ INY
15cd : 90 f1 __ BCC $15c0 ; (printf.l1270 + 0)
15cf : 4c 5b 11 JMP $115b ; (printf.s1181 + 0)
.s81:
15d2 : a5 33 __ LDA T0 + 0 
15d4 : 85 27 __ STA ACCU + 0 
15d6 : a5 34 __ LDA T0 + 1 
15d8 : 85 28 __ STA ACCU + 1 
15da : 20 2b 1a JSR $1a2b ; (divmod@proxy + 0)
15dd : a5 27 __ LDA ACCU + 0 
15df : 85 33 __ STA T0 + 0 
15e1 : a5 28 __ LDA ACCU + 1 
15e3 : 85 34 __ STA T0 + 1 
15e5 : a5 05 __ LDA WORK + 2 
15e7 : 30 04 __ BMI $15ed ; (printf.s905 + 0)
.s1315:
15e9 : c9 0a __ CMP #$0a
15eb : b0 05 __ BCS $15f2 ; (printf.s904 + 0)
.s905:
15ed : a9 30 __ LDA #$30
15ef : 4c 17 15 JMP $1517 ; (printf.s906 + 0)
.s904:
15f2 : a9 37 __ LDA #$37
15f4 : 4c 17 15 JMP $1517 ; (printf.s906 + 0)
.s47:
15f7 : a0 00 __ LDY #$00
15f9 : b1 3b __ LDA (T2 + 0),y 
15fb : 85 33 __ STA T0 + 0 
15fd : c8 __ __ INY
15fe : b1 3b __ LDA (T2 + 0),y 
1600 : 85 34 __ STA T0 + 1 
1602 : 18 __ __ CLC
1603 : a5 3b __ LDA T2 + 0 
1605 : 69 02 __ ADC #$02
1607 : 85 3b __ STA T2 + 0 
1609 : 90 02 __ BCC $160d ; (printf.s1311 + 0)
.s1310:
160b : e6 3c __ INC T2 + 1 
.s1311:
160d : a9 10 __ LDA #$10
160f : 85 40 __ STA T5 + 0 
1611 : a5 34 __ LDA T0 + 1 
1613 : 10 11 __ BPL $1626 ; (printf.s53 + 0)
.s52:
1615 : 84 42 __ STY T6 + 0 
1617 : 38 __ __ SEC
1618 : a9 00 __ LDA #$00
161a : e5 33 __ SBC T0 + 0 
161c : a8 __ __ TAY
161d : a9 00 __ LDA #$00
161f : e5 34 __ SBC T0 + 1 
1621 : 85 38 __ STA T1 + 1 
1623 : 4c 33 16 JMP $1633 ; (printf.l55 + 0)
.s53:
1626 : 85 38 __ STA T1 + 1 
1628 : a9 00 __ LDA #$00
162a : 85 42 __ STA T6 + 0 
162c : a5 33 __ LDA T0 + 0 
162e : a8 __ __ TAY
162f : 05 34 __ ORA T0 + 1 
1631 : f0 2c __ BEQ $165f ; (printf.s56 + 0)
.l55:
1633 : 84 27 __ STY ACCU + 0 
1635 : a5 38 __ LDA T1 + 1 
1637 : 85 28 __ STA ACCU + 1 
1639 : 20 2b 1a JSR $1a2b ; (divmod@proxy + 0)
163c : a5 28 __ LDA ACCU + 1 
163e : 85 38 __ STA T1 + 1 
1640 : a4 27 __ LDY ACCU + 0 
1642 : a5 05 __ LDA WORK + 2 
1644 : 30 04 __ BMI $164a ; (printf.s899 + 0)
.s1312:
1646 : c9 0a __ CMP #$0a
1648 : b0 04 __ BCS $164e ; (printf.s898 + 0)
.s899:
164a : a9 30 __ LDA #$30
164c : d0 02 __ BNE $1650 ; (printf.s900 + 0)
.s898:
164e : a9 37 __ LDA #$37
.s900:
1650 : c6 40 __ DEC T5 + 0 
1652 : 18 __ __ CLC
1653 : 65 05 __ ADC WORK + 2 
1655 : a6 40 __ LDX T5 + 0 
1657 : 9d b6 9f STA $9fb6,x ; (buffer + 0)
165a : 98 __ __ TYA
165b : 05 28 __ ORA ACCU + 1 
165d : d0 d4 __ BNE $1633 ; (printf.l55 + 0)
.s56:
165f : ae c8 9f LDX $9fc8 ; (si + 2)
1662 : e8 __ __ INX
1663 : d0 04 __ BNE $1669 ; (printf.s901 + 0)
.s902:
1665 : a9 0f __ LDA #$0f
1667 : d0 06 __ BNE $166f ; (printf.s1115 + 0)
.s901:
1669 : 38 __ __ SEC
166a : a9 10 __ LDA #$10
166c : ed c8 9f SBC $9fc8 ; (si + 2)
.s1115:
166f : a8 __ __ TAY
1670 : c4 40 __ CPY T5 + 0 
1672 : b0 0d __ BCS $1681 ; (printf.s58 + 0)
.s57:
1674 : a9 30 __ LDA #$30
.l1284:
1676 : c6 40 __ DEC T5 + 0 
1678 : a6 40 __ LDX T5 + 0 
167a : 9d b6 9f STA $9fb6,x ; (buffer + 0)
167d : c4 40 __ CPY T5 + 0 
167f : 90 f5 __ BCC $1676 ; (printf.l1284 + 0)
.s58:
1681 : ad cd 9f LDA $9fcd ; (si + 7)
1684 : f0 1f __ BEQ $16a5 ; (printf.s60 + 0)
.s61:
1686 : ad ca 9f LDA $9fca ; (si + 4)
1689 : d0 1a __ BNE $16a5 ; (printf.s60 + 0)
.s1087:
168b : ad c9 9f LDA $9fc9 ; (si + 3)
168e : c9 10 __ CMP #$10
1690 : d0 13 __ BNE $16a5 ; (printf.s60 + 0)
.s59:
1692 : a9 58 __ LDA #$58
1694 : a6 40 __ LDX T5 + 0 
1696 : 9d b5 9f STA $9fb5,x ; (buffer + 15)
1699 : 8a __ __ TXA
169a : 18 __ __ CLC
169b : 69 fe __ ADC #$fe
169d : 85 40 __ STA T5 + 0 
169f : aa __ __ TAX
16a0 : a9 30 __ LDA #$30
16a2 : 9d b6 9f STA $9fb6,x ; (buffer + 0)
.s60:
16a5 : a9 00 __ LDA #$00
16a7 : 85 3f __ STA T4 + 0 
16a9 : a5 42 __ LDA T6 + 0 
16ab : f0 0c __ BEQ $16b9 ; (printf.s63 + 0)
.s62:
16ad : c6 40 __ DEC T5 + 0 
16af : a9 2d __ LDA #$2d
.s1106:
16b1 : a6 40 __ LDX T5 + 0 
16b3 : 9d b6 9f STA $9fb6,x ; (buffer + 0)
16b6 : 4c c4 16 JMP $16c4 ; (printf.s1786 + 0)
.s63:
16b9 : ad cb 9f LDA $9fcb ; (si + 5)
16bc : f0 06 __ BEQ $16c4 ; (printf.s1786 + 0)
.s65:
16be : c6 40 __ DEC T5 + 0 
16c0 : a9 2b __ LDA #$2b
16c2 : d0 ed __ BNE $16b1 ; (printf.s1106 + 0)
.s1786:
16c4 : ad cc 9f LDA $9fcc ; (si + 6)
16c7 : f0 17 __ BEQ $16e0 ; (printf.s1182 + 0)
.l67:
16c9 : a6 40 __ LDX T5 + 0 
16cb : e0 10 __ CPX #$10
16cd : 90 03 __ BCC $16d2 ; (printf.s68 + 0)
16cf : 4c 76 11 JMP $1176 ; (printf.s1180 + 0)
.s68:
16d2 : bd b6 9f LDA $9fb6,x ; (buffer + 0)
16d5 : a6 3f __ LDX T4 + 0 
16d7 : 9d ce 9f STA $9fce,x ; (buff + 0)
16da : e6 3f __ INC T4 + 0 
16dc : e6 40 __ INC T5 + 0 
16de : 90 e9 __ BCC $16c9 ; (printf.l67 + 0)
.s1182:
16e0 : a6 40 __ LDX T5 + 0 
16e2 : 4c ec 16 JMP $16ec ; (printf.l71 + 0)
.s72:
16e5 : ad c6 9f LDA $9fc6 ; (si + 0)
16e8 : 9d b5 9f STA $9fb5,x ; (buffer + 15)
16eb : ca __ __ DEX
.l71:
16ec : 8a __ __ TXA
16ed : 18 __ __ CLC
16ee : 6d c7 9f ADC $9fc7 ; (si + 1)
16f1 : b0 f2 __ BCS $16e5 ; (printf.s72 + 0)
.s1086:
16f3 : c9 11 __ CMP #$11
16f5 : b0 ee __ BCS $16e5 ; (printf.s72 + 0)
.s1183:
16f7 : e0 10 __ CPX #$10
16f9 : 90 03 __ BCC $16fe ; (printf.s74 + 0)
16fb : 4c 5d 11 JMP $115d ; (printf.s66 + 0)
.s74:
16fe : 86 40 __ STX T5 + 0 
1700 : a0 00 __ LDY #$00
.l1268:
1702 : bd b6 9f LDA $9fb6,x ; (buffer + 0)
1705 : 99 ce 9f STA $9fce,y ; (buff + 0)
1708 : e6 40 __ INC T5 + 0 
170a : a6 40 __ LDX T5 + 0 
170c : e0 10 __ CPX #$10
170e : c8 __ __ INY
170f : 90 f1 __ BCC $1702 ; (printf.l1268 + 0)
1711 : 4c 5b 11 JMP $115b ; (printf.s1181 + 0)
.s11:
1714 : aa __ __ TAX
1715 : e6 33 __ INC T0 + 0 
1717 : d0 02 __ BNE $171b ; (printf.s1305 + 0)
.s1304:
1719 : e6 34 __ INC T0 + 1 
.s1305:
171b : 8a __ __ TXA
171c : e0 0a __ CPX #$0a
171e : d0 08 __ BNE $1728 ; (printf.s15 + 0)
.s14:
1720 : a9 0d __ LDA #$0d
.s1099:
1722 : 20 d2 ff JSR $ffd2 
1725 : 4c 19 0a JMP $0a19 ; (printf.l10 + 0)
.s15:
1728 : c9 09 __ CMP #$09
172a : d0 f6 __ BNE $1722 ; (printf.s1099 + 0)
.s16:
172c : a5 d3 __ LDA $d3 
172e : 29 03 __ AND #$03
1730 : 85 37 __ STA T1 + 0 
.l19:
1732 : a9 20 __ LDA #$20
1734 : 20 d2 ff JSR $ffd2 
1737 : e6 37 __ INC T1 + 0 
1739 : a5 37 __ LDA T1 + 0 
173b : c9 04 __ CMP #$04
173d : 90 f3 __ BCC $1732 ; (printf.l19 + 0)
173f : 4c 19 0a JMP $0a19 ; (printf.l10 + 0)
--------------------------------------------------------------------
1742 : __ __ __ BYT 54 49 4d 45 3a 20 25 75 0a 00                   : TIME: %u..
--------------------------------------------------------------------
freg: ; freg
174c : b1 25 __ LDA (IP + 0),y 
174e : c8 __ __ INY
174f : aa __ __ TAX
1750 : b5 00 __ LDA $00,x 
1752 : 85 03 __ STA WORK + 0 
1754 : b5 01 __ LDA $01,x 
1756 : 85 04 __ STA WORK + 1 
1758 : b5 02 __ LDA $02,x 
175a : 85 05 __ STA WORK + 2 
175c : b5 03 __ LDA WORK + 0,x 
175e : 85 06 __ STA WORK + 3 
1760 : a5 05 __ LDA WORK + 2 
1762 : 0a __ __ ASL
1763 : a5 06 __ LDA WORK + 3 
1765 : 2a __ __ ROL
1766 : 85 08 __ STA WORK + 5 
1768 : f0 06 __ BEQ $1770 ; (freg + 36)
176a : a5 05 __ LDA WORK + 2 
176c : 09 80 __ ORA #$80
176e : 85 05 __ STA WORK + 2 
1770 : a5 29 __ LDA ACCU + 2 
1772 : 0a __ __ ASL
1773 : a5 2a __ LDA ACCU + 3 
1775 : 2a __ __ ROL
1776 : 85 07 __ STA WORK + 4 
1778 : f0 06 __ BEQ $1780 ; (freg + 52)
177a : a5 29 __ LDA ACCU + 2 
177c : 09 80 __ ORA #$80
177e : 85 29 __ STA ACCU + 2 
1780 : 60 __ __ RTS
1781 : 06 2a __ ASL ACCU + 3 
1783 : a5 07 __ LDA WORK + 4 
1785 : 6a __ __ ROR
1786 : 85 2a __ STA ACCU + 3 
1788 : b0 06 __ BCS $1790 ; (freg + 68)
178a : a5 29 __ LDA ACCU + 2 
178c : 29 7f __ AND #$7f
178e : 85 29 __ STA ACCU + 2 
1790 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1791 : a5 06 __ LDA WORK + 3 
1793 : 49 80 __ EOR #$80
1795 : 85 06 __ STA WORK + 3 
1797 : a9 ff __ LDA #$ff
1799 : c5 07 __ CMP WORK + 4 
179b : f0 04 __ BEQ $17a1 ; (faddsub + 16)
179d : c5 08 __ CMP WORK + 5 
179f : d0 11 __ BNE $17b2 ; (faddsub + 33)
17a1 : a5 2a __ LDA ACCU + 3 
17a3 : 09 7f __ ORA #$7f
17a5 : 85 2a __ STA ACCU + 3 
17a7 : a9 80 __ LDA #$80
17a9 : 85 29 __ STA ACCU + 2 
17ab : a9 00 __ LDA #$00
17ad : 85 27 __ STA ACCU + 0 
17af : 85 28 __ STA ACCU + 1 
17b1 : 60 __ __ RTS
17b2 : 38 __ __ SEC
17b3 : a5 07 __ LDA WORK + 4 
17b5 : e5 08 __ SBC WORK + 5 
17b7 : f0 38 __ BEQ $17f1 ; (faddsub + 96)
17b9 : aa __ __ TAX
17ba : b0 25 __ BCS $17e1 ; (faddsub + 80)
17bc : e0 e9 __ CPX #$e9
17be : b0 0e __ BCS $17ce ; (faddsub + 61)
17c0 : a5 08 __ LDA WORK + 5 
17c2 : 85 07 __ STA WORK + 4 
17c4 : a9 00 __ LDA #$00
17c6 : 85 27 __ STA ACCU + 0 
17c8 : 85 28 __ STA ACCU + 1 
17ca : 85 29 __ STA ACCU + 2 
17cc : f0 23 __ BEQ $17f1 ; (faddsub + 96)
17ce : a5 29 __ LDA ACCU + 2 
17d0 : 4a __ __ LSR
17d1 : 66 28 __ ROR ACCU + 1 
17d3 : 66 27 __ ROR ACCU + 0 
17d5 : e8 __ __ INX
17d6 : d0 f8 __ BNE $17d0 ; (faddsub + 63)
17d8 : 85 29 __ STA ACCU + 2 
17da : a5 08 __ LDA WORK + 5 
17dc : 85 07 __ STA WORK + 4 
17de : 4c f1 17 JMP $17f1 ; (faddsub + 96)
17e1 : e0 18 __ CPX #$18
17e3 : b0 33 __ BCS $1818 ; (faddsub + 135)
17e5 : a5 05 __ LDA WORK + 2 
17e7 : 4a __ __ LSR
17e8 : 66 04 __ ROR WORK + 1 
17ea : 66 03 __ ROR WORK + 0 
17ec : ca __ __ DEX
17ed : d0 f8 __ BNE $17e7 ; (faddsub + 86)
17ef : 85 05 __ STA WORK + 2 
17f1 : a5 2a __ LDA ACCU + 3 
17f3 : 29 80 __ AND #$80
17f5 : 85 2a __ STA ACCU + 3 
17f7 : 45 06 __ EOR WORK + 3 
17f9 : 30 31 __ BMI $182c ; (faddsub + 155)
17fb : 18 __ __ CLC
17fc : a5 27 __ LDA ACCU + 0 
17fe : 65 03 __ ADC WORK + 0 
1800 : 85 27 __ STA ACCU + 0 
1802 : a5 28 __ LDA ACCU + 1 
1804 : 65 04 __ ADC WORK + 1 
1806 : 85 28 __ STA ACCU + 1 
1808 : a5 29 __ LDA ACCU + 2 
180a : 65 05 __ ADC WORK + 2 
180c : 85 29 __ STA ACCU + 2 
180e : 90 08 __ BCC $1818 ; (faddsub + 135)
1810 : 66 29 __ ROR ACCU + 2 
1812 : 66 28 __ ROR ACCU + 1 
1814 : 66 27 __ ROR ACCU + 0 
1816 : e6 07 __ INC WORK + 4 
1818 : a5 07 __ LDA WORK + 4 
181a : c9 ff __ CMP #$ff
181c : f0 83 __ BEQ $17a1 ; (faddsub + 16)
181e : 4a __ __ LSR
181f : 05 2a __ ORA ACCU + 3 
1821 : 85 2a __ STA ACCU + 3 
1823 : b0 06 __ BCS $182b ; (faddsub + 154)
1825 : a5 29 __ LDA ACCU + 2 
1827 : 29 7f __ AND #$7f
1829 : 85 29 __ STA ACCU + 2 
182b : 60 __ __ RTS
182c : 38 __ __ SEC
182d : a5 27 __ LDA ACCU + 0 
182f : e5 03 __ SBC WORK + 0 
1831 : 85 27 __ STA ACCU + 0 
1833 : a5 28 __ LDA ACCU + 1 
1835 : e5 04 __ SBC WORK + 1 
1837 : 85 28 __ STA ACCU + 1 
1839 : a5 29 __ LDA ACCU + 2 
183b : e5 05 __ SBC WORK + 2 
183d : 85 29 __ STA ACCU + 2 
183f : b0 19 __ BCS $185a ; (faddsub + 201)
1841 : 38 __ __ SEC
1842 : a9 00 __ LDA #$00
1844 : e5 27 __ SBC ACCU + 0 
1846 : 85 27 __ STA ACCU + 0 
1848 : a9 00 __ LDA #$00
184a : e5 28 __ SBC ACCU + 1 
184c : 85 28 __ STA ACCU + 1 
184e : a9 00 __ LDA #$00
1850 : e5 29 __ SBC ACCU + 2 
1852 : 85 29 __ STA ACCU + 2 
1854 : a5 2a __ LDA ACCU + 3 
1856 : 49 80 __ EOR #$80
1858 : 85 2a __ STA ACCU + 3 
185a : a5 29 __ LDA ACCU + 2 
185c : 30 ba __ BMI $1818 ; (faddsub + 135)
185e : 05 28 __ ORA ACCU + 1 
1860 : 05 27 __ ORA ACCU + 0 
1862 : f0 0f __ BEQ $1873 ; (faddsub + 226)
1864 : c6 07 __ DEC WORK + 4 
1866 : f0 0b __ BEQ $1873 ; (faddsub + 226)
1868 : 06 27 __ ASL ACCU + 0 
186a : 26 28 __ ROL ACCU + 1 
186c : 26 29 __ ROL ACCU + 2 
186e : 10 f4 __ BPL $1864 ; (faddsub + 211)
1870 : 4c 18 18 JMP $1818 ; (faddsub + 135)
1873 : a9 00 __ LDA #$00
1875 : 85 27 __ STA ACCU + 0 
1877 : 85 28 __ STA ACCU + 1 
1879 : 85 29 __ STA ACCU + 2 
187b : 85 2a __ STA ACCU + 3 
187d : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
187e : a5 27 __ LDA ACCU + 0 
1880 : 05 28 __ ORA ACCU + 1 
1882 : 05 29 __ ORA ACCU + 2 
1884 : f0 0e __ BEQ $1894 ; (crt_fmul + 22)
1886 : a5 03 __ LDA WORK + 0 
1888 : 05 04 __ ORA WORK + 1 
188a : 05 05 __ ORA WORK + 2 
188c : d0 09 __ BNE $1897 ; (crt_fmul + 25)
188e : 85 27 __ STA ACCU + 0 
1890 : 85 28 __ STA ACCU + 1 
1892 : 85 29 __ STA ACCU + 2 
1894 : 85 2a __ STA ACCU + 3 
1896 : 60 __ __ RTS
1897 : a5 2a __ LDA ACCU + 3 
1899 : 45 06 __ EOR WORK + 3 
189b : 29 80 __ AND #$80
189d : 85 2a __ STA ACCU + 3 
189f : a9 ff __ LDA #$ff
18a1 : c5 07 __ CMP WORK + 4 
18a3 : f0 42 __ BEQ $18e7 ; (crt_fmul + 105)
18a5 : c5 08 __ CMP WORK + 5 
18a7 : f0 3e __ BEQ $18e7 ; (crt_fmul + 105)
18a9 : a9 00 __ LDA #$00
18ab : 85 09 __ STA WORK + 6 
18ad : 85 0a __ STA WORK + 7 
18af : 85 0b __ STA WORK + 8 
18b1 : a4 27 __ LDY ACCU + 0 
18b3 : a5 03 __ LDA WORK + 0 
18b5 : d0 06 __ BNE $18bd ; (crt_fmul + 63)
18b7 : a5 04 __ LDA WORK + 1 
18b9 : f0 0a __ BEQ $18c5 ; (crt_fmul + 71)
18bb : d0 05 __ BNE $18c2 ; (crt_fmul + 68)
18bd : 20 18 19 JSR $1918 ; (crt_fmul8 + 0)
18c0 : a5 04 __ LDA WORK + 1 
18c2 : 20 18 19 JSR $1918 ; (crt_fmul8 + 0)
18c5 : a5 05 __ LDA WORK + 2 
18c7 : 20 18 19 JSR $1918 ; (crt_fmul8 + 0)
18ca : 38 __ __ SEC
18cb : a5 0b __ LDA WORK + 8 
18cd : 30 06 __ BMI $18d5 ; (crt_fmul + 87)
18cf : 06 09 __ ASL WORK + 6 
18d1 : 26 0a __ ROL WORK + 7 
18d3 : 2a __ __ ROL
18d4 : 18 __ __ CLC
18d5 : 29 7f __ AND #$7f
18d7 : 85 0b __ STA WORK + 8 
18d9 : a5 07 __ LDA WORK + 4 
18db : 65 08 __ ADC WORK + 5 
18dd : 90 19 __ BCC $18f8 ; (crt_fmul + 122)
18df : e9 7f __ SBC #$7f
18e1 : b0 04 __ BCS $18e7 ; (crt_fmul + 105)
18e3 : c9 ff __ CMP #$ff
18e5 : d0 15 __ BNE $18fc ; (crt_fmul + 126)
18e7 : a5 2a __ LDA ACCU + 3 
18e9 : 09 7f __ ORA #$7f
18eb : 85 2a __ STA ACCU + 3 
18ed : a9 80 __ LDA #$80
18ef : 85 29 __ STA ACCU + 2 
18f1 : a9 00 __ LDA #$00
18f3 : 85 27 __ STA ACCU + 0 
18f5 : 85 28 __ STA ACCU + 1 
18f7 : 60 __ __ RTS
18f8 : e9 7e __ SBC #$7e
18fa : 90 15 __ BCC $1911 ; (crt_fmul + 147)
18fc : 4a __ __ LSR
18fd : 05 2a __ ORA ACCU + 3 
18ff : 85 2a __ STA ACCU + 3 
1901 : a9 00 __ LDA #$00
1903 : 6a __ __ ROR
1904 : 05 0b __ ORA WORK + 8 
1906 : 85 29 __ STA ACCU + 2 
1908 : a5 0a __ LDA WORK + 7 
190a : 85 28 __ STA ACCU + 1 
190c : a5 09 __ LDA WORK + 6 
190e : 85 27 __ STA ACCU + 0 
1910 : 60 __ __ RTS
1911 : a9 00 __ LDA #$00
1913 : 85 2a __ STA ACCU + 3 
1915 : f0 d8 __ BEQ $18ef ; (crt_fmul + 113)
1917 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1918 : 38 __ __ SEC
1919 : 6a __ __ ROR
191a : 90 1e __ BCC $193a ; (crt_fmul8 + 34)
191c : aa __ __ TAX
191d : 18 __ __ CLC
191e : 98 __ __ TYA
191f : 65 09 __ ADC WORK + 6 
1921 : 85 09 __ STA WORK + 6 
1923 : a5 0a __ LDA WORK + 7 
1925 : 65 28 __ ADC ACCU + 1 
1927 : 85 0a __ STA WORK + 7 
1929 : a5 0b __ LDA WORK + 8 
192b : 65 29 __ ADC ACCU + 2 
192d : 6a __ __ ROR
192e : 85 0b __ STA WORK + 8 
1930 : 8a __ __ TXA
1931 : 66 0a __ ROR WORK + 7 
1933 : 66 09 __ ROR WORK + 6 
1935 : 4a __ __ LSR
1936 : f0 0d __ BEQ $1945 ; (crt_fmul8 + 45)
1938 : b0 e2 __ BCS $191c ; (crt_fmul8 + 4)
193a : 66 0b __ ROR WORK + 8 
193c : 66 0a __ ROR WORK + 7 
193e : 66 09 __ ROR WORK + 6 
1940 : 4a __ __ LSR
1941 : 90 f7 __ BCC $193a ; (crt_fmul8 + 34)
1943 : d0 d7 __ BNE $191c ; (crt_fmul8 + 4)
1945 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1946 : a5 27 __ LDA ACCU + 0 
1948 : 05 28 __ ORA ACCU + 1 
194a : 05 29 __ ORA ACCU + 2 
194c : d0 03 __ BNE $1951 ; (crt_fdiv + 11)
194e : 85 2a __ STA ACCU + 3 
1950 : 60 __ __ RTS
1951 : a5 2a __ LDA ACCU + 3 
1953 : 45 06 __ EOR WORK + 3 
1955 : 29 80 __ AND #$80
1957 : 85 2a __ STA ACCU + 3 
1959 : a5 08 __ LDA WORK + 5 
195b : f0 62 __ BEQ $19bf ; (crt_fdiv + 121)
195d : a5 07 __ LDA WORK + 4 
195f : c9 ff __ CMP #$ff
1961 : f0 5c __ BEQ $19bf ; (crt_fdiv + 121)
1963 : a9 00 __ LDA #$00
1965 : 85 09 __ STA WORK + 6 
1967 : 85 0a __ STA WORK + 7 
1969 : 85 0b __ STA WORK + 8 
196b : a2 18 __ LDX #$18
196d : a5 27 __ LDA ACCU + 0 
196f : c5 03 __ CMP WORK + 0 
1971 : a5 28 __ LDA ACCU + 1 
1973 : e5 04 __ SBC WORK + 1 
1975 : a5 29 __ LDA ACCU + 2 
1977 : e5 05 __ SBC WORK + 2 
1979 : 90 13 __ BCC $198e ; (crt_fdiv + 72)
197b : a5 27 __ LDA ACCU + 0 
197d : e5 03 __ SBC WORK + 0 
197f : 85 27 __ STA ACCU + 0 
1981 : a5 28 __ LDA ACCU + 1 
1983 : e5 04 __ SBC WORK + 1 
1985 : 85 28 __ STA ACCU + 1 
1987 : a5 29 __ LDA ACCU + 2 
1989 : e5 05 __ SBC WORK + 2 
198b : 85 29 __ STA ACCU + 2 
198d : 38 __ __ SEC
198e : 26 09 __ ROL WORK + 6 
1990 : 26 0a __ ROL WORK + 7 
1992 : 26 0b __ ROL WORK + 8 
1994 : ca __ __ DEX
1995 : f0 0a __ BEQ $19a1 ; (crt_fdiv + 91)
1997 : 06 27 __ ASL ACCU + 0 
1999 : 26 28 __ ROL ACCU + 1 
199b : 26 29 __ ROL ACCU + 2 
199d : b0 dc __ BCS $197b ; (crt_fdiv + 53)
199f : 90 cc __ BCC $196d ; (crt_fdiv + 39)
19a1 : 38 __ __ SEC
19a2 : a5 0b __ LDA WORK + 8 
19a4 : 30 06 __ BMI $19ac ; (crt_fdiv + 102)
19a6 : 06 09 __ ASL WORK + 6 
19a8 : 26 0a __ ROL WORK + 7 
19aa : 2a __ __ ROL
19ab : 18 __ __ CLC
19ac : 29 7f __ AND #$7f
19ae : 85 0b __ STA WORK + 8 
19b0 : a5 07 __ LDA WORK + 4 
19b2 : e5 08 __ SBC WORK + 5 
19b4 : 90 1a __ BCC $19d0 ; (crt_fdiv + 138)
19b6 : 18 __ __ CLC
19b7 : 69 7f __ ADC #$7f
19b9 : b0 04 __ BCS $19bf ; (crt_fdiv + 121)
19bb : c9 ff __ CMP #$ff
19bd : d0 15 __ BNE $19d4 ; (crt_fdiv + 142)
19bf : a5 2a __ LDA ACCU + 3 
19c1 : 09 7f __ ORA #$7f
19c3 : 85 2a __ STA ACCU + 3 
19c5 : a9 80 __ LDA #$80
19c7 : 85 29 __ STA ACCU + 2 
19c9 : a9 00 __ LDA #$00
19cb : 85 28 __ STA ACCU + 1 
19cd : 85 27 __ STA ACCU + 0 
19cf : 60 __ __ RTS
19d0 : 69 7f __ ADC #$7f
19d2 : 90 15 __ BCC $19e9 ; (crt_fdiv + 163)
19d4 : 4a __ __ LSR
19d5 : 05 2a __ ORA ACCU + 3 
19d7 : 85 2a __ STA ACCU + 3 
19d9 : a9 00 __ LDA #$00
19db : 6a __ __ ROR
19dc : 05 0b __ ORA WORK + 8 
19de : 85 29 __ STA ACCU + 2 
19e0 : a5 0a __ LDA WORK + 7 
19e2 : 85 28 __ STA ACCU + 1 
19e4 : a5 09 __ LDA WORK + 6 
19e6 : 85 27 __ STA ACCU + 0 
19e8 : 60 __ __ RTS
19e9 : a9 00 __ LDA #$00
19eb : 85 2a __ STA ACCU + 3 
19ed : 85 29 __ STA ACCU + 2 
19ef : 85 28 __ STA ACCU + 1 
19f1 : 85 27 __ STA ACCU + 0 
19f3 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
19f4 : 24 28 __ BIT ACCU + 1 
19f6 : 10 0d __ BPL $1a05 ; (divs16 + 17)
19f8 : 20 0f 1a JSR $1a0f ; (negaccu + 0)
19fb : 24 04 __ BIT WORK + 1 
19fd : 10 0d __ BPL $1a0c ; (divs16 + 24)
19ff : 20 1d 1a JSR $1a1d ; (negtmp + 0)
1a02 : 4c 33 1a JMP $1a33 ; (divmod + 0)
1a05 : 24 04 __ BIT WORK + 1 
1a07 : 10 f9 __ BPL $1a02 ; (divs16 + 14)
1a09 : 20 1d 1a JSR $1a1d ; (negtmp + 0)
1a0c : 20 33 1a JSR $1a33 ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1a0f : 38 __ __ SEC
1a10 : a9 00 __ LDA #$00
1a12 : e5 27 __ SBC ACCU + 0 
1a14 : 85 27 __ STA ACCU + 0 
1a16 : a9 00 __ LDA #$00
1a18 : e5 28 __ SBC ACCU + 1 
1a1a : 85 28 __ STA ACCU + 1 
1a1c : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1a1d : 38 __ __ SEC
1a1e : a9 00 __ LDA #$00
1a20 : e5 03 __ SBC WORK + 0 
1a22 : 85 03 __ STA WORK + 0 
1a24 : a9 00 __ LDA #$00
1a26 : e5 04 __ SBC WORK + 1 
1a28 : 85 04 __ STA WORK + 1 
1a2a : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
1a2b : a9 0a __ LDA #$0a
1a2d : 85 03 __ STA WORK + 0 
1a2f : a9 00 __ LDA #$00
1a31 : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
1a33 : a5 28 __ LDA ACCU + 1 
1a35 : d0 31 __ BNE $1a68 ; (divmod + 53)
1a37 : a5 04 __ LDA WORK + 1 
1a39 : d0 1e __ BNE $1a59 ; (divmod + 38)
1a3b : 85 06 __ STA WORK + 3 
1a3d : a2 04 __ LDX #$04
1a3f : 06 27 __ ASL ACCU + 0 
1a41 : 2a __ __ ROL
1a42 : c5 03 __ CMP WORK + 0 
1a44 : 90 02 __ BCC $1a48 ; (divmod + 21)
1a46 : e5 03 __ SBC WORK + 0 
1a48 : 26 27 __ ROL ACCU + 0 
1a4a : 2a __ __ ROL
1a4b : c5 03 __ CMP WORK + 0 
1a4d : 90 02 __ BCC $1a51 ; (divmod + 30)
1a4f : e5 03 __ SBC WORK + 0 
1a51 : 26 27 __ ROL ACCU + 0 
1a53 : ca __ __ DEX
1a54 : d0 eb __ BNE $1a41 ; (divmod + 14)
1a56 : 85 05 __ STA WORK + 2 
1a58 : 60 __ __ RTS
1a59 : a5 27 __ LDA ACCU + 0 
1a5b : 85 05 __ STA WORK + 2 
1a5d : a5 28 __ LDA ACCU + 1 
1a5f : 85 06 __ STA WORK + 3 
1a61 : a9 00 __ LDA #$00
1a63 : 85 27 __ STA ACCU + 0 
1a65 : 85 28 __ STA ACCU + 1 
1a67 : 60 __ __ RTS
1a68 : a5 04 __ LDA WORK + 1 
1a6a : d0 1f __ BNE $1a8b ; (divmod + 88)
1a6c : a5 03 __ LDA WORK + 0 
1a6e : 30 1b __ BMI $1a8b ; (divmod + 88)
1a70 : a9 00 __ LDA #$00
1a72 : 85 06 __ STA WORK + 3 
1a74 : a2 10 __ LDX #$10
1a76 : 06 27 __ ASL ACCU + 0 
1a78 : 26 28 __ ROL ACCU + 1 
1a7a : 2a __ __ ROL
1a7b : c5 03 __ CMP WORK + 0 
1a7d : 90 02 __ BCC $1a81 ; (divmod + 78)
1a7f : e5 03 __ SBC WORK + 0 
1a81 : 26 27 __ ROL ACCU + 0 
1a83 : 26 28 __ ROL ACCU + 1 
1a85 : ca __ __ DEX
1a86 : d0 f2 __ BNE $1a7a ; (divmod + 71)
1a88 : 85 05 __ STA WORK + 2 
1a8a : 60 __ __ RTS
1a8b : a9 00 __ LDA #$00
1a8d : 85 05 __ STA WORK + 2 
1a8f : 85 06 __ STA WORK + 3 
1a91 : 84 02 __ STY $02 
1a93 : a0 10 __ LDY #$10
1a95 : 18 __ __ CLC
1a96 : 26 27 __ ROL ACCU + 0 
1a98 : 26 28 __ ROL ACCU + 1 
1a9a : 26 05 __ ROL WORK + 2 
1a9c : 26 06 __ ROL WORK + 3 
1a9e : 38 __ __ SEC
1a9f : a5 05 __ LDA WORK + 2 
1aa1 : e5 03 __ SBC WORK + 0 
1aa3 : aa __ __ TAX
1aa4 : a5 06 __ LDA WORK + 3 
1aa6 : e5 04 __ SBC WORK + 1 
1aa8 : 90 04 __ BCC $1aae ; (divmod + 123)
1aaa : 86 05 __ STX WORK + 2 
1aac : 85 06 __ STA WORK + 3 
1aae : 88 __ __ DEY
1aaf : d0 e5 __ BNE $1a96 ; (divmod + 99)
1ab1 : 26 27 __ ROL ACCU + 0 
1ab3 : 26 28 __ ROL ACCU + 1 
1ab5 : a4 02 __ LDY $02 
1ab7 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
1ab8 : 24 28 __ BIT ACCU + 1 
1aba : 10 0d __ BPL $1ac9 ; (mods16 + 17)
1abc : 20 0f 1a JSR $1a0f ; (negaccu + 0)
1abf : 24 04 __ BIT WORK + 1 
1ac1 : 10 0d __ BPL $1ad0 ; (mods16 + 24)
1ac3 : 20 1d 1a JSR $1a1d ; (negtmp + 0)
1ac6 : 4c 33 1a JMP $1a33 ; (divmod + 0)
1ac9 : 24 04 __ BIT WORK + 1 
1acb : 10 f9 __ BPL $1ac6 ; (mods16 + 14)
1acd : 20 1d 1a JSR $1a1d ; (negtmp + 0)
1ad0 : 20 33 1a JSR $1a33 ; (divmod + 0)
1ad3 : 38 __ __ SEC
1ad4 : a9 00 __ LDA #$00
1ad6 : e5 05 __ SBC WORK + 2 
1ad8 : 85 05 __ STA WORK + 2 
1ada : a9 00 __ LDA #$00
1adc : e5 06 __ SBC WORK + 3 
1ade : 85 06 __ STA WORK + 3 
1ae0 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1ae1 : 20 70 17 JSR $1770 ; (freg + 36)
1ae4 : a5 07 __ LDA WORK + 4 
1ae6 : c9 7f __ CMP #$7f
1ae8 : b0 07 __ BCS $1af1 ; (f32_to_i16 + 16)
1aea : a9 00 __ LDA #$00
1aec : 85 27 __ STA ACCU + 0 
1aee : 85 28 __ STA ACCU + 1 
1af0 : 60 __ __ RTS
1af1 : 38 __ __ SEC
1af2 : e9 8e __ SBC #$8e
1af4 : 90 16 __ BCC $1b0c ; (f32_to_i16 + 43)
1af6 : 24 2a __ BIT ACCU + 3 
1af8 : 30 09 __ BMI $1b03 ; (f32_to_i16 + 34)
1afa : a9 ff __ LDA #$ff
1afc : 85 27 __ STA ACCU + 0 
1afe : a9 7f __ LDA #$7f
1b00 : 85 28 __ STA ACCU + 1 
1b02 : 60 __ __ RTS
1b03 : a9 00 __ LDA #$00
1b05 : 85 27 __ STA ACCU + 0 
1b07 : a9 80 __ LDA #$80
1b09 : 85 28 __ STA ACCU + 1 
1b0b : 60 __ __ RTS
1b0c : aa __ __ TAX
1b0d : 46 29 __ LSR ACCU + 2 
1b0f : 66 28 __ ROR ACCU + 1 
1b11 : e8 __ __ INX
1b12 : d0 f9 __ BNE $1b0d ; (f32_to_i16 + 44)
1b14 : 24 2a __ BIT ACCU + 3 
1b16 : 10 0e __ BPL $1b26 ; (f32_to_i16 + 69)
1b18 : 38 __ __ SEC
1b19 : a9 00 __ LDA #$00
1b1b : e5 28 __ SBC ACCU + 1 
1b1d : 85 27 __ STA ACCU + 0 
1b1f : a9 00 __ LDA #$00
1b21 : e5 29 __ SBC ACCU + 2 
1b23 : 85 28 __ STA ACCU + 1 
1b25 : 60 __ __ RTS
1b26 : a5 28 __ LDA ACCU + 1 
1b28 : 85 27 __ STA ACCU + 0 
1b2a : a5 29 __ LDA ACCU + 2 
1b2c : 85 28 __ STA ACCU + 1 
1b2e : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1b2f : 24 28 __ BIT ACCU + 1 
1b31 : 30 03 __ BMI $1b36 ; (sint16_to_float + 7)
1b33 : 4c 4d 1b JMP $1b4d ; (uint16_to_float + 0)
1b36 : 38 __ __ SEC
1b37 : a9 00 __ LDA #$00
1b39 : e5 27 __ SBC ACCU + 0 
1b3b : 85 27 __ STA ACCU + 0 
1b3d : a9 00 __ LDA #$00
1b3f : e5 28 __ SBC ACCU + 1 
1b41 : 85 28 __ STA ACCU + 1 
1b43 : 20 4d 1b JSR $1b4d ; (uint16_to_float + 0)
1b46 : a5 2a __ LDA ACCU + 3 
1b48 : 09 80 __ ORA #$80
1b4a : 85 2a __ STA ACCU + 3 
1b4c : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1b4d : a5 27 __ LDA ACCU + 0 
1b4f : 05 28 __ ORA ACCU + 1 
1b51 : d0 05 __ BNE $1b58 ; (uint16_to_float + 11)
1b53 : 85 29 __ STA ACCU + 2 
1b55 : 85 2a __ STA ACCU + 3 
1b57 : 60 __ __ RTS
1b58 : a2 8e __ LDX #$8e
1b5a : a5 28 __ LDA ACCU + 1 
1b5c : 30 06 __ BMI $1b64 ; (uint16_to_float + 23)
1b5e : ca __ __ DEX
1b5f : 06 27 __ ASL ACCU + 0 
1b61 : 2a __ __ ROL
1b62 : 10 fa __ BPL $1b5e ; (uint16_to_float + 17)
1b64 : 29 7f __ AND #$7f
1b66 : 85 29 __ STA ACCU + 2 
1b68 : a5 27 __ LDA ACCU + 0 
1b6a : 85 28 __ STA ACCU + 1 
1b6c : 8a __ __ TXA
1b6d : 4a __ __ LSR
1b6e : 85 2a __ STA ACCU + 3 
1b70 : a9 00 __ LDA #$00
1b72 : 85 27 __ STA ACCU + 0 
1b74 : 6a __ __ ROR
1b75 : 05 29 __ ORA ACCU + 2 
1b77 : 85 29 __ STA ACCU + 2 
1b79 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32@proxy: ; divmod32@proxy
1b7a : a9 0a __ LDA #$0a
1b7c : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
divmod32: ; divmod32
1b7e : 84 02 __ STY $02 
1b80 : a0 20 __ LDY #$20
1b82 : a9 00 __ LDA #$00
1b84 : 85 07 __ STA WORK + 4 
1b86 : 85 08 __ STA WORK + 5 
1b88 : 85 09 __ STA WORK + 6 
1b8a : 85 0a __ STA WORK + 7 
1b8c : a5 05 __ LDA WORK + 2 
1b8e : 05 06 __ ORA WORK + 3 
1b90 : d0 78 __ BNE $1c0a ; (divmod32 + 140)
1b92 : a5 04 __ LDA WORK + 1 
1b94 : d0 27 __ BNE $1bbd ; (divmod32 + 63)
1b96 : 18 __ __ CLC
1b97 : 26 27 __ ROL ACCU + 0 
1b99 : 26 28 __ ROL ACCU + 1 
1b9b : 26 29 __ ROL ACCU + 2 
1b9d : 26 2a __ ROL ACCU + 3 
1b9f : 2a __ __ ROL
1ba0 : 90 05 __ BCC $1ba7 ; (divmod32 + 41)
1ba2 : e5 03 __ SBC WORK + 0 
1ba4 : 38 __ __ SEC
1ba5 : b0 06 __ BCS $1bad ; (divmod32 + 47)
1ba7 : c5 03 __ CMP WORK + 0 
1ba9 : 90 02 __ BCC $1bad ; (divmod32 + 47)
1bab : e5 03 __ SBC WORK + 0 
1bad : 88 __ __ DEY
1bae : d0 e7 __ BNE $1b97 ; (divmod32 + 25)
1bb0 : 85 07 __ STA WORK + 4 
1bb2 : 26 27 __ ROL ACCU + 0 
1bb4 : 26 28 __ ROL ACCU + 1 
1bb6 : 26 29 __ ROL ACCU + 2 
1bb8 : 26 2a __ ROL ACCU + 3 
1bba : a4 02 __ LDY $02 
1bbc : 60 __ __ RTS
1bbd : a5 2a __ LDA ACCU + 3 
1bbf : d0 10 __ BNE $1bd1 ; (divmod32 + 83)
1bc1 : a6 29 __ LDX ACCU + 2 
1bc3 : 86 2a __ STX ACCU + 3 
1bc5 : a6 28 __ LDX ACCU + 1 
1bc7 : 86 29 __ STX ACCU + 2 
1bc9 : a6 27 __ LDX ACCU + 0 
1bcb : 86 28 __ STX ACCU + 1 
1bcd : 85 27 __ STA ACCU + 0 
1bcf : a0 18 __ LDY #$18
1bd1 : 18 __ __ CLC
1bd2 : 26 27 __ ROL ACCU + 0 
1bd4 : 26 28 __ ROL ACCU + 1 
1bd6 : 26 29 __ ROL ACCU + 2 
1bd8 : 26 2a __ ROL ACCU + 3 
1bda : 26 07 __ ROL WORK + 4 
1bdc : 26 08 __ ROL WORK + 5 
1bde : 90 0c __ BCC $1bec ; (divmod32 + 110)
1be0 : a5 07 __ LDA WORK + 4 
1be2 : e5 03 __ SBC WORK + 0 
1be4 : aa __ __ TAX
1be5 : a5 08 __ LDA WORK + 5 
1be7 : e5 04 __ SBC WORK + 1 
1be9 : 38 __ __ SEC
1bea : b0 0c __ BCS $1bf8 ; (divmod32 + 122)
1bec : 38 __ __ SEC
1bed : a5 07 __ LDA WORK + 4 
1bef : e5 03 __ SBC WORK + 0 
1bf1 : aa __ __ TAX
1bf2 : a5 08 __ LDA WORK + 5 
1bf4 : e5 04 __ SBC WORK + 1 
1bf6 : 90 04 __ BCC $1bfc ; (divmod32 + 126)
1bf8 : 86 07 __ STX WORK + 4 
1bfa : 85 08 __ STA WORK + 5 
1bfc : 88 __ __ DEY
1bfd : d0 d3 __ BNE $1bd2 ; (divmod32 + 84)
1bff : 26 27 __ ROL ACCU + 0 
1c01 : 26 28 __ ROL ACCU + 1 
1c03 : 26 29 __ ROL ACCU + 2 
1c05 : 26 2a __ ROL ACCU + 3 
1c07 : a4 02 __ LDY $02 
1c09 : 60 __ __ RTS
1c0a : a0 10 __ LDY #$10
1c0c : a5 2a __ LDA ACCU + 3 
1c0e : 85 08 __ STA WORK + 5 
1c10 : a5 29 __ LDA ACCU + 2 
1c12 : 85 07 __ STA WORK + 4 
1c14 : a9 00 __ LDA #$00
1c16 : 85 29 __ STA ACCU + 2 
1c18 : 85 2a __ STA ACCU + 3 
1c1a : 18 __ __ CLC
1c1b : 26 27 __ ROL ACCU + 0 
1c1d : 26 28 __ ROL ACCU + 1 
1c1f : 26 07 __ ROL WORK + 4 
1c21 : 26 08 __ ROL WORK + 5 
1c23 : 26 09 __ ROL WORK + 6 
1c25 : 26 0a __ ROL WORK + 7 
1c27 : a5 07 __ LDA WORK + 4 
1c29 : c5 03 __ CMP WORK + 0 
1c2b : a5 08 __ LDA WORK + 5 
1c2d : e5 04 __ SBC WORK + 1 
1c2f : a5 09 __ LDA WORK + 6 
1c31 : e5 05 __ SBC WORK + 2 
1c33 : a5 0a __ LDA WORK + 7 
1c35 : e5 06 __ SBC WORK + 3 
1c37 : 90 18 __ BCC $1c51 ; (divmod32 + 211)
1c39 : a5 07 __ LDA WORK + 4 
1c3b : e5 03 __ SBC WORK + 0 
1c3d : 85 07 __ STA WORK + 4 
1c3f : a5 08 __ LDA WORK + 5 
1c41 : e5 04 __ SBC WORK + 1 
1c43 : 85 08 __ STA WORK + 5 
1c45 : a5 09 __ LDA WORK + 6 
1c47 : e5 05 __ SBC WORK + 2 
1c49 : 85 09 __ STA WORK + 6 
1c4b : a5 0a __ LDA WORK + 7 
1c4d : e5 06 __ SBC WORK + 3 
1c4f : 85 0a __ STA WORK + 7 
1c51 : 88 __ __ DEY
1c52 : d0 c7 __ BNE $1c1b ; (divmod32 + 157)
1c54 : 26 27 __ ROL ACCU + 0 
1c56 : 26 28 __ ROL ACCU + 1 
1c58 : a4 02 __ LDY $02 
1c5a : 60 __ __ RTS
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
1c5b : a9 20 __ LDA #$20
1c5d : 85 05 __ STA WORK + 2 
1c5f : a9 41 __ LDA #$41
1c61 : 85 06 __ STA WORK + 3 
1c63 : 4c 60 17 JMP $1760 ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
1c66 : a5 33 __ LDA $33 
1c68 : 85 27 __ STA ACCU + 0 
1c6a : a5 34 __ LDA $34 
1c6c : 85 28 __ STA ACCU + 1 
1c6e : a5 35 __ LDA $35 
1c70 : 85 29 __ STA ACCU + 2 
1c72 : a5 36 __ LDA $36 
1c74 : 85 2a __ STA ACCU + 3 
1c76 : 4c 50 17 JMP $1750 ; (freg + 4)
--------------------------------------------------------------------
spentry:
1c79 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
tm:
1c7a : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
tile:
1c7c : __ __ __ BYT 51 52 53 54                                     : QRST
--------------------------------------------------------------------
fround5:
1c80 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1c90 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
