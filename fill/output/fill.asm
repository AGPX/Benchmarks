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
080e : 8e 3a 1a STX $1a3a ; (spentry + 0)
0811 : a2 1a __ LDX #$1a
0813 : a0 5e __ LDY #$5e
0815 : a9 00 __ LDA #$00
0817 : 85 25 __ STA IP + 0 
0819 : 86 26 __ STX IP + 1 
081b : e0 1a __ CPX #$1a
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 25 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 25 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 5e __ CPY #$5e
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 80 __ LDX #$80
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 80 __ CPX #$80
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 b4 __ LDA #$b4
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
088b : a9 d3 __ LDA #$d3
088d : 8d 14 03 STA $0314 
0890 : a9 08 __ LDA #$08
0892 : 8d 15 03 STA $0315 
0895 : a9 00 __ LDA #$00
0897 : 85 0d __ STA P0 
.l1004:
0899 : 20 df 08 JSR $08df ; (draw.s0 + 0)
089c : e6 0d __ INC P0 
089e : a5 0d __ LDA P0 
08a0 : c9 64 __ CMP #$64
08a2 : 90 f5 __ BCC $0899 ; (main.l1004 + 0)
.s5:
08a4 : 20 41 09 JSR $0941 ; (clear.s0 + 0)
08a7 : a9 2a __ LDA #$2a
08a9 : a0 02 __ LDY #$02
08ab : 91 2f __ STA (SP + 0),y 
08ad : a9 15 __ LDA #$15
08af : c8 __ __ INY
08b0 : 91 2f __ STA (SP + 0),y 
08b2 : ad 3b 1a LDA $1a3b ; (tm + 0)
08b5 : c8 __ __ INY
08b6 : 91 2f __ STA (SP + 0),y 
08b8 : ad 3c 1a LDA $1a3c ; (tm + 1)
08bb : c8 __ __ INY
08bc : 91 2f __ STA (SP + 0),y 
08be : 20 45 09 JSR $0945 ; (printf.s0 + 0)
08c1 : a9 00 __ LDA #$00
08c3 : 85 27 __ STA ACCU + 0 
08c5 : 85 28 __ STA ACCU + 1 
.s1001:
08c7 : 18 __ __ CLC
08c8 : a5 2f __ LDA SP + 0 
08ca : 69 06 __ ADC #$06
08cc : 85 2f __ STA SP + 0 
08ce : 90 02 __ BCC $08d2 ; (main.s1001 + 11)
08d0 : e6 30 __ INC SP + 1 
08d2 : 60 __ __ RTS
--------------------------------------------------------------------
timer: ; timer()->void
.s0:
08d3 : ee 3b 1a INC $1a3b ; (tm + 0)
08d6 : d0 03 __ BNE $08db ; (timer.s1003 + 0)
.s1002:
08d8 : ee 3c 1a INC $1a3c ; (tm + 1)
.s1003:
08db : 4c 31 ea JMP $ea31 
.s1001:
08de : 60 __ __ RTS
--------------------------------------------------------------------
draw: ; draw(const u8)->void
.s0:
08df : a9 00 __ LDA #$00
08e1 : 85 27 __ STA ACCU + 0 
08e3 : a9 04 __ LDA #$04
08e5 : 85 28 __ STA ACCU + 1 
.l2:
08e7 : a5 27 __ LDA ACCU + 0 
08e9 : 85 33 __ STA T1 + 0 
08eb : a5 28 __ LDA ACCU + 1 
08ed : 85 34 __ STA T1 + 1 
08ef : a9 14 __ LDA #$14
08f1 : 85 29 __ STA ACCU + 2 
.l6:
08f3 : a5 33 __ LDA T1 + 0 
08f5 : 85 35 __ STA T2 + 0 
08f7 : a5 34 __ LDA T1 + 1 
08f9 : 85 36 __ STA T2 + 1 
08fb : a9 02 __ LDA #$02
08fd : 85 2a __ STA ACCU + 3 
08ff : a2 00 __ LDX #$00
.l14:
0901 : a0 00 __ LDY #$00
.l1004:
0903 : bd 3d 1a LDA $1a3d,x ; (tile + 0)
0906 : 91 35 __ STA (T2 + 0),y 
0908 : e8 __ __ INX
0909 : c8 __ __ INY
090a : c0 02 __ CPY #$02
090c : 90 f5 __ BCC $0903 ; (draw.l1004 + 0)
.s1005:
090e : a5 35 __ LDA T2 + 0 
0910 : 69 27 __ ADC #$27
0912 : 85 35 __ STA T2 + 0 
0914 : 90 02 __ BCC $0918 ; (draw.s1007 + 0)
.s1006:
0916 : e6 36 __ INC T2 + 1 
.s1007:
0918 : c6 2a __ DEC ACCU + 3 
091a : d0 e5 __ BNE $0901 ; (draw.l14 + 0)
.s12:
091c : 18 __ __ CLC
091d : a5 33 __ LDA T1 + 0 
091f : 69 02 __ ADC #$02
0921 : 85 33 __ STA T1 + 0 
0923 : 90 02 __ BCC $0927 ; (draw.s1009 + 0)
.s1008:
0925 : e6 34 __ INC T1 + 1 
.s1009:
0927 : c6 29 __ DEC ACCU + 2 
0929 : d0 c8 __ BNE $08f3 ; (draw.l6 + 0)
.s8:
092b : 18 __ __ CLC
092c : a5 27 __ LDA ACCU + 0 
092e : 69 50 __ ADC #$50
0930 : 85 27 __ STA ACCU + 0 
0932 : 90 02 __ BCC $0936 ; (draw.s1011 + 0)
.s1010:
0934 : e6 28 __ INC ACCU + 1 
.s1011:
0936 : c9 c0 __ CMP #$c0
0938 : d0 ad __ BNE $08e7 ; (draw.l2 + 0)
.s1002:
093a : a5 28 __ LDA ACCU + 1 
093c : c9 07 __ CMP #$07
093e : d0 a7 __ BNE $08e7 ; (draw.l2 + 0)
.s1001:
0940 : 60 __ __ RTS
--------------------------------------------------------------------
clear: ; clear()->void
.s0:
0941 : 20 44 e5 JSR $e544 
.s1001:
0944 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
0945 : a9 01 __ LDA #$01
0947 : 85 20 __ STA P19 
0949 : a9 b6 __ LDA #$b6
094b : 85 1a __ STA P13 
094d : a9 9f __ LDA #$9f
094f : 85 1b __ STA P14 
0951 : a0 02 __ LDY #$02
0953 : b1 2f __ LDA (SP + 0),y 
0955 : 85 1c __ STA P15 
0957 : c8 __ __ INY
0958 : b1 2f __ LDA (SP + 0),y 
095a : 85 1d __ STA P16 
095c : 18 __ __ CLC
095d : a5 2f __ LDA SP + 0 
095f : 69 04 __ ADC #$04
0961 : 85 1e __ STA P17 
0963 : a5 30 __ LDA SP + 1 
0965 : 69 00 __ ADC #$00
0967 : 85 1f __ STA P18 
0969 : 4c 6c 09 JMP $096c ; (sformat.s0 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s0:
096c : a9 00 __ LDA #$00
.l1002:
096e : 85 47 __ STA T2 + 0 
.l1:
0970 : a0 00 __ LDY #$00
0972 : b1 1c __ LDA (P15),y ; (fmt + 0)
0974 : d0 2b __ BNE $09a1 ; (sformat.s2 + 0)
.s3:
0976 : a4 47 __ LDY T2 + 0 
0978 : 91 1a __ STA (P13),y ; (buff + 0)
097a : 98 __ __ TYA
097b : f0 1d __ BEQ $099a ; (sformat.s1004 + 0)
.s82:
097d : a5 20 __ LDA P19 ; (print + 0)
097f : d0 0e __ BNE $098f ; (sformat.s84 + 0)
.s85:
0981 : 98 __ __ TYA
0982 : 18 __ __ CLC
0983 : 65 1a __ ADC P13 ; (buff + 0)
0985 : aa __ __ TAX
0986 : a5 1b __ LDA P14 ; (buff + 1)
0988 : 69 00 __ ADC #$00
.s1001:
098a : 86 27 __ STX ACCU + 0 
098c : 85 28 __ STA ACCU + 1 
098e : 60 __ __ RTS
.s84:
098f : a5 1a __ LDA P13 ; (buff + 0)
0991 : 85 0e __ STA P1 
0993 : a5 1b __ LDA P14 ; (buff + 1)
0995 : 85 0f __ STA P2 
0997 : 20 14 0d JSR $0d14 ; (puts.l1 + 0)
.s1004:
099a : a5 1b __ LDA P14 ; (buff + 1)
099c : a6 1a __ LDX P13 ; (buff + 0)
099e : 4c 8a 09 JMP $098a ; (sformat.s1001 + 0)
.s2:
09a1 : c9 25 __ CMP #$25
09a3 : f0 3d __ BEQ $09e2 ; (sformat.s4 + 0)
.s5:
09a5 : a4 47 __ LDY T2 + 0 
09a7 : 91 1a __ STA (P13),y ; (buff + 0)
09a9 : e6 1c __ INC P15 ; (fmt + 0)
09ab : d0 02 __ BNE $09af ; (sformat.s1041 + 0)
.s1040:
09ad : e6 1d __ INC P16 ; (fmt + 1)
.s1041:
09af : c8 __ __ INY
09b0 : 84 47 __ STY T2 + 0 
09b2 : 98 __ __ TYA
09b3 : c0 28 __ CPY #$28
09b5 : 90 b9 __ BCC $0970 ; (sformat.l1 + 0)
.s79:
09b7 : 85 33 __ STA T0 + 0 
09b9 : a9 00 __ LDA #$00
09bb : 85 47 __ STA T2 + 0 
09bd : a5 20 __ LDA P19 ; (print + 0)
09bf : f0 14 __ BEQ $09d5 ; (sformat.s81 + 0)
.s80:
09c1 : a5 1a __ LDA P13 ; (buff + 0)
09c3 : 85 0e __ STA P1 
09c5 : a5 1b __ LDA P14 ; (buff + 1)
09c7 : 85 0f __ STA P2 
09c9 : a9 00 __ LDA #$00
09cb : a4 33 __ LDY T0 + 0 
09cd : 91 1a __ STA (P13),y ; (buff + 0)
09cf : 20 14 0d JSR $0d14 ; (puts.l1 + 0)
09d2 : 4c 70 09 JMP $0970 ; (sformat.l1 + 0)
.s81:
09d5 : 18 __ __ CLC
09d6 : a5 1a __ LDA P13 ; (buff + 0)
09d8 : 65 33 __ ADC T0 + 0 
09da : 85 1a __ STA P13 ; (buff + 0)
09dc : 90 92 __ BCC $0970 ; (sformat.l1 + 0)
.s1042:
09de : e6 1b __ INC P14 ; (buff + 1)
09e0 : b0 8e __ BCS $0970 ; (sformat.l1 + 0)
.s4:
09e2 : a5 47 __ LDA T2 + 0 
09e4 : f0 26 __ BEQ $0a0c ; (sformat.s7 + 0)
.s6:
09e6 : 84 47 __ STY T2 + 0 
09e8 : 85 33 __ STA T0 + 0 
09ea : a5 20 __ LDA P19 ; (print + 0)
09ec : f0 13 __ BEQ $0a01 ; (sformat.s9 + 0)
.s8:
09ee : a5 1a __ LDA P13 ; (buff + 0)
09f0 : 85 0e __ STA P1 
09f2 : a5 1b __ LDA P14 ; (buff + 1)
09f4 : 85 0f __ STA P2 
09f6 : 98 __ __ TYA
09f7 : a4 33 __ LDY T0 + 0 
09f9 : 91 1a __ STA (P13),y ; (buff + 0)
09fb : 20 14 0d JSR $0d14 ; (puts.l1 + 0)
09fe : 4c 0c 0a JMP $0a0c ; (sformat.s7 + 0)
.s9:
0a01 : 18 __ __ CLC
0a02 : a5 1a __ LDA P13 ; (buff + 0)
0a04 : 65 33 __ ADC T0 + 0 
0a06 : 85 1a __ STA P13 ; (buff + 0)
0a08 : 90 02 __ BCC $0a0c ; (sformat.s7 + 0)
.s1038:
0a0a : e6 1b __ INC P14 ; (buff + 1)
.s7:
0a0c : a9 00 __ LDA #$00
0a0e : 8d ec 9f STA $9fec ; (si + 4)
0a11 : 8d ed 9f STA $9fed ; (si + 5)
0a14 : 8d ee 9f STA $9fee ; (si + 6)
0a17 : 8d ef 9f STA $9fef ; (si + 7)
0a1a : a9 0a __ LDA #$0a
0a1c : 8d eb 9f STA $9feb ; (si + 3)
0a1f : a0 01 __ LDY #$01
0a21 : b1 1c __ LDA (P15),y ; (fmt + 0)
0a23 : 85 45 __ STA T1 + 0 
0a25 : 85 19 __ STA P12 
0a27 : a9 20 __ LDA #$20
0a29 : 8d e8 9f STA $9fe8 ; (si + 0)
0a2c : a9 00 __ LDA #$00
0a2e : 8d e9 9f STA $9fe9 ; (si + 1)
0a31 : a9 ff __ LDA #$ff
0a33 : 8d ea 9f STA $9fea ; (si + 2)
0a36 : 18 __ __ CLC
0a37 : a5 1c __ LDA P15 ; (fmt + 0)
0a39 : 69 02 __ ADC #$02
0a3b : 85 1c __ STA P15 ; (fmt + 0)
0a3d : 90 02 __ BCC $0a41 ; (sformat.l1021 + 0)
.s1022:
0a3f : e6 1d __ INC P16 ; (fmt + 1)
.l1021:
0a41 : a5 19 __ LDA P12 
0a43 : c9 2b __ CMP #$2b
0a45 : d0 08 __ BNE $0a4f ; (sformat.s12 + 0)
.s11:
0a47 : a9 01 __ LDA #$01
0a49 : 8d ed 9f STA $9fed ; (si + 5)
0a4c : 4c 02 0d JMP $0d02 ; (sformat.s240 + 0)
.s12:
0a4f : c9 30 __ CMP #$30
0a51 : d0 06 __ BNE $0a59 ; (sformat.s14 + 0)
.s13:
0a53 : 8d e8 9f STA $9fe8 ; (si + 0)
0a56 : 4c 02 0d JMP $0d02 ; (sformat.s240 + 0)
.s14:
0a59 : c9 23 __ CMP #$23
0a5b : d0 08 __ BNE $0a65 ; (sformat.s16 + 0)
.s15:
0a5d : a9 01 __ LDA #$01
0a5f : 8d ef 9f STA $9fef ; (si + 7)
0a62 : 4c 02 0d JMP $0d02 ; (sformat.s240 + 0)
.s16:
0a65 : c9 2d __ CMP #$2d
0a67 : d0 08 __ BNE $0a71 ; (sformat.s10 + 0)
.s17:
0a69 : a9 01 __ LDA #$01
0a6b : 8d ee 9f STA $9fee ; (si + 6)
0a6e : 4c 02 0d JMP $0d02 ; (sformat.s240 + 0)
.s10:
0a71 : c9 30 __ CMP #$30
0a73 : 90 39 __ BCC $0aae ; (sformat.s19 + 0)
.s20:
0a75 : c9 3a __ CMP #$3a
0a77 : b0 35 __ BCS $0aae ; (sformat.s19 + 0)
.s18:
0a79 : a9 00 __ LDA #$00
0a7b : 85 33 __ STA T0 + 0 
0a7d : a5 45 __ LDA T1 + 0 
0a7f : c9 3a __ CMP #$3a
0a81 : b0 26 __ BCS $0aa9 ; (sformat.s22 + 0)
.l21:
0a83 : a5 33 __ LDA T0 + 0 
0a85 : 0a __ __ ASL
0a86 : 0a __ __ ASL
0a87 : 18 __ __ CLC
0a88 : 65 33 __ ADC T0 + 0 
0a8a : 0a __ __ ASL
0a8b : 18 __ __ CLC
0a8c : 65 45 __ ADC T1 + 0 
0a8e : 38 __ __ SEC
0a8f : e9 30 __ SBC #$30
0a91 : 85 33 __ STA T0 + 0 
0a93 : a0 00 __ LDY #$00
0a95 : b1 1c __ LDA (P15),y ; (fmt + 0)
0a97 : 85 45 __ STA T1 + 0 
0a99 : 85 19 __ STA P12 
0a9b : e6 1c __ INC P15 ; (fmt + 0)
0a9d : d0 02 __ BNE $0aa1 ; (sformat.s1037 + 0)
.s1036:
0a9f : e6 1d __ INC P16 ; (fmt + 1)
.s1037:
0aa1 : c9 30 __ CMP #$30
0aa3 : 90 04 __ BCC $0aa9 ; (sformat.s22 + 0)
.s23:
0aa5 : c9 3a __ CMP #$3a
0aa7 : 90 da __ BCC $0a83 ; (sformat.l21 + 0)
.s22:
0aa9 : a6 33 __ LDX T0 + 0 
0aab : 8e e9 9f STX $9fe9 ; (si + 1)
.s19:
0aae : c9 2e __ CMP #$2e
0ab0 : d0 2d __ BNE $0adf ; (sformat.s25 + 0)
.s24:
0ab2 : a9 00 __ LDA #$00
0ab4 : f0 0e __ BEQ $0ac4 ; (sformat.l244 + 0)
.s26:
0ab6 : a5 33 __ LDA T0 + 0 
0ab8 : 0a __ __ ASL
0ab9 : 0a __ __ ASL
0aba : 18 __ __ CLC
0abb : 65 33 __ ADC T0 + 0 
0abd : 0a __ __ ASL
0abe : 18 __ __ CLC
0abf : 65 19 __ ADC P12 
0ac1 : 38 __ __ SEC
0ac2 : e9 30 __ SBC #$30
.l244:
0ac4 : 85 33 __ STA T0 + 0 
0ac6 : a0 00 __ LDY #$00
0ac8 : b1 1c __ LDA (P15),y ; (fmt + 0)
0aca : 85 19 __ STA P12 
0acc : e6 1c __ INC P15 ; (fmt + 0)
0ace : d0 02 __ BNE $0ad2 ; (sformat.s1025 + 0)
.s1024:
0ad0 : e6 1d __ INC P16 ; (fmt + 1)
.s1025:
0ad2 : c9 30 __ CMP #$30
0ad4 : 90 04 __ BCC $0ada ; (sformat.s27 + 0)
.s28:
0ad6 : c9 3a __ CMP #$3a
0ad8 : 90 dc __ BCC $0ab6 ; (sformat.s26 + 0)
.s27:
0ada : a6 33 __ LDX T0 + 0 
0adc : 8e ea 9f STX $9fea ; (si + 2)
.s25:
0adf : c9 64 __ CMP #$64
0ae1 : f0 0c __ BEQ $0aef ; (sformat.s29 + 0)
.s33:
0ae3 : c9 44 __ CMP #$44
0ae5 : f0 08 __ BEQ $0aef ; (sformat.s29 + 0)
.s32:
0ae7 : c9 69 __ CMP #$69
0ae9 : f0 04 __ BEQ $0aef ; (sformat.s29 + 0)
.s31:
0aeb : c9 49 __ CMP #$49
0aed : d0 05 __ BNE $0af4 ; (sformat.s30 + 0)
.s29:
0aef : a9 01 __ LDA #$01
0af1 : 4c d4 0c JMP $0cd4 ; (sformat.s261 + 0)
.s30:
0af4 : c9 75 __ CMP #$75
0af6 : f0 04 __ BEQ $0afc ; (sformat.s1110 + 0)
.s36:
0af8 : c9 55 __ CMP #$55
0afa : d0 05 __ BNE $0b01 ; (sformat.s35 + 0)
.s1110:
0afc : a9 00 __ LDA #$00
0afe : 4c d4 0c JMP $0cd4 ; (sformat.s261 + 0)
.s35:
0b01 : c9 78 __ CMP #$78
0b03 : f0 04 __ BEQ $0b09 ; (sformat.s37 + 0)
.s39:
0b05 : c9 58 __ CMP #$58
0b07 : d0 0d __ BNE $0b16 ; (sformat.s38 + 0)
.s37:
0b09 : a9 10 __ LDA #$10
0b0b : 8d eb 9f STA $9feb ; (si + 3)
0b0e : a9 00 __ LDA #$00
0b10 : 8d ec 9f STA $9fec ; (si + 4)
0b13 : 4c d4 0c JMP $0cd4 ; (sformat.s261 + 0)
.s38:
0b16 : c9 6c __ CMP #$6c
0b18 : d0 03 __ BNE $0b1d ; (sformat.s42 + 0)
0b1a : 4c 5b 0c JMP $0c5b ; (sformat.s40 + 0)
.s42:
0b1d : c9 4c __ CMP #$4c
0b1f : f0 f9 __ BEQ $0b1a ; (sformat.s38 + 4)
.s41:
0b21 : c9 66 __ CMP #$66
0b23 : d0 03 __ BNE $0b28 ; (sformat.s57 + 0)
0b25 : 4c 21 0c JMP $0c21 ; (sformat.s51 + 0)
.s57:
0b28 : c9 67 __ CMP #$67
0b2a : f0 f9 __ BEQ $0b25 ; (sformat.s41 + 4)
.s56:
0b2c : c9 65 __ CMP #$65
0b2e : f0 f5 __ BEQ $0b25 ; (sformat.s41 + 4)
.s55:
0b30 : c9 46 __ CMP #$46
0b32 : f0 f1 __ BEQ $0b25 ; (sformat.s41 + 4)
.s54:
0b34 : c9 47 __ CMP #$47
0b36 : f0 ed __ BEQ $0b25 ; (sformat.s41 + 4)
.s53:
0b38 : c9 45 __ CMP #$45
0b3a : f0 e9 __ BEQ $0b25 ; (sformat.s41 + 4)
.s52:
0b3c : c9 73 __ CMP #$73
0b3e : f0 2f __ BEQ $0b6f ; (sformat.s58 + 0)
.s60:
0b40 : c9 53 __ CMP #$53
0b42 : f0 2b __ BEQ $0b6f ; (sformat.s58 + 0)
.s59:
0b44 : c9 63 __ CMP #$63
0b46 : f0 13 __ BEQ $0b5b ; (sformat.s75 + 0)
.s77:
0b48 : c9 43 __ CMP #$43
0b4a : f0 0f __ BEQ $0b5b ; (sformat.s75 + 0)
.s76:
0b4c : aa __ __ TAX
0b4d : d0 03 __ BNE $0b52 ; (sformat.s263 + 0)
0b4f : 4c 70 09 JMP $0970 ; (sformat.l1 + 0)
.s263:
0b52 : a4 47 __ LDY T2 + 0 
0b54 : 91 1a __ STA (P13),y ; (buff + 0)
0b56 : e6 47 __ INC T2 + 0 
0b58 : 4c 70 09 JMP $0970 ; (sformat.l1 + 0)
.s75:
0b5b : a0 00 __ LDY #$00
0b5d : b1 1e __ LDA (P17),y ; (fps + 0)
0b5f : a8 __ __ TAY
0b60 : 18 __ __ CLC
0b61 : a5 1e __ LDA P17 ; (fps + 0)
0b63 : 69 02 __ ADC #$02
0b65 : 85 1e __ STA P17 ; (fps + 0)
0b67 : 90 02 __ BCC $0b6b ; (sformat.s1035 + 0)
.s1034:
0b69 : e6 1f __ INC P18 ; (fps + 1)
.s1035:
0b6b : 98 __ __ TYA
0b6c : 4c 52 0b JMP $0b52 ; (sformat.s263 + 0)
.s58:
0b6f : a0 00 __ LDY #$00
0b71 : 84 48 __ STY T7 + 0 
0b73 : b1 1e __ LDA (P17),y ; (fps + 0)
0b75 : 85 45 __ STA T1 + 0 
0b77 : a5 1e __ LDA P17 ; (fps + 0)
0b79 : 85 33 __ STA T0 + 0 
0b7b : 18 __ __ CLC
0b7c : 69 02 __ ADC #$02
0b7e : 85 1e __ STA P17 ; (fps + 0)
0b80 : a5 1f __ LDA P18 ; (fps + 1)
0b82 : 85 34 __ STA T0 + 1 
0b84 : 69 00 __ ADC #$00
0b86 : 85 1f __ STA P18 ; (fps + 1)
0b88 : c8 __ __ INY
0b89 : b1 33 __ LDA (T0 + 0),y 
0b8b : 85 46 __ STA T1 + 1 
0b8d : ad e9 9f LDA $9fe9 ; (si + 1)
0b90 : f0 0c __ BEQ $0b9e ; (sformat.s61 + 0)
.s1014:
0b92 : 88 __ __ DEY
0b93 : b1 45 __ LDA (T1 + 0),y 
0b95 : f0 05 __ BEQ $0b9c ; (sformat.s1015 + 0)
.l63:
0b97 : c8 __ __ INY
0b98 : b1 45 __ LDA (T1 + 0),y 
0b9a : d0 fb __ BNE $0b97 ; (sformat.l63 + 0)
.s1015:
0b9c : 84 48 __ STY T7 + 0 
.s61:
0b9e : ad ee 9f LDA $9fee ; (si + 6)
0ba1 : 85 37 __ STA T5 + 0 
0ba3 : d0 19 __ BNE $0bbe ; (sformat.s64 + 0)
.s1011:
0ba5 : a6 48 __ LDX T7 + 0 
0ba7 : ec e9 9f CPX $9fe9 ; (si + 1)
0baa : a4 47 __ LDY T2 + 0 
0bac : b0 0c __ BCS $0bba ; (sformat.s1012 + 0)
.l66:
0bae : ad e8 9f LDA $9fe8 ; (si + 0)
0bb1 : 91 1a __ STA (P13),y ; (buff + 0)
0bb3 : c8 __ __ INY
0bb4 : e8 __ __ INX
0bb5 : ec e9 9f CPX $9fe9 ; (si + 1)
0bb8 : 90 f4 __ BCC $0bae ; (sformat.l66 + 0)
.s1012:
0bba : 86 48 __ STX T7 + 0 
0bbc : 84 47 __ STY T2 + 0 
.s64:
0bbe : a5 20 __ LDA P19 ; (print + 0)
0bc0 : d0 36 __ BNE $0bf8 ; (sformat.s67 + 0)
.l71:
0bc2 : a0 00 __ LDY #$00
0bc4 : b1 45 __ LDA (T1 + 0),y 
0bc6 : f0 0f __ BEQ $0bd7 ; (sformat.s68 + 0)
.s72:
0bc8 : a4 47 __ LDY T2 + 0 
0bca : 91 1a __ STA (P13),y ; (buff + 0)
0bcc : e6 47 __ INC T2 + 0 
0bce : e6 45 __ INC T1 + 0 
0bd0 : d0 f0 __ BNE $0bc2 ; (sformat.l71 + 0)
.s1032:
0bd2 : e6 46 __ INC T1 + 1 
0bd4 : 4c c2 0b JMP $0bc2 ; (sformat.l71 + 0)
.s68:
0bd7 : a5 37 __ LDA T5 + 0 
0bd9 : d0 03 __ BNE $0bde ; (sformat.s1008 + 0)
0bdb : 4c 70 09 JMP $0970 ; (sformat.l1 + 0)
.s1008:
0bde : a6 48 __ LDX T7 + 0 
0be0 : ec e9 9f CPX $9fe9 ; (si + 1)
0be3 : a4 47 __ LDY T2 + 0 
0be5 : b0 0c __ BCS $0bf3 ; (sformat.s1016 + 0)
.l74:
0be7 : ad e8 9f LDA $9fe8 ; (si + 0)
0bea : 91 1a __ STA (P13),y ; (buff + 0)
0bec : c8 __ __ INY
0bed : e8 __ __ INX
0bee : ec e9 9f CPX $9fe9 ; (si + 1)
0bf1 : 90 f4 __ BCC $0be7 ; (sformat.l74 + 0)
.s1016:
0bf3 : 84 47 __ STY T2 + 0 
0bf5 : 4c 70 09 JMP $0970 ; (sformat.l1 + 0)
.s67:
0bf8 : a5 47 __ LDA T2 + 0 
0bfa : f0 12 __ BEQ $0c0e ; (sformat.s264 + 0)
.s69:
0bfc : a6 1a __ LDX P13 ; (buff + 0)
0bfe : 86 0e __ STX P1 
0c00 : a6 1b __ LDX P14 ; (buff + 1)
0c02 : 86 0f __ STX P2 
0c04 : a8 __ __ TAY
0c05 : a9 00 __ LDA #$00
0c07 : 85 47 __ STA T2 + 0 
0c09 : 91 1a __ STA (P13),y ; (buff + 0)
0c0b : 20 14 0d JSR $0d14 ; (puts.l1 + 0)
.s264:
0c0e : a5 45 __ LDA T1 + 0 
0c10 : 85 0e __ STA P1 
0c12 : a5 46 __ LDA T1 + 1 
0c14 : 85 0f __ STA P2 
0c16 : 20 14 0d JSR $0d14 ; (puts.l1 + 0)
0c19 : ad ee 9f LDA $9fee ; (si + 6)
0c1c : d0 c0 __ BNE $0bde ; (sformat.s1008 + 0)
0c1e : 4c 70 09 JMP $0970 ; (sformat.l1 + 0)
.s51:
0c21 : a5 1a __ LDA P13 ; (buff + 0)
0c23 : 85 13 __ STA P6 
0c25 : a5 1b __ LDA P14 ; (buff + 1)
0c27 : 85 14 __ STA P7 
0c29 : a9 e8 __ LDA #$e8
0c2b : 85 11 __ STA P4 
0c2d : a9 9f __ LDA #$9f
0c2f : 85 12 __ STA P5 
0c31 : a0 00 __ LDY #$00
0c33 : b1 1e __ LDA (P17),y ; (fps + 0)
0c35 : 85 15 __ STA P8 
0c37 : c8 __ __ INY
0c38 : b1 1e __ LDA (P17),y ; (fps + 0)
0c3a : 85 16 __ STA P9 
0c3c : c8 __ __ INY
0c3d : b1 1e __ LDA (P17),y ; (fps + 0)
0c3f : 85 17 __ STA P10 
0c41 : c8 __ __ INY
0c42 : b1 1e __ LDA (P17),y ; (fps + 0)
0c44 : 85 18 __ STA P11 
0c46 : 20 43 10 JSR $1043 ; (nformf.s0 + 0)
0c49 : a5 27 __ LDA ACCU + 0 
0c4b : 85 47 __ STA T2 + 0 
0c4d : 18 __ __ CLC
0c4e : a5 1e __ LDA P17 ; (fps + 0)
0c50 : 69 04 __ ADC #$04
0c52 : 85 1e __ STA P17 ; (fps + 0)
0c54 : 90 c8 __ BCC $0c1e ; (sformat.s264 + 16)
.s1030:
0c56 : e6 1f __ INC P18 ; (fps + 1)
0c58 : 4c 70 09 JMP $0970 ; (sformat.l1 + 0)
.s40:
0c5b : a5 1e __ LDA P17 ; (fps + 0)
0c5d : 85 33 __ STA T0 + 0 
0c5f : 18 __ __ CLC
0c60 : 69 04 __ ADC #$04
0c62 : 85 1e __ STA P17 ; (fps + 0)
0c64 : a5 1f __ LDA P18 ; (fps + 1)
0c66 : 85 34 __ STA T0 + 1 
0c68 : 69 00 __ ADC #$00
0c6a : 85 1f __ STA P18 ; (fps + 1)
0c6c : a0 00 __ LDY #$00
0c6e : b1 1c __ LDA (P15),y ; (fmt + 0)
0c70 : aa __ __ TAX
0c71 : e6 1c __ INC P15 ; (fmt + 0)
0c73 : d0 02 __ BNE $0c77 ; (sformat.s1029 + 0)
.s1028:
0c75 : e6 1d __ INC P16 ; (fmt + 1)
.s1029:
0c77 : b1 33 __ LDA (T0 + 0),y 
0c79 : 85 27 __ STA ACCU + 0 
0c7b : a0 01 __ LDY #$01
0c7d : b1 33 __ LDA (T0 + 0),y 
0c7f : 85 12 __ STA P5 
0c81 : c8 __ __ INY
0c82 : b1 33 __ LDA (T0 + 0),y 
0c84 : 85 13 __ STA P6 
0c86 : c8 __ __ INY
0c87 : b1 33 __ LDA (T0 + 0),y 
0c89 : 85 14 __ STA P7 
0c8b : 8a __ __ TXA
0c8c : e0 64 __ CPX #$64
0c8e : f0 04 __ BEQ $0c94 ; (sformat.s43 + 0)
.s45:
0c90 : c9 44 __ CMP #$44
0c92 : d0 20 __ BNE $0cb4 ; (sformat.s44 + 0)
.s43:
0c94 : a9 01 __ LDA #$01
.s262:
0c96 : 85 15 __ STA P8 
0c98 : a5 1a __ LDA P13 ; (buff + 0)
0c9a : 85 0f __ STA P2 
0c9c : a5 1b __ LDA P14 ; (buff + 1)
0c9e : 85 10 __ STA P3 
0ca0 : a5 27 __ LDA ACCU + 0 
0ca2 : 85 11 __ STA P4 
0ca4 : a9 e8 __ LDA #$e8
0ca6 : 85 0d __ STA P0 
0ca8 : a9 9f __ LDA #$9f
0caa : 85 0e __ STA P1 
0cac : 20 d4 0e JSR $0ed4 ; (nforml.s0 + 0)
.s1003:
0caf : a5 27 __ LDA ACCU + 0 
0cb1 : 4c 6e 09 JMP $096e ; (sformat.l1002 + 0)
.s44:
0cb4 : c9 75 __ CMP #$75
0cb6 : f0 04 __ BEQ $0cbc ; (sformat.s1111 + 0)
.s48:
0cb8 : c9 55 __ CMP #$55
0cba : d0 04 __ BNE $0cc0 ; (sformat.s47 + 0)
.s1111:
0cbc : a9 00 __ LDA #$00
0cbe : f0 d6 __ BEQ $0c96 ; (sformat.s262 + 0)
.s47:
0cc0 : c9 78 __ CMP #$78
0cc2 : f0 04 __ BEQ $0cc8 ; (sformat.s49 + 0)
.s50:
0cc4 : c9 58 __ CMP #$58
0cc6 : d0 90 __ BNE $0c58 ; (sformat.s1030 + 2)
.s49:
0cc8 : a9 10 __ LDA #$10
0cca : 8d eb 9f STA $9feb ; (si + 3)
0ccd : a9 00 __ LDA #$00
0ccf : 8d ec 9f STA $9fec ; (si + 4)
0cd2 : f0 c2 __ BEQ $0c96 ; (sformat.s262 + 0)
.s261:
0cd4 : 85 13 __ STA P6 
0cd6 : a5 1a __ LDA P13 ; (buff + 0)
0cd8 : 85 0f __ STA P2 
0cda : a5 1b __ LDA P14 ; (buff + 1)
0cdc : 85 10 __ STA P3 
0cde : a0 00 __ LDY #$00
0ce0 : b1 1e __ LDA (P17),y ; (fps + 0)
0ce2 : 85 11 __ STA P4 
0ce4 : c8 __ __ INY
0ce5 : b1 1e __ LDA (P17),y ; (fps + 0)
0ce7 : 85 12 __ STA P5 
0ce9 : 18 __ __ CLC
0cea : a5 1e __ LDA P17 ; (fps + 0)
0cec : 69 02 __ ADC #$02
0cee : 85 1e __ STA P17 ; (fps + 0)
0cf0 : 90 02 __ BCC $0cf4 ; (sformat.s1027 + 0)
.s1026:
0cf2 : e6 1f __ INC P18 ; (fps + 1)
.s1027:
0cf4 : a9 e8 __ LDA #$e8
0cf6 : 85 0d __ STA P0 
0cf8 : a9 9f __ LDA #$9f
0cfa : 85 0e __ STA P1 
0cfc : 20 99 0d JSR $0d99 ; (nformi.s0 + 0)
0cff : 4c af 0c JMP $0caf ; (sformat.s1003 + 0)
.s240:
0d02 : a0 00 __ LDY #$00
0d04 : b1 1c __ LDA (P15),y ; (fmt + 0)
0d06 : 85 45 __ STA T1 + 0 
0d08 : 85 19 __ STA P12 
0d0a : e6 1c __ INC P15 ; (fmt + 0)
0d0c : f0 03 __ BEQ $0d11 ; (sformat.s240 + 15)
0d0e : 4c 41 0a JMP $0a41 ; (sformat.l1021 + 0)
0d11 : 4c 3f 0a JMP $0a3f ; (sformat.s1022 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.l1:
0d14 : a0 00 __ LDY #$00
0d16 : b1 0e __ LDA (P1),y ; (str + 0)
0d18 : a8 __ __ TAY
0d19 : e6 0e __ INC P1 ; (str + 0)
0d1b : d0 02 __ BNE $0d1f ; (puts.s1003 + 0)
.s1002:
0d1d : e6 0f __ INC P2 ; (str + 1)
.s1003:
0d1f : 98 __ __ TYA
0d20 : f0 06 __ BEQ $0d28 ; (puts.s1001 + 0)
.s2:
0d22 : 20 29 0d JSR $0d29 ; (putpch.s1000 + 0)
0d25 : 4c 14 0d JMP $0d14 ; (puts.l1 + 0)
.s1001:
0d28 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
.s1000:
0d29 : a8 __ __ TAY
.s0:
0d2a : ad 41 1a LDA $1a41 ; (giocharmap + 0)
0d2d : f0 50 __ BEQ $0d7f ; (putpch.s1002 + 0)
.s1:
0d2f : 98 __ __ TYA
0d30 : c0 0a __ CPY #$0a
0d32 : d0 04 __ BNE $0d38 ; (putpch.s5 + 0)
.s4:
0d34 : a9 0d __ LDA #$0d
0d36 : d0 45 __ BNE $0d7d ; (putpch.s51 + 0)
.s5:
0d38 : c9 09 __ CMP #$09
0d3a : d0 16 __ BNE $0d52 ; (putpch.s8 + 0)
.s7:
0d3c : a5 d3 __ LDA $d3 
0d3e : 85 33 __ STA T0 + 0 
0d40 : a9 20 __ LDA #$20
0d42 : 85 34 __ STA T1 + 0 
0d44 : a5 34 __ LDA T1 + 0 
0d46 : 20 d2 ff JSR $ffd2 
0d49 : a5 33 __ LDA T0 + 0 
0d4b : 29 03 __ AND #$03
0d4d : 85 33 __ STA T0 + 0 
0d4f : 4c 85 0d JMP $0d85 ; (putpch.l14 + 0)
.s8:
0d52 : 85 33 __ STA T0 + 0 
0d54 : ad 41 1a LDA $1a41 ; (giocharmap + 0)
0d57 : c9 02 __ CMP #$02
0d59 : 90 24 __ BCC $0d7f ; (putpch.s1002 + 0)
.s16:
0d5b : 98 __ __ TYA
0d5c : c0 41 __ CPY #$41
0d5e : 90 1f __ BCC $0d7f ; (putpch.s1002 + 0)
.s22:
0d60 : c9 7b __ CMP #$7b
0d62 : b0 1b __ BCS $0d7f ; (putpch.s1002 + 0)
.s19:
0d64 : c9 61 __ CMP #$61
0d66 : 90 07 __ BCC $0d6f ; (putpch.s26 + 0)
.s27:
0d68 : 49 20 __ EOR #$20
0d6a : 85 33 __ STA T0 + 0 
0d6c : a8 __ __ TAY
0d6d : b0 04 __ BCS $0d73 ; (putpch.s29 + 0)
.s26:
0d6f : c9 5b __ CMP #$5b
0d71 : b0 0c __ BCS $0d7f ; (putpch.s1002 + 0)
.s29:
0d73 : ad 41 1a LDA $1a41 ; (giocharmap + 0)
0d76 : c9 03 __ CMP #$03
0d78 : d0 05 __ BNE $0d7f ; (putpch.s1002 + 0)
.s30:
0d7a : 98 __ __ TYA
0d7b : 29 df __ AND #$df
.s51:
0d7d : 85 33 __ STA T0 + 0 
.s1002:
0d7f : a5 33 __ LDA T0 + 0 
0d81 : 20 d2 ff JSR $ffd2 
.s1001:
0d84 : 60 __ __ RTS
.l14:
0d85 : e6 33 __ INC T0 + 0 
0d87 : a5 33 __ LDA T0 + 0 
0d89 : c9 04 __ CMP #$04
0d8b : b0 f7 __ BCS $0d84 ; (putpch.s1001 + 0)
.s12:
0d8d : a9 20 __ LDA #$20
0d8f : 85 34 __ STA T1 + 0 
0d91 : a5 34 __ LDA T1 + 0 
0d93 : 20 d2 ff JSR $ffd2 
0d96 : 4c 85 0d JMP $0d85 ; (putpch.l14 + 0)
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
0d99 : a9 00 __ LDA #$00
0d9b : 85 35 __ STA T4 + 0 
0d9d : a5 13 __ LDA P6 ; (s + 0)
0d9f : f0 25 __ BEQ $0dc6 ; (nformi.s3 + 0)
.s4:
0da1 : 24 12 __ BIT P5 ; (v + 1)
0da3 : 10 21 __ BPL $0dc6 ; (nformi.s3 + 0)
.s1:
0da5 : 38 __ __ SEC
0da6 : a9 00 __ LDA #$00
0da8 : e5 11 __ SBC P4 ; (v + 0)
0daa : 85 11 __ STA P4 ; (v + 0)
0dac : a9 00 __ LDA #$00
0dae : e5 12 __ SBC P5 ; (v + 1)
0db0 : 85 12 __ STA P5 ; (v + 1)
0db2 : e6 35 __ INC T4 + 0 
0db4 : a9 10 __ LDA #$10
0db6 : 85 36 __ STA T5 + 0 
.s42:
0db8 : a0 03 __ LDY #$03
0dba : b1 0d __ LDA (P0),y ; (si + 0)
0dbc : 85 33 __ STA T1 + 0 
0dbe : c8 __ __ INY
0dbf : b1 0d __ LDA (P0),y ; (si + 0)
0dc1 : 85 34 __ STA T1 + 1 
0dc3 : 4c 96 0e JMP $0e96 ; (nformi.l6 + 0)
.s3:
0dc6 : a9 10 __ LDA #$10
0dc8 : 85 36 __ STA T5 + 0 
0dca : a5 11 __ LDA P4 ; (v + 0)
0dcc : 05 12 __ ORA P5 ; (v + 1)
0dce : d0 e8 __ BNE $0db8 ; (nformi.s42 + 0)
.s7:
0dd0 : a0 02 __ LDY #$02
0dd2 : b1 0d __ LDA (P0),y ; (si + 0)
0dd4 : c9 ff __ CMP #$ff
0dd6 : d0 04 __ BNE $0ddc ; (nformi.s85 + 0)
.s86:
0dd8 : a9 0f __ LDA #$0f
0dda : d0 05 __ BNE $0de1 ; (nformi.s1012 + 0)
.s85:
0ddc : 38 __ __ SEC
0ddd : a9 10 __ LDA #$10
0ddf : f1 0d __ SBC (P0),y ; (si + 0)
.s1012:
0de1 : a8 __ __ TAY
0de2 : c4 36 __ CPY T5 + 0 
0de4 : b0 0d __ BCS $0df3 ; (nformi.s10 + 0)
.s9:
0de6 : a9 30 __ LDA #$30
.l1020:
0de8 : c6 36 __ DEC T5 + 0 
0dea : a6 36 __ LDX T5 + 0 
0dec : 9d f0 9f STA $9ff0,x ; (buffer + 0)
0def : c4 36 __ CPY T5 + 0 
0df1 : 90 f5 __ BCC $0de8 ; (nformi.l1020 + 0)
.s10:
0df3 : a0 07 __ LDY #$07
0df5 : b1 0d __ LDA (P0),y ; (si + 0)
0df7 : f0 20 __ BEQ $0e19 ; (nformi.s13 + 0)
.s14:
0df9 : a0 04 __ LDY #$04
0dfb : b1 0d __ LDA (P0),y ; (si + 0)
0dfd : d0 1a __ BNE $0e19 ; (nformi.s13 + 0)
.s1003:
0dff : 88 __ __ DEY
0e00 : b1 0d __ LDA (P0),y ; (si + 0)
0e02 : c9 10 __ CMP #$10
0e04 : d0 13 __ BNE $0e19 ; (nformi.s13 + 0)
.s11:
0e06 : a9 58 __ LDA #$58
0e08 : a6 36 __ LDX T5 + 0 
0e0a : 9d ef 9f STA $9fef,x ; (si + 7)
0e0d : 8a __ __ TXA
0e0e : 18 __ __ CLC
0e0f : 69 fe __ ADC #$fe
0e11 : 85 36 __ STA T5 + 0 
0e13 : aa __ __ TAX
0e14 : a9 30 __ LDA #$30
0e16 : 9d f0 9f STA $9ff0,x ; (buffer + 0)
.s13:
0e19 : a9 00 __ LDA #$00
0e1b : 85 27 __ STA ACCU + 0 
0e1d : a5 35 __ LDA T4 + 0 
0e1f : f0 0c __ BEQ $0e2d ; (nformi.s16 + 0)
.s15:
0e21 : c6 36 __ DEC T5 + 0 
0e23 : a9 2d __ LDA #$2d
.s1011:
0e25 : a6 36 __ LDX T5 + 0 
0e27 : 9d f0 9f STA $9ff0,x ; (buffer + 0)
0e2a : 4c 39 0e JMP $0e39 ; (nformi.s177 + 0)
.s16:
0e2d : a0 05 __ LDY #$05
0e2f : b1 0d __ LDA (P0),y ; (si + 0)
0e31 : f0 06 __ BEQ $0e39 ; (nformi.s177 + 0)
.s18:
0e33 : c6 36 __ DEC T5 + 0 
0e35 : a9 2b __ LDA #$2b
0e37 : d0 ec __ BNE $0e25 ; (nformi.s1011 + 0)
.s177:
0e39 : a0 06 __ LDY #$06
0e3b : a6 36 __ LDX T5 + 0 
0e3d : b1 0d __ LDA (P0),y ; (si + 0)
0e3f : d0 2d __ BNE $0e6e ; (nformi.s24 + 0)
.l30:
0e41 : 8a __ __ TXA
0e42 : 18 __ __ CLC
0e43 : a0 01 __ LDY #$01
0e45 : 71 0d __ ADC (P0),y ; (si + 0)
0e47 : b0 04 __ BCS $0e4d ; (nformi.s31 + 0)
.s1002:
0e49 : c9 11 __ CMP #$11
0e4b : 90 0a __ BCC $0e57 ; (nformi.s33 + 0)
.s31:
0e4d : a0 00 __ LDY #$00
0e4f : b1 0d __ LDA (P0),y ; (si + 0)
0e51 : 9d ef 9f STA $9fef,x ; (si + 7)
0e54 : ca __ __ DEX
0e55 : b0 ea __ BCS $0e41 ; (nformi.l30 + 0)
.s33:
0e57 : e0 10 __ CPX #$10
0e59 : b0 0e __ BCS $0e69 ; (nformi.s23 + 0)
.s34:
0e5b : 88 __ __ DEY
.l1008:
0e5c : bd f0 9f LDA $9ff0,x ; (buffer + 0)
0e5f : 91 0f __ STA (P2),y ; (str + 0)
0e61 : c8 __ __ INY
0e62 : e8 __ __ INX
0e63 : e0 10 __ CPX #$10
0e65 : 90 f5 __ BCC $0e5c ; (nformi.l1008 + 0)
.s1009:
0e67 : 84 27 __ STY ACCU + 0 
.s23:
0e69 : a9 00 __ LDA #$00
0e6b : 85 28 __ STA ACCU + 1 
.s1001:
0e6d : 60 __ __ RTS
.s24:
0e6e : e0 10 __ CPX #$10
0e70 : b0 1a __ BCS $0e8c ; (nformi.l27 + 0)
.s25:
0e72 : a0 00 __ LDY #$00
.l1006:
0e74 : bd f0 9f LDA $9ff0,x ; (buffer + 0)
0e77 : 91 0f __ STA (P2),y ; (str + 0)
0e79 : c8 __ __ INY
0e7a : e8 __ __ INX
0e7b : e0 10 __ CPX #$10
0e7d : 90 f5 __ BCC $0e74 ; (nformi.l1006 + 0)
.s1007:
0e7f : 84 27 __ STY ACCU + 0 
0e81 : b0 09 __ BCS $0e8c ; (nformi.l27 + 0)
.s28:
0e83 : 88 __ __ DEY
0e84 : b1 0d __ LDA (P0),y ; (si + 0)
0e86 : a4 27 __ LDY ACCU + 0 
0e88 : 91 0f __ STA (P2),y ; (str + 0)
0e8a : e6 27 __ INC ACCU + 0 
.l27:
0e8c : a5 27 __ LDA ACCU + 0 
0e8e : a0 01 __ LDY #$01
0e90 : d1 0d __ CMP (P0),y ; (si + 0)
0e92 : 90 ef __ BCC $0e83 ; (nformi.s28 + 0)
0e94 : b0 d3 __ BCS $0e69 ; (nformi.s23 + 0)
.l6:
0e96 : a5 11 __ LDA P4 ; (v + 0)
0e98 : 85 27 __ STA ACCU + 0 
0e9a : a5 12 __ LDA P5 ; (v + 1)
0e9c : 85 28 __ STA ACCU + 1 
0e9e : a5 33 __ LDA T1 + 0 
0ea0 : 85 03 __ STA WORK + 0 
0ea2 : a5 34 __ LDA T1 + 1 
0ea4 : 85 04 __ STA WORK + 1 
0ea6 : 20 16 18 JSR $1816 ; (divmod + 0)
0ea9 : a5 06 __ LDA WORK + 3 
0eab : 30 08 __ BMI $0eb5 ; (nformi.s83 + 0)
.s1005:
0ead : d0 0a __ BNE $0eb9 ; (nformi.s82 + 0)
.s1004:
0eaf : a5 05 __ LDA WORK + 2 
0eb1 : c9 0a __ CMP #$0a
0eb3 : b0 04 __ BCS $0eb9 ; (nformi.s82 + 0)
.s83:
0eb5 : a9 30 __ LDA #$30
0eb7 : d0 02 __ BNE $0ebb ; (nformi.s84 + 0)
.s82:
0eb9 : a9 37 __ LDA #$37
.s84:
0ebb : c6 36 __ DEC T5 + 0 
0ebd : 18 __ __ CLC
0ebe : 65 05 __ ADC WORK + 2 
0ec0 : a6 36 __ LDX T5 + 0 
0ec2 : 9d f0 9f STA $9ff0,x ; (buffer + 0)
0ec5 : a5 27 __ LDA ACCU + 0 
0ec7 : 85 11 __ STA P4 ; (v + 0)
0ec9 : a5 28 __ LDA ACCU + 1 
0ecb : 85 12 __ STA P5 ; (v + 1)
0ecd : 05 11 __ ORA P4 ; (v + 0)
0ecf : d0 c5 __ BNE $0e96 ; (nformi.l6 + 0)
0ed1 : 4c d0 0d JMP $0dd0 ; (nformi.s7 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
0ed4 : a9 00 __ LDA #$00
0ed6 : 85 35 __ STA T4 + 0 
0ed8 : a5 15 __ LDA P8 ; (s + 0)
0eda : f0 21 __ BEQ $0efd ; (nforml.s197 + 0)
.s4:
0edc : a5 14 __ LDA P7 ; (v + 3)
0ede : f0 1d __ BEQ $0efd ; (nforml.s197 + 0)
.s1021:
0ee0 : 10 1b __ BPL $0efd ; (nforml.s197 + 0)
.s1:
0ee2 : 38 __ __ SEC
0ee3 : a9 00 __ LDA #$00
0ee5 : e5 11 __ SBC P4 ; (v + 0)
0ee7 : 85 11 __ STA P4 ; (v + 0)
0ee9 : a9 00 __ LDA #$00
0eeb : e5 12 __ SBC P5 ; (v + 1)
0eed : 85 12 __ STA P5 ; (v + 1)
0eef : a9 00 __ LDA #$00
0ef1 : e5 13 __ SBC P6 ; (v + 2)
0ef3 : 85 13 __ STA P6 ; (v + 2)
0ef5 : a9 00 __ LDA #$00
0ef7 : e5 14 __ SBC P7 ; (v + 3)
0ef9 : 85 14 __ STA P7 ; (v + 3)
0efb : e6 35 __ INC T4 + 0 
.s197:
0efd : a9 10 __ LDA #$10
0eff : 85 36 __ STA T5 + 0 
0f01 : a5 14 __ LDA P7 ; (v + 3)
0f03 : d0 0c __ BNE $0f11 ; (nforml.s42 + 0)
.s1011:
0f05 : a5 13 __ LDA P6 ; (v + 2)
0f07 : d0 08 __ BNE $0f11 ; (nforml.s42 + 0)
.s1012:
0f09 : a5 12 __ LDA P5 ; (v + 1)
0f0b : d0 04 __ BNE $0f11 ; (nforml.s42 + 0)
.s1013:
0f0d : c5 11 __ CMP P4 ; (v + 0)
0f0f : b0 0e __ BCS $0f1f ; (nforml.s7 + 0)
.s42:
0f11 : a0 03 __ LDY #$03
0f13 : b1 0d __ LDA (P0),y ; (si + 0)
0f15 : 85 33 __ STA T1 + 0 
0f17 : c8 __ __ INY
0f18 : b1 0d __ LDA (P0),y ; (si + 0)
0f1a : 85 34 __ STA T1 + 1 
0f1c : 4c e5 0f JMP $0fe5 ; (nforml.l6 + 0)
.s7:
0f1f : a0 02 __ LDY #$02
0f21 : b1 0d __ LDA (P0),y ; (si + 0)
0f23 : c9 ff __ CMP #$ff
0f25 : d0 04 __ BNE $0f2b ; (nforml.s85 + 0)
.s86:
0f27 : a9 0f __ LDA #$0f
0f29 : d0 05 __ BNE $0f30 ; (nforml.s1028 + 0)
.s85:
0f2b : 38 __ __ SEC
0f2c : a9 10 __ LDA #$10
0f2e : f1 0d __ SBC (P0),y ; (si + 0)
.s1028:
0f30 : a8 __ __ TAY
0f31 : c4 36 __ CPY T5 + 0 
0f33 : b0 0d __ BCS $0f42 ; (nforml.s10 + 0)
.s9:
0f35 : a9 30 __ LDA #$30
.l1036:
0f37 : c6 36 __ DEC T5 + 0 
0f39 : a6 36 __ LDX T5 + 0 
0f3b : 9d f0 9f STA $9ff0,x ; (buffer + 0)
0f3e : c4 36 __ CPY T5 + 0 
0f40 : 90 f5 __ BCC $0f37 ; (nforml.l1036 + 0)
.s10:
0f42 : a0 07 __ LDY #$07
0f44 : b1 0d __ LDA (P0),y ; (si + 0)
0f46 : f0 20 __ BEQ $0f68 ; (nforml.s13 + 0)
.s14:
0f48 : a0 04 __ LDY #$04
0f4a : b1 0d __ LDA (P0),y ; (si + 0)
0f4c : d0 1a __ BNE $0f68 ; (nforml.s13 + 0)
.s1003:
0f4e : 88 __ __ DEY
0f4f : b1 0d __ LDA (P0),y ; (si + 0)
0f51 : c9 10 __ CMP #$10
0f53 : d0 13 __ BNE $0f68 ; (nforml.s13 + 0)
.s11:
0f55 : a9 58 __ LDA #$58
0f57 : a6 36 __ LDX T5 + 0 
0f59 : 9d ef 9f STA $9fef,x ; (si + 7)
0f5c : 8a __ __ TXA
0f5d : 18 __ __ CLC
0f5e : 69 fe __ ADC #$fe
0f60 : 85 36 __ STA T5 + 0 
0f62 : aa __ __ TAX
0f63 : a9 30 __ LDA #$30
0f65 : 9d f0 9f STA $9ff0,x ; (buffer + 0)
.s13:
0f68 : a9 00 __ LDA #$00
0f6a : 85 27 __ STA ACCU + 0 
0f6c : a5 35 __ LDA T4 + 0 
0f6e : f0 0c __ BEQ $0f7c ; (nforml.s16 + 0)
.s15:
0f70 : c6 36 __ DEC T5 + 0 
0f72 : a9 2d __ LDA #$2d
.s1027:
0f74 : a6 36 __ LDX T5 + 0 
0f76 : 9d f0 9f STA $9ff0,x ; (buffer + 0)
0f79 : 4c 88 0f JMP $0f88 ; (nforml.s178 + 0)
.s16:
0f7c : a0 05 __ LDY #$05
0f7e : b1 0d __ LDA (P0),y ; (si + 0)
0f80 : f0 06 __ BEQ $0f88 ; (nforml.s178 + 0)
.s18:
0f82 : c6 36 __ DEC T5 + 0 
0f84 : a9 2b __ LDA #$2b
0f86 : d0 ec __ BNE $0f74 ; (nforml.s1027 + 0)
.s178:
0f88 : a0 06 __ LDY #$06
0f8a : a6 36 __ LDX T5 + 0 
0f8c : b1 0d __ LDA (P0),y ; (si + 0)
0f8e : d0 2d __ BNE $0fbd ; (nforml.s24 + 0)
.l30:
0f90 : 8a __ __ TXA
0f91 : 18 __ __ CLC
0f92 : a0 01 __ LDY #$01
0f94 : 71 0d __ ADC (P0),y ; (si + 0)
0f96 : b0 04 __ BCS $0f9c ; (nforml.s31 + 0)
.s1002:
0f98 : c9 11 __ CMP #$11
0f9a : 90 0a __ BCC $0fa6 ; (nforml.s33 + 0)
.s31:
0f9c : a0 00 __ LDY #$00
0f9e : b1 0d __ LDA (P0),y ; (si + 0)
0fa0 : 9d ef 9f STA $9fef,x ; (si + 7)
0fa3 : ca __ __ DEX
0fa4 : b0 ea __ BCS $0f90 ; (nforml.l30 + 0)
.s33:
0fa6 : e0 10 __ CPX #$10
0fa8 : b0 0e __ BCS $0fb8 ; (nforml.s23 + 0)
.s34:
0faa : 88 __ __ DEY
.l1024:
0fab : bd f0 9f LDA $9ff0,x ; (buffer + 0)
0fae : 91 0f __ STA (P2),y ; (str + 0)
0fb0 : c8 __ __ INY
0fb1 : e8 __ __ INX
0fb2 : e0 10 __ CPX #$10
0fb4 : 90 f5 __ BCC $0fab ; (nforml.l1024 + 0)
.s1025:
0fb6 : 84 27 __ STY ACCU + 0 
.s23:
0fb8 : a9 00 __ LDA #$00
0fba : 85 28 __ STA ACCU + 1 
.s1001:
0fbc : 60 __ __ RTS
.s24:
0fbd : e0 10 __ CPX #$10
0fbf : b0 1a __ BCS $0fdb ; (nforml.l27 + 0)
.s25:
0fc1 : a0 00 __ LDY #$00
.l1022:
0fc3 : bd f0 9f LDA $9ff0,x ; (buffer + 0)
0fc6 : 91 0f __ STA (P2),y ; (str + 0)
0fc8 : c8 __ __ INY
0fc9 : e8 __ __ INX
0fca : e0 10 __ CPX #$10
0fcc : 90 f5 __ BCC $0fc3 ; (nforml.l1022 + 0)
.s1023:
0fce : 84 27 __ STY ACCU + 0 
0fd0 : b0 09 __ BCS $0fdb ; (nforml.l27 + 0)
.s28:
0fd2 : 88 __ __ DEY
0fd3 : b1 0d __ LDA (P0),y ; (si + 0)
0fd5 : a4 27 __ LDY ACCU + 0 
0fd7 : 91 0f __ STA (P2),y ; (str + 0)
0fd9 : e6 27 __ INC ACCU + 0 
.l27:
0fdb : a5 27 __ LDA ACCU + 0 
0fdd : a0 01 __ LDY #$01
0fdf : d1 0d __ CMP (P0),y ; (si + 0)
0fe1 : 90 ef __ BCC $0fd2 ; (nforml.s28 + 0)
0fe3 : b0 d3 __ BCS $0fb8 ; (nforml.s23 + 0)
.l6:
0fe5 : a5 11 __ LDA P4 ; (v + 0)
0fe7 : 85 27 __ STA ACCU + 0 
0fe9 : a5 12 __ LDA P5 ; (v + 1)
0feb : 85 28 __ STA ACCU + 1 
0fed : a5 13 __ LDA P6 ; (v + 2)
0fef : 85 29 __ STA ACCU + 2 
0ff1 : a5 14 __ LDA P7 ; (v + 3)
0ff3 : 85 2a __ STA ACCU + 3 
0ff5 : a5 33 __ LDA T1 + 0 
0ff7 : 85 03 __ STA WORK + 0 
0ff9 : a5 34 __ LDA T1 + 1 
0ffb : 85 04 __ STA WORK + 1 
0ffd : a9 00 __ LDA #$00
0fff : 85 05 __ STA WORK + 2 
1001 : 85 06 __ STA WORK + 3 
1003 : 20 5d 19 JSR $195d ; (divmod32 + 0)
1006 : a5 08 __ LDA WORK + 5 
1008 : 30 08 __ BMI $1012 ; (nforml.s83 + 0)
.s1010:
100a : d0 0a __ BNE $1016 ; (nforml.s82 + 0)
.s1009:
100c : a5 07 __ LDA WORK + 4 
100e : c9 0a __ CMP #$0a
1010 : b0 04 __ BCS $1016 ; (nforml.s82 + 0)
.s83:
1012 : a9 30 __ LDA #$30
1014 : d0 02 __ BNE $1018 ; (nforml.s84 + 0)
.s82:
1016 : a9 37 __ LDA #$37
.s84:
1018 : c6 36 __ DEC T5 + 0 
101a : 18 __ __ CLC
101b : 65 07 __ ADC WORK + 4 
101d : a6 36 __ LDX T5 + 0 
101f : 9d f0 9f STA $9ff0,x ; (buffer + 0)
1022 : a5 27 __ LDA ACCU + 0 
1024 : 85 11 __ STA P4 ; (v + 0)
1026 : a5 28 __ LDA ACCU + 1 
1028 : 85 12 __ STA P5 ; (v + 1)
102a : a5 29 __ LDA ACCU + 2 
102c : 85 13 __ STA P6 ; (v + 2)
102e : a5 2a __ LDA ACCU + 3 
1030 : 85 14 __ STA P7 ; (v + 3)
1032 : d0 b1 __ BNE $0fe5 ; (nforml.l6 + 0)
.s1004:
1034 : a5 13 __ LDA P6 ; (v + 2)
1036 : d0 ad __ BNE $0fe5 ; (nforml.l6 + 0)
.s1005:
1038 : a5 12 __ LDA P5 ; (v + 1)
103a : d0 a9 __ BNE $0fe5 ; (nforml.l6 + 0)
.s1006:
103c : c5 11 __ CMP P4 ; (v + 0)
103e : 90 a5 __ BCC $0fe5 ; (nforml.l6 + 0)
1040 : 4c 1f 0f JMP $0f1f ; (nforml.s7 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->i16
.s0:
1043 : a5 16 __ LDA P9 ; (f + 1)
1045 : 85 34 __ STA T0 + 1 
1047 : a5 17 __ LDA P10 ; (f + 2)
1049 : 85 35 __ STA T0 + 2 
104b : a5 18 __ LDA P11 ; (f + 3)
104d : 29 7f __ AND #$7f
104f : 05 17 __ ORA P10 ; (f + 2)
1051 : 05 16 __ ORA P9 ; (f + 1)
1053 : 05 15 __ ORA P8 ; (f + 0)
1055 : f0 21 __ BEQ $1078 ; (nformf.s2 + 0)
.s1050:
1057 : 24 18 __ BIT P11 ; (f + 3)
1059 : 10 1d __ BPL $1078 ; (nformf.s2 + 0)
.s1:
105b : a9 2d __ LDA #$2d
105d : a0 00 __ LDY #$00
105f : 91 13 __ STA (P6),y ; (str + 0)
1061 : a5 18 __ LDA P11 ; (f + 3)
1063 : 49 80 __ EOR #$80
1065 : 85 10 __ STA P3 
1067 : 85 18 __ STA P11 ; (f + 3)
1069 : a5 15 __ LDA P8 ; (f + 0)
106b : 85 0d __ STA P0 
106d : a5 16 __ LDA P9 ; (f + 1)
106f : 85 0e __ STA P1 
1071 : a5 17 __ LDA P10 ; (f + 2)
1073 : 85 0f __ STA P2 
1075 : 4c 02 15 JMP $1502 ; (nformf.s226 + 0)
.s2:
1078 : a5 15 __ LDA P8 ; (f + 0)
107a : 85 0d __ STA P0 
107c : a5 16 __ LDA P9 ; (f + 1)
107e : 85 0e __ STA P1 
1080 : a5 17 __ LDA P10 ; (f + 2)
1082 : 85 0f __ STA P2 
1084 : a5 18 __ LDA P11 ; (f + 3)
1086 : 85 10 __ STA P3 
1088 : a0 05 __ LDY #$05
108a : b1 11 __ LDA (P4),y ; (si + 0)
108c : f0 09 __ BEQ $1097 ; (nformf.s3 + 0)
.s4:
108e : a9 2b __ LDA #$2b
1090 : a0 00 __ LDY #$00
1092 : 91 13 __ STA (P6),y ; (str + 0)
1094 : 4c 02 15 JMP $1502 ; (nformf.s226 + 0)
.s3:
1097 : 20 18 15 JSR $1518 ; (isinf.s0 + 0)
109a : aa __ __ TAX
109b : a0 00 __ LDY #$00
109d : 84 42 __ STY T8 + 0 
109f : 8a __ __ TXA
10a0 : f0 09 __ BEQ $10ab ; (nformf.s8 + 0)
.s170:
10a2 : a9 01 __ LDA #$01
10a4 : 85 37 __ STA T1 + 0 
10a6 : a9 02 __ LDA #$02
10a8 : 4c e6 14 JMP $14e6 ; (nformf.s7 + 0)
.s8:
10ab : a0 02 __ LDY #$02
10ad : b1 11 __ LDA (P4),y ; (si + 0)
10af : c9 ff __ CMP #$ff
10b1 : d0 02 __ BNE $10b5 ; (nformf.s138 + 0)
.s139:
10b3 : a9 06 __ LDA #$06
.s138:
10b5 : 86 3c __ STX T3 + 0 
10b7 : 86 3d __ STX T3 + 1 
10b9 : 85 3b __ STA T2 + 0 
10bb : 85 40 __ STA T5 + 0 
10bd : a5 15 __ LDA P8 ; (f + 0)
10bf : 85 33 __ STA T0 + 0 
10c1 : a5 18 __ LDA P11 ; (f + 3)
10c3 : 85 36 __ STA T0 + 3 
10c5 : 29 7f __ AND #$7f
10c7 : 05 17 __ ORA P10 ; (f + 2)
10c9 : 05 16 __ ORA P9 ; (f + 1)
10cb : 05 15 __ ORA P8 ; (f + 0)
10cd : f0 03 __ BEQ $10d2 ; (nformf.s12 + 0)
10cf : 4c f8 13 JMP $13f8 ; (nformf.s13 + 0)
.s12:
10d2 : a5 19 __ LDA P12 ; (type + 0)
10d4 : c9 65 __ CMP #$65
10d6 : d0 04 __ BNE $10dc ; (nformf.s1003 + 0)
.s1002:
10d8 : a9 01 __ LDA #$01
10da : d0 02 __ BNE $10de ; (nformf.s1004 + 0)
.s1003:
10dc : a9 00 __ LDA #$00
.s1004:
10de : 85 43 __ STA T9 + 0 
10e0 : a6 3b __ LDX T2 + 0 
10e2 : e8 __ __ INX
10e3 : 86 3e __ STX T4 + 0 
10e5 : a5 19 __ LDA P12 ; (type + 0)
10e7 : c9 67 __ CMP #$67
10e9 : d0 13 __ BNE $10fe ; (nformf.s24 + 0)
.s22:
10eb : a5 3d __ LDA T3 + 1 
10ed : 30 08 __ BMI $10f7 ; (nformf.s25 + 0)
.s1025:
10ef : d0 06 __ BNE $10f7 ; (nformf.s25 + 0)
.s1024:
10f1 : a5 3c __ LDA T3 + 0 
10f3 : c9 04 __ CMP #$04
10f5 : 90 07 __ BCC $10fe ; (nformf.s24 + 0)
.s25:
10f7 : a9 01 __ LDA #$01
10f9 : 85 43 __ STA T9 + 0 
10fb : 4c 65 13 JMP $1365 ; (nformf.s30 + 0)
.s24:
10fe : a5 43 __ LDA T9 + 0 
1100 : d0 f9 __ BNE $10fb ; (nformf.s25 + 4)
.s32:
1102 : 24 3d __ BIT T3 + 1 
1104 : 10 43 __ BPL $1149 ; (nformf.s34 + 0)
.s33:
1106 : a5 33 __ LDA T0 + 0 
1108 : 85 27 __ STA ACCU + 0 
110a : a5 34 __ LDA T0 + 1 
110c : 85 28 __ STA ACCU + 1 
110e : a5 35 __ LDA T0 + 2 
1110 : 85 29 __ STA ACCU + 2 
1112 : a5 36 __ LDA T0 + 3 
1114 : 85 2a __ STA ACCU + 3 
.l1079:
1116 : a9 00 __ LDA #$00
1118 : 85 03 __ STA WORK + 0 
111a : 85 04 __ STA WORK + 1 
111c : a9 20 __ LDA #$20
111e : 85 05 __ STA WORK + 2 
1120 : a9 41 __ LDA #$41
1122 : 85 06 __ STA WORK + 3 
1124 : 20 48 15 JSR $1548 ; (freg + 20)
1127 : 20 2e 17 JSR $172e ; (crt_fdiv + 0)
112a : 18 __ __ CLC
112b : a5 3c __ LDA T3 + 0 
112d : 69 01 __ ADC #$01
112f : 85 3c __ STA T3 + 0 
1131 : a5 3d __ LDA T3 + 1 
1133 : 69 00 __ ADC #$00
1135 : 85 3d __ STA T3 + 1 
1137 : 30 dd __ BMI $1116 ; (nformf.l1079 + 0)
.s1080:
1139 : a5 2a __ LDA ACCU + 3 
113b : 85 36 __ STA T0 + 3 
113d : a5 29 __ LDA ACCU + 2 
113f : 85 35 __ STA T0 + 2 
1141 : a5 28 __ LDA ACCU + 1 
1143 : 85 34 __ STA T0 + 1 
1145 : a5 27 __ LDA ACCU + 0 
1147 : 85 33 __ STA T0 + 0 
.s34:
1149 : 18 __ __ CLC
114a : a5 3b __ LDA T2 + 0 
114c : 65 3c __ ADC T3 + 0 
114e : 18 __ __ CLC
114f : 69 01 __ ADC #$01
1151 : 85 3e __ STA T4 + 0 
1153 : c9 07 __ CMP #$07
1155 : 90 14 __ BCC $116b ; (nformf.s35 + 0)
.s36:
1157 : ad 5a 1a LDA $1a5a ; (fround5 + 24)
115a : 85 37 __ STA T1 + 0 
115c : ad 5b 1a LDA $1a5b ; (fround5 + 25)
115f : 85 38 __ STA T1 + 1 
1161 : ad 5c 1a LDA $1a5c ; (fround5 + 26)
1164 : 85 39 __ STA T1 + 2 
1166 : ad 5d 1a LDA $1a5d ; (fround5 + 27)
1169 : b0 15 __ BCS $1180 ; (nformf.s250 + 0)
.s35:
116b : 0a __ __ ASL
116c : 0a __ __ ASL
116d : aa __ __ TAX
116e : bd 3e 1a LDA $1a3e,x ; (tile + 1)
1171 : 85 37 __ STA T1 + 0 
1173 : bd 3f 1a LDA $1a3f,x ; (tile + 2)
1176 : 85 38 __ STA T1 + 1 
1178 : bd 40 1a LDA $1a40,x ; (tile + 3)
117b : 85 39 __ STA T1 + 2 
117d : bd 41 1a LDA $1a41,x ; (giocharmap + 0)
.s250:
1180 : 85 3a __ STA T1 + 3 
1182 : a5 33 __ LDA T0 + 0 
1184 : 85 27 __ STA ACCU + 0 
1186 : a5 34 __ LDA T0 + 1 
1188 : 85 28 __ STA ACCU + 1 
118a : a5 35 __ LDA T0 + 2 
118c : 85 29 __ STA ACCU + 2 
118e : a5 36 __ LDA T0 + 3 
1190 : 85 2a __ STA ACCU + 3 
1192 : a2 37 __ LDX #$37
1194 : 20 38 15 JSR $1538 ; (freg + 4)
1197 : 20 7f 15 JSR $157f ; (faddsub + 6)
119a : a5 28 __ LDA ACCU + 1 
119c : 85 16 __ STA P9 ; (f + 1)
119e : a5 29 __ LDA ACCU + 2 
11a0 : 85 17 __ STA P10 ; (f + 2)
11a2 : a6 27 __ LDX ACCU + 0 
11a4 : a5 2a __ LDA ACCU + 3 
11a6 : 85 18 __ STA P11 ; (f + 3)
11a8 : 30 33 __ BMI $11dd ; (nformf.s31 + 0)
.s1011:
11aa : c9 41 __ CMP #$41
11ac : d0 06 __ BNE $11b4 ; (nformf.s1015 + 0)
.s1012:
11ae : a5 17 __ LDA P10 ; (f + 2)
11b0 : c9 20 __ CMP #$20
11b2 : f0 02 __ BEQ $11b6 ; (nformf.s38 + 0)
.s1015:
11b4 : 90 27 __ BCC $11dd ; (nformf.s31 + 0)
.s38:
11b6 : a9 00 __ LDA #$00
11b8 : 85 03 __ STA WORK + 0 
11ba : 85 04 __ STA WORK + 1 
11bc : a9 20 __ LDA #$20
11be : 85 05 __ STA WORK + 2 
11c0 : a9 41 __ LDA #$41
11c2 : 85 06 __ STA WORK + 3 
11c4 : 20 48 15 JSR $1548 ; (freg + 20)
11c7 : 20 2e 17 JSR $172e ; (crt_fdiv + 0)
11ca : a5 28 __ LDA ACCU + 1 
11cc : 85 16 __ STA P9 ; (f + 1)
11ce : a5 29 __ LDA ACCU + 2 
11d0 : 85 17 __ STA P10 ; (f + 2)
11d2 : a5 2a __ LDA ACCU + 3 
11d4 : 85 18 __ STA P11 ; (f + 3)
11d6 : a6 3b __ LDX T2 + 0 
11d8 : ca __ __ DEX
11d9 : 86 40 __ STX T5 + 0 
11db : a6 27 __ LDX ACCU + 0 
.s31:
11dd : 38 __ __ SEC
11de : a5 3e __ LDA T4 + 0 
11e0 : e5 40 __ SBC T5 + 0 
11e2 : 85 3b __ STA T2 + 0 
11e4 : a9 14 __ LDA #$14
11e6 : c5 3e __ CMP T4 + 0 
11e8 : b0 02 __ BCS $11ec ; (nformf.s49 + 0)
.s47:
11ea : 85 3e __ STA T4 + 0 
.s49:
11ec : a5 3b __ LDA T2 + 0 
11ee : d0 08 __ BNE $11f8 ; (nformf.s255 + 0)
.s50:
11f0 : a9 30 __ LDA #$30
11f2 : a4 42 __ LDY T8 + 0 
11f4 : 91 13 __ STA (P6),y ; (str + 0)
11f6 : e6 42 __ INC T8 + 0 
.s255:
11f8 : a9 00 __ LDA #$00
11fa : 85 44 __ STA T10 + 0 
11fc : c5 3b __ CMP T2 + 0 
11fe : f0 6f __ BEQ $126f ; (nformf.l57 + 0)
.s59:
1200 : c9 07 __ CMP #$07
1202 : 90 04 __ BCC $1208 ; (nformf.s61 + 0)
.l60:
1204 : a9 30 __ LDA #$30
1206 : b0 55 __ BCS $125d ; (nformf.l180 + 0)
.s61:
1208 : 86 27 __ STX ACCU + 0 
120a : 86 33 __ STX T0 + 0 
120c : a5 16 __ LDA P9 ; (f + 1)
120e : 85 28 __ STA ACCU + 1 
1210 : 85 34 __ STA T0 + 1 
1212 : a5 17 __ LDA P10 ; (f + 2)
1214 : 85 29 __ STA ACCU + 2 
1216 : 85 35 __ STA T0 + 2 
1218 : a5 18 __ LDA P11 ; (f + 3)
121a : 85 2a __ STA ACCU + 3 
121c : 85 36 __ STA T0 + 3 
121e : 20 c4 18 JSR $18c4 ; (f32_to_i16 + 0)
1221 : a5 27 __ LDA ACCU + 0 
1223 : 85 41 __ STA T6 + 0 
1225 : 20 12 19 JSR $1912 ; (sint16_to_float + 0)
1228 : a2 33 __ LDX #$33
122a : 20 38 15 JSR $1538 ; (freg + 4)
122d : a5 2a __ LDA ACCU + 3 
122f : 49 80 __ EOR #$80
1231 : 85 2a __ STA ACCU + 3 
1233 : 20 7f 15 JSR $157f ; (faddsub + 6)
1236 : a9 00 __ LDA #$00
1238 : 85 03 __ STA WORK + 0 
123a : 85 04 __ STA WORK + 1 
123c : a9 20 __ LDA #$20
123e : 85 05 __ STA WORK + 2 
1240 : a9 41 __ LDA #$41
1242 : 85 06 __ STA WORK + 3 
1244 : 20 48 15 JSR $1548 ; (freg + 20)
1247 : 20 66 16 JSR $1666 ; (crt_fmul + 0)
124a : a5 28 __ LDA ACCU + 1 
124c : 85 16 __ STA P9 ; (f + 1)
124e : a5 29 __ LDA ACCU + 2 
1250 : 85 17 __ STA P10 ; (f + 2)
1252 : a5 2a __ LDA ACCU + 3 
1254 : 85 18 __ STA P11 ; (f + 3)
1256 : 18 __ __ CLC
1257 : a5 41 __ LDA T6 + 0 
1259 : 69 30 __ ADC #$30
125b : a6 27 __ LDX ACCU + 0 
.l180:
125d : a4 42 __ LDY T8 + 0 
125f : 91 13 __ STA (P6),y ; (str + 0)
1261 : e6 42 __ INC T8 + 0 
1263 : e6 44 __ INC T10 + 0 
1265 : a5 44 __ LDA T10 + 0 
1267 : c5 3e __ CMP T4 + 0 
1269 : b0 14 __ BCS $127f ; (nformf.s56 + 0)
.s54:
126b : c5 3b __ CMP T2 + 0 
126d : d0 91 __ BNE $1200 ; (nformf.s59 + 0)
.l57:
126f : a9 2e __ LDA #$2e
1271 : a4 42 __ LDY T8 + 0 
1273 : 91 13 __ STA (P6),y ; (str + 0)
1275 : e6 42 __ INC T8 + 0 
1277 : a5 44 __ LDA T10 + 0 
1279 : c9 07 __ CMP #$07
127b : 90 8b __ BCC $1208 ; (nformf.s61 + 0)
127d : b0 85 __ BCS $1204 ; (nformf.l60 + 0)
.s56:
127f : a5 43 __ LDA T9 + 0 
1281 : f0 62 __ BEQ $12e5 ; (nformf.s9 + 0)
.s63:
1283 : a9 45 __ LDA #$45
1285 : a4 42 __ LDY T8 + 0 
1287 : 91 13 __ STA (P6),y ; (str + 0)
1289 : c8 __ __ INY
128a : 24 3d __ BIT T3 + 1 
128c : 30 06 __ BMI $1294 ; (nformf.s66 + 0)
.s67:
128e : a9 2b __ LDA #$2b
1290 : 91 13 __ STA (P6),y ; (str + 0)
1292 : b0 11 __ BCS $12a5 ; (nformf.s68 + 0)
.s66:
1294 : a9 2d __ LDA #$2d
1296 : 91 13 __ STA (P6),y ; (str + 0)
1298 : 38 __ __ SEC
1299 : a9 00 __ LDA #$00
129b : e5 3c __ SBC T3 + 0 
129d : 85 3c __ STA T3 + 0 
129f : a9 00 __ LDA #$00
12a1 : e5 3d __ SBC T3 + 1 
12a3 : 85 3d __ STA T3 + 1 
.s68:
12a5 : a5 3c __ LDA T3 + 0 
12a7 : 85 27 __ STA ACCU + 0 
12a9 : a5 3d __ LDA T3 + 1 
12ab : 85 28 __ STA ACCU + 1 
12ad : a9 0a __ LDA #$0a
12af : 85 03 __ STA WORK + 0 
12b1 : a9 00 __ LDA #$00
12b3 : 85 04 __ STA WORK + 1 
12b5 : 20 dc 17 JSR $17dc ; (divs16 + 0)
12b8 : 18 __ __ CLC
12b9 : a5 27 __ LDA ACCU + 0 
12bb : 69 30 __ ADC #$30
12bd : a4 42 __ LDY T8 + 0 
12bf : c8 __ __ INY
12c0 : c8 __ __ INY
12c1 : 91 13 __ STA (P6),y ; (str + 0)
12c3 : a5 3c __ LDA T3 + 0 
12c5 : 85 27 __ STA ACCU + 0 
12c7 : a5 3d __ LDA T3 + 1 
12c9 : 85 28 __ STA ACCU + 1 
12cb : a9 0a __ LDA #$0a
12cd : 85 03 __ STA WORK + 0 
12cf : a9 00 __ LDA #$00
12d1 : 85 04 __ STA WORK + 1 
12d3 : 20 9b 18 JSR $189b ; (mods16 + 0)
12d6 : 18 __ __ CLC
12d7 : a5 05 __ LDA WORK + 2 
12d9 : 69 30 __ ADC #$30
12db : a4 42 __ LDY T8 + 0 
12dd : c8 __ __ INY
12de : c8 __ __ INY
12df : c8 __ __ INY
12e0 : 91 13 __ STA (P6),y ; (str + 0)
12e2 : c8 __ __ INY
12e3 : 84 42 __ STY T8 + 0 
.s9:
12e5 : a5 42 __ LDA T8 + 0 
12e7 : a0 01 __ LDY #$01
12e9 : d1 11 __ CMP (P4),y ; (si + 0)
12eb : b0 62 __ BCS $134f ; (nformf.s1001 + 0)
.s69:
12ed : 85 33 __ STA T0 + 0 
12ef : a0 06 __ LDY #$06
12f1 : b1 11 __ LDA (P4),y ; (si + 0)
12f3 : f0 05 __ BEQ $12fa ; (nformf.s73 + 0)
.s72:
12f5 : a5 42 __ LDA T8 + 0 
12f7 : aa __ __ TAX
12f8 : 90 5c __ BCC $1356 ; (nformf.l75 + 0)
.s73:
12fa : a5 42 __ LDA T8 + 0 
12fc : f0 32 __ BEQ $1330 ; (nformf.s82 + 0)
.s90:
12fe : a9 01 __ LDA #$01
1300 : 85 40 __ STA T5 + 0 
1302 : 85 3b __ STA T2 + 0 
1304 : a6 14 __ LDX P7 ; (str + 1)
1306 : 38 __ __ SEC
.l1071:
1307 : a0 01 __ LDY #$01
1309 : b1 11 __ LDA (P4),y ; (si + 0)
130b : e5 3b __ SBC T2 + 0 
130d : 85 3c __ STA T3 + 0 
130f : 8a __ __ TXA
1310 : 69 ff __ ADC #$ff
1312 : 85 3d __ STA T3 + 1 
1314 : 38 __ __ SEC
1315 : a5 42 __ LDA T8 + 0 
1317 : e5 3b __ SBC T2 + 0 
1319 : 85 3e __ STA T4 + 0 
131b : 8a __ __ TXA
131c : 69 ff __ ADC #$ff
131e : 85 3f __ STA T4 + 1 
1320 : a4 13 __ LDY P6 ; (str + 0)
1322 : b1 3e __ LDA (T4 + 0),y 
1324 : 91 3c __ STA (T3 + 0),y 
1326 : e6 3b __ INC T2 + 0 
1328 : e6 40 __ INC T5 + 0 
132a : a5 42 __ LDA T8 + 0 
132c : c5 40 __ CMP T5 + 0 
132e : b0 d7 __ BCS $1307 ; (nformf.l1071 + 0)
.s82:
1330 : a9 00 __ LDA #$00
1332 : 85 3e __ STA T4 + 0 
1334 : 90 08 __ BCC $133e ; (nformf.l83 + 0)
.s84:
1336 : a9 20 __ LDA #$20
1338 : a4 3e __ LDY T4 + 0 
133a : 91 13 __ STA (P6),y ; (str + 0)
133c : e6 3e __ INC T4 + 0 
.l83:
133e : a0 01 __ LDY #$01
1340 : b1 11 __ LDA (P4),y ; (si + 0)
1342 : 38 __ __ SEC
1343 : e5 33 __ SBC T0 + 0 
1345 : 90 ef __ BCC $1336 ; (nformf.s84 + 0)
.s1005:
1347 : c5 3e __ CMP T4 + 0 
1349 : 90 02 __ BCC $134d ; (nformf.s74 + 0)
.s1081:
134b : d0 e9 __ BNE $1336 ; (nformf.s84 + 0)
.s74:
134d : b1 11 __ LDA (P4),y ; (si + 0)
.s1001:
134f : 85 27 __ STA ACCU + 0 
1351 : a9 00 __ LDA #$00
1353 : 85 28 __ STA ACCU + 1 
1355 : 60 __ __ RTS
.l75:
1356 : a0 01 __ LDY #$01
1358 : d1 11 __ CMP (P4),y ; (si + 0)
135a : b0 f1 __ BCS $134d ; (nformf.s74 + 0)
.s76:
135c : a8 __ __ TAY
135d : a9 20 __ LDA #$20
135f : 91 13 __ STA (P6),y ; (str + 0)
1361 : e8 __ __ INX
1362 : 8a __ __ TXA
1363 : 90 f1 __ BCC $1356 ; (nformf.l75 + 0)
.s30:
1365 : a5 3e __ LDA T4 + 0 
1367 : c9 07 __ CMP #$07
1369 : 90 14 __ BCC $137f ; (nformf.s41 + 0)
.s42:
136b : ad 5a 1a LDA $1a5a ; (fround5 + 24)
136e : 85 37 __ STA T1 + 0 
1370 : ad 5b 1a LDA $1a5b ; (fround5 + 25)
1373 : 85 38 __ STA T1 + 1 
1375 : ad 5c 1a LDA $1a5c ; (fround5 + 26)
1378 : 85 39 __ STA T1 + 2 
137a : ad 5d 1a LDA $1a5d ; (fround5 + 27)
137d : b0 15 __ BCS $1394 ; (nformf.s241 + 0)
.s41:
137f : 0a __ __ ASL
1380 : 0a __ __ ASL
1381 : aa __ __ TAX
1382 : bd 3e 1a LDA $1a3e,x ; (tile + 1)
1385 : 85 37 __ STA T1 + 0 
1387 : bd 3f 1a LDA $1a3f,x ; (tile + 2)
138a : 85 38 __ STA T1 + 1 
138c : bd 40 1a LDA $1a40,x ; (tile + 3)
138f : 85 39 __ STA T1 + 2 
1391 : bd 41 1a LDA $1a41,x ; (giocharmap + 0)
.s241:
1394 : 85 3a __ STA T1 + 3 
1396 : a5 33 __ LDA T0 + 0 
1398 : 85 27 __ STA ACCU + 0 
139a : a5 34 __ LDA T0 + 1 
139c : 85 28 __ STA ACCU + 1 
139e : a5 35 __ LDA T0 + 2 
13a0 : 85 29 __ STA ACCU + 2 
13a2 : a5 36 __ LDA T0 + 3 
13a4 : 85 2a __ STA ACCU + 3 
13a6 : a2 37 __ LDX #$37
13a8 : 20 38 15 JSR $1538 ; (freg + 4)
13ab : 20 7f 15 JSR $157f ; (faddsub + 6)
13ae : a5 28 __ LDA ACCU + 1 
13b0 : 85 16 __ STA P9 ; (f + 1)
13b2 : a5 29 __ LDA ACCU + 2 
13b4 : 85 17 __ STA P10 ; (f + 2)
13b6 : a6 27 __ LDX ACCU + 0 
13b8 : a5 2a __ LDA ACCU + 3 
13ba : 85 18 __ STA P11 ; (f + 3)
13bc : 10 03 __ BPL $13c1 ; (nformf.s1019 + 0)
13be : 4c dd 11 JMP $11dd ; (nformf.s31 + 0)
.s1019:
13c1 : c9 41 __ CMP #$41
13c3 : d0 06 __ BNE $13cb ; (nformf.s1023 + 0)
.s1020:
13c5 : a5 17 __ LDA P10 ; (f + 2)
13c7 : c9 20 __ CMP #$20
13c9 : f0 02 __ BEQ $13cd ; (nformf.s44 + 0)
.s1023:
13cb : 90 f1 __ BCC $13be ; (nformf.s241 + 42)
.s44:
13cd : a9 00 __ LDA #$00
13cf : 85 03 __ STA WORK + 0 
13d1 : 85 04 __ STA WORK + 1 
13d3 : a9 20 __ LDA #$20
13d5 : 85 05 __ STA WORK + 2 
13d7 : a9 41 __ LDA #$41
13d9 : 85 06 __ STA WORK + 3 
13db : 20 48 15 JSR $1548 ; (freg + 20)
13de : 20 2e 17 JSR $172e ; (crt_fdiv + 0)
13e1 : a5 28 __ LDA ACCU + 1 
13e3 : 85 16 __ STA P9 ; (f + 1)
13e5 : a5 29 __ LDA ACCU + 2 
13e7 : 85 17 __ STA P10 ; (f + 2)
13e9 : a5 2a __ LDA ACCU + 3 
13eb : 85 18 __ STA P11 ; (f + 3)
13ed : a6 27 __ LDX ACCU + 0 
13ef : e6 3c __ INC T3 + 0 
13f1 : d0 cb __ BNE $13be ; (nformf.s241 + 42)
.s1086:
13f3 : e6 3d __ INC T3 + 1 
13f5 : 4c dd 11 JMP $11dd ; (nformf.s31 + 0)
.s13:
13f8 : a5 18 __ LDA P11 ; (f + 3)
13fa : 30 72 __ BMI $146e ; (nformf.l17 + 0)
.l1045:
13fc : c9 44 __ CMP #$44
13fe : d0 09 __ BNE $1409 ; (nformf.s1049 + 0)
.s1046:
1400 : a5 35 __ LDA T0 + 2 
1402 : c9 7a __ CMP #$7a
1404 : d0 03 __ BNE $1409 ; (nformf.s1049 + 0)
1406 : 4c a2 14 JMP $14a2 ; (nformf.s14 + 0)
.s1049:
1409 : b0 fb __ BCS $1406 ; (nformf.s1046 + 6)
.s16:
140b : a5 36 __ LDA T0 + 3 
140d : 30 5f __ BMI $146e ; (nformf.l17 + 0)
.s1037:
140f : c9 3f __ CMP #$3f
1411 : d0 06 __ BNE $1419 ; (nformf.s1041 + 0)
.s1038:
1413 : a5 35 __ LDA T0 + 2 
1415 : c9 80 __ CMP #$80
1417 : f0 02 __ BEQ $141b ; (nformf.s19 + 0)
.s1041:
1419 : 90 53 __ BCC $146e ; (nformf.l17 + 0)
.s19:
141b : a5 36 __ LDA T0 + 3 
141d : c9 41 __ CMP #$41
141f : d0 06 __ BNE $1427 ; (nformf.l1033 + 0)
.s1030:
1421 : a5 35 __ LDA T0 + 2 
1423 : c9 20 __ CMP #$20
1425 : f0 05 __ BEQ $142c ; (nformf.l20 + 0)
.l1033:
1427 : b0 03 __ BCS $142c ; (nformf.l20 + 0)
1429 : 4c d2 10 JMP $10d2 ; (nformf.s12 + 0)
.l20:
142c : e6 3c __ INC T3 + 0 
142e : d0 02 __ BNE $1432 ; (nformf.s1085 + 0)
.s1084:
1430 : e6 3d __ INC T3 + 1 
.s1085:
1432 : a5 33 __ LDA T0 + 0 
1434 : 85 27 __ STA ACCU + 0 
1436 : a5 34 __ LDA T0 + 1 
1438 : 85 28 __ STA ACCU + 1 
143a : a5 35 __ LDA T0 + 2 
143c : 85 29 __ STA ACCU + 2 
143e : a5 36 __ LDA T0 + 3 
1440 : 85 2a __ STA ACCU + 3 
1442 : a9 00 __ LDA #$00
1444 : 85 03 __ STA WORK + 0 
1446 : 85 04 __ STA WORK + 1 
1448 : a9 20 __ LDA #$20
144a : 85 05 __ STA WORK + 2 
144c : a9 41 __ LDA #$41
144e : 85 06 __ STA WORK + 3 
1450 : 20 48 15 JSR $1548 ; (freg + 20)
1453 : 20 2e 17 JSR $172e ; (crt_fdiv + 0)
1456 : a5 27 __ LDA ACCU + 0 
1458 : 85 33 __ STA T0 + 0 
145a : a5 28 __ LDA ACCU + 1 
145c : 85 34 __ STA T0 + 1 
145e : a5 29 __ LDA ACCU + 2 
1460 : 85 35 __ STA T0 + 2 
1462 : a5 2a __ LDA ACCU + 3 
1464 : 85 36 __ STA T0 + 3 
1466 : 30 c1 __ BMI $1429 ; (nformf.l1033 + 2)
.s1029:
1468 : c9 41 __ CMP #$41
146a : d0 bb __ BNE $1427 ; (nformf.l1033 + 0)
146c : f0 b3 __ BEQ $1421 ; (nformf.s1030 + 0)
.l17:
146e : 38 __ __ SEC
146f : a5 3c __ LDA T3 + 0 
1471 : e9 03 __ SBC #$03
1473 : 85 3c __ STA T3 + 0 
1475 : b0 02 __ BCS $1479 ; (nformf.s1083 + 0)
.s1082:
1477 : c6 3d __ DEC T3 + 1 
.s1083:
1479 : a9 00 __ LDA #$00
147b : 85 27 __ STA ACCU + 0 
147d : 85 28 __ STA ACCU + 1 
147f : a9 7a __ LDA #$7a
1481 : 85 29 __ STA ACCU + 2 
1483 : a9 44 __ LDA #$44
1485 : 85 2a __ STA ACCU + 3 
1487 : a2 33 __ LDX #$33
1489 : 20 38 15 JSR $1538 ; (freg + 4)
148c : 20 66 16 JSR $1666 ; (crt_fmul + 0)
148f : a5 27 __ LDA ACCU + 0 
1491 : 85 33 __ STA T0 + 0 
1493 : a5 28 __ LDA ACCU + 1 
1495 : 85 34 __ STA T0 + 1 
1497 : a5 29 __ LDA ACCU + 2 
1499 : 85 35 __ STA T0 + 2 
149b : a5 2a __ LDA ACCU + 3 
149d : 85 36 __ STA T0 + 3 
149f : 4c 0b 14 JMP $140b ; (nformf.s16 + 0)
.s14:
14a2 : 18 __ __ CLC
14a3 : a5 3c __ LDA T3 + 0 
14a5 : 69 03 __ ADC #$03
14a7 : 85 3c __ STA T3 + 0 
14a9 : 90 02 __ BCC $14ad ; (nformf.s1089 + 0)
.s1088:
14ab : e6 3d __ INC T3 + 1 
.s1089:
14ad : a5 33 __ LDA T0 + 0 
14af : 85 27 __ STA ACCU + 0 
14b1 : a5 34 __ LDA T0 + 1 
14b3 : 85 28 __ STA ACCU + 1 
14b5 : a5 35 __ LDA T0 + 2 
14b7 : 85 29 __ STA ACCU + 2 
14b9 : a5 36 __ LDA T0 + 3 
14bb : 85 2a __ STA ACCU + 3 
14bd : a9 00 __ LDA #$00
14bf : 85 03 __ STA WORK + 0 
14c1 : 85 04 __ STA WORK + 1 
14c3 : a9 7a __ LDA #$7a
14c5 : 85 05 __ STA WORK + 2 
14c7 : a9 44 __ LDA #$44
14c9 : 85 06 __ STA WORK + 3 
14cb : 20 48 15 JSR $1548 ; (freg + 20)
14ce : 20 2e 17 JSR $172e ; (crt_fdiv + 0)
14d1 : a5 27 __ LDA ACCU + 0 
14d3 : 85 33 __ STA T0 + 0 
14d5 : a5 28 __ LDA ACCU + 1 
14d7 : 85 34 __ STA T0 + 1 
14d9 : a5 29 __ LDA ACCU + 2 
14db : 85 35 __ STA T0 + 2 
14dd : a5 2a __ LDA ACCU + 3 
14df : 85 36 __ STA T0 + 3 
14e1 : 30 8b __ BMI $146e ; (nformf.l17 + 0)
14e3 : 4c fc 13 JMP $13fc ; (nformf.l1045 + 0)
.s7:
14e6 : 85 3b __ STA T2 + 0 
14e8 : a9 49 __ LDA #$49
14ea : 91 13 __ STA (P6),y ; (str + 0)
14ec : a9 4e __ LDA #$4e
14ee : a4 37 __ LDY T1 + 0 
14f0 : 91 13 __ STA (P6),y ; (str + 0)
14f2 : a9 46 __ LDA #$46
14f4 : a4 3b __ LDY T2 + 0 
14f6 : 91 13 __ STA (P6),y ; (str + 0)
14f8 : 18 __ __ CLC
14f9 : a5 42 __ LDA T8 + 0 
14fb : 69 03 __ ADC #$03
14fd : 85 42 __ STA T8 + 0 
14ff : 4c e5 12 JMP $12e5 ; (nformf.s9 + 0)
.s226:
1502 : 20 18 15 JSR $1518 ; (isinf.s0 + 0)
1505 : aa __ __ TAX
1506 : a0 01 __ LDY #$01
1508 : 84 42 __ STY T8 + 0 
150a : 8a __ __ TXA
150b : d0 03 __ BNE $1510 ; (nformf.s168 + 0)
150d : 4c ab 10 JMP $10ab ; (nformf.s8 + 0)
.s168:
1510 : a9 02 __ LDA #$02
1512 : 85 37 __ STA T1 + 0 
1514 : a9 03 __ LDA #$03
1516 : d0 ce __ BNE $14e6 ; (nformf.s7 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
.s0:
1518 : a5 0f __ LDA P2 ; (f + 2)
151a : 0a __ __ ASL
151b : a5 0f __ LDA P2 ; (f + 2)
151d : 29 7f __ AND #$7f
151f : 2a __ __ ROL
1520 : c9 ff __ CMP #$ff
1522 : d0 03 __ BNE $1527 ; (isinf.s1003 + 0)
.s1002:
1524 : a9 01 __ LDA #$01
1526 : 60 __ __ RTS
.s1003:
1527 : a9 00 __ LDA #$00
.s1001:
1529 : 60 __ __ RTS
--------------------------------------------------------------------
152a : __ __ __ BYT 54 49 4d 45 3a 20 25 75 0a 00                   : TIME: %u..
--------------------------------------------------------------------
freg: ; freg
1534 : b1 25 __ LDA (IP + 0),y 
1536 : c8 __ __ INY
1537 : aa __ __ TAX
1538 : b5 00 __ LDA $00,x 
153a : 85 03 __ STA WORK + 0 
153c : b5 01 __ LDA $01,x 
153e : 85 04 __ STA WORK + 1 
1540 : b5 02 __ LDA $02,x 
1542 : 85 05 __ STA WORK + 2 
1544 : b5 03 __ LDA WORK + 0,x 
1546 : 85 06 __ STA WORK + 3 
1548 : a5 05 __ LDA WORK + 2 
154a : 0a __ __ ASL
154b : a5 06 __ LDA WORK + 3 
154d : 2a __ __ ROL
154e : 85 08 __ STA WORK + 5 
1550 : f0 06 __ BEQ $1558 ; (freg + 36)
1552 : a5 05 __ LDA WORK + 2 
1554 : 09 80 __ ORA #$80
1556 : 85 05 __ STA WORK + 2 
1558 : a5 29 __ LDA ACCU + 2 
155a : 0a __ __ ASL
155b : a5 2a __ LDA ACCU + 3 
155d : 2a __ __ ROL
155e : 85 07 __ STA WORK + 4 
1560 : f0 06 __ BEQ $1568 ; (freg + 52)
1562 : a5 29 __ LDA ACCU + 2 
1564 : 09 80 __ ORA #$80
1566 : 85 29 __ STA ACCU + 2 
1568 : 60 __ __ RTS
1569 : 06 2a __ ASL ACCU + 3 
156b : a5 07 __ LDA WORK + 4 
156d : 6a __ __ ROR
156e : 85 2a __ STA ACCU + 3 
1570 : b0 06 __ BCS $1578 ; (freg + 68)
1572 : a5 29 __ LDA ACCU + 2 
1574 : 29 7f __ AND #$7f
1576 : 85 29 __ STA ACCU + 2 
1578 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1579 : a5 06 __ LDA WORK + 3 
157b : 49 80 __ EOR #$80
157d : 85 06 __ STA WORK + 3 
157f : a9 ff __ LDA #$ff
1581 : c5 07 __ CMP WORK + 4 
1583 : f0 04 __ BEQ $1589 ; (faddsub + 16)
1585 : c5 08 __ CMP WORK + 5 
1587 : d0 11 __ BNE $159a ; (faddsub + 33)
1589 : a5 2a __ LDA ACCU + 3 
158b : 09 7f __ ORA #$7f
158d : 85 2a __ STA ACCU + 3 
158f : a9 80 __ LDA #$80
1591 : 85 29 __ STA ACCU + 2 
1593 : a9 00 __ LDA #$00
1595 : 85 27 __ STA ACCU + 0 
1597 : 85 28 __ STA ACCU + 1 
1599 : 60 __ __ RTS
159a : 38 __ __ SEC
159b : a5 07 __ LDA WORK + 4 
159d : e5 08 __ SBC WORK + 5 
159f : f0 38 __ BEQ $15d9 ; (faddsub + 96)
15a1 : aa __ __ TAX
15a2 : b0 25 __ BCS $15c9 ; (faddsub + 80)
15a4 : e0 e9 __ CPX #$e9
15a6 : b0 0e __ BCS $15b6 ; (faddsub + 61)
15a8 : a5 08 __ LDA WORK + 5 
15aa : 85 07 __ STA WORK + 4 
15ac : a9 00 __ LDA #$00
15ae : 85 27 __ STA ACCU + 0 
15b0 : 85 28 __ STA ACCU + 1 
15b2 : 85 29 __ STA ACCU + 2 
15b4 : f0 23 __ BEQ $15d9 ; (faddsub + 96)
15b6 : a5 29 __ LDA ACCU + 2 
15b8 : 4a __ __ LSR
15b9 : 66 28 __ ROR ACCU + 1 
15bb : 66 27 __ ROR ACCU + 0 
15bd : e8 __ __ INX
15be : d0 f8 __ BNE $15b8 ; (faddsub + 63)
15c0 : 85 29 __ STA ACCU + 2 
15c2 : a5 08 __ LDA WORK + 5 
15c4 : 85 07 __ STA WORK + 4 
15c6 : 4c d9 15 JMP $15d9 ; (faddsub + 96)
15c9 : e0 18 __ CPX #$18
15cb : b0 33 __ BCS $1600 ; (faddsub + 135)
15cd : a5 05 __ LDA WORK + 2 
15cf : 4a __ __ LSR
15d0 : 66 04 __ ROR WORK + 1 
15d2 : 66 03 __ ROR WORK + 0 
15d4 : ca __ __ DEX
15d5 : d0 f8 __ BNE $15cf ; (faddsub + 86)
15d7 : 85 05 __ STA WORK + 2 
15d9 : a5 2a __ LDA ACCU + 3 
15db : 29 80 __ AND #$80
15dd : 85 2a __ STA ACCU + 3 
15df : 45 06 __ EOR WORK + 3 
15e1 : 30 31 __ BMI $1614 ; (faddsub + 155)
15e3 : 18 __ __ CLC
15e4 : a5 27 __ LDA ACCU + 0 
15e6 : 65 03 __ ADC WORK + 0 
15e8 : 85 27 __ STA ACCU + 0 
15ea : a5 28 __ LDA ACCU + 1 
15ec : 65 04 __ ADC WORK + 1 
15ee : 85 28 __ STA ACCU + 1 
15f0 : a5 29 __ LDA ACCU + 2 
15f2 : 65 05 __ ADC WORK + 2 
15f4 : 85 29 __ STA ACCU + 2 
15f6 : 90 08 __ BCC $1600 ; (faddsub + 135)
15f8 : 66 29 __ ROR ACCU + 2 
15fa : 66 28 __ ROR ACCU + 1 
15fc : 66 27 __ ROR ACCU + 0 
15fe : e6 07 __ INC WORK + 4 
1600 : a5 07 __ LDA WORK + 4 
1602 : c9 ff __ CMP #$ff
1604 : f0 83 __ BEQ $1589 ; (faddsub + 16)
1606 : 4a __ __ LSR
1607 : 05 2a __ ORA ACCU + 3 
1609 : 85 2a __ STA ACCU + 3 
160b : b0 06 __ BCS $1613 ; (faddsub + 154)
160d : a5 29 __ LDA ACCU + 2 
160f : 29 7f __ AND #$7f
1611 : 85 29 __ STA ACCU + 2 
1613 : 60 __ __ RTS
1614 : 38 __ __ SEC
1615 : a5 27 __ LDA ACCU + 0 
1617 : e5 03 __ SBC WORK + 0 
1619 : 85 27 __ STA ACCU + 0 
161b : a5 28 __ LDA ACCU + 1 
161d : e5 04 __ SBC WORK + 1 
161f : 85 28 __ STA ACCU + 1 
1621 : a5 29 __ LDA ACCU + 2 
1623 : e5 05 __ SBC WORK + 2 
1625 : 85 29 __ STA ACCU + 2 
1627 : b0 19 __ BCS $1642 ; (faddsub + 201)
1629 : 38 __ __ SEC
162a : a9 00 __ LDA #$00
162c : e5 27 __ SBC ACCU + 0 
162e : 85 27 __ STA ACCU + 0 
1630 : a9 00 __ LDA #$00
1632 : e5 28 __ SBC ACCU + 1 
1634 : 85 28 __ STA ACCU + 1 
1636 : a9 00 __ LDA #$00
1638 : e5 29 __ SBC ACCU + 2 
163a : 85 29 __ STA ACCU + 2 
163c : a5 2a __ LDA ACCU + 3 
163e : 49 80 __ EOR #$80
1640 : 85 2a __ STA ACCU + 3 
1642 : a5 29 __ LDA ACCU + 2 
1644 : 30 ba __ BMI $1600 ; (faddsub + 135)
1646 : 05 28 __ ORA ACCU + 1 
1648 : 05 27 __ ORA ACCU + 0 
164a : f0 0f __ BEQ $165b ; (faddsub + 226)
164c : c6 07 __ DEC WORK + 4 
164e : f0 0b __ BEQ $165b ; (faddsub + 226)
1650 : 06 27 __ ASL ACCU + 0 
1652 : 26 28 __ ROL ACCU + 1 
1654 : 26 29 __ ROL ACCU + 2 
1656 : 10 f4 __ BPL $164c ; (faddsub + 211)
1658 : 4c 00 16 JMP $1600 ; (faddsub + 135)
165b : a9 00 __ LDA #$00
165d : 85 27 __ STA ACCU + 0 
165f : 85 28 __ STA ACCU + 1 
1661 : 85 29 __ STA ACCU + 2 
1663 : 85 2a __ STA ACCU + 3 
1665 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1666 : a5 27 __ LDA ACCU + 0 
1668 : 05 28 __ ORA ACCU + 1 
166a : 05 29 __ ORA ACCU + 2 
166c : f0 0e __ BEQ $167c ; (crt_fmul + 22)
166e : a5 03 __ LDA WORK + 0 
1670 : 05 04 __ ORA WORK + 1 
1672 : 05 05 __ ORA WORK + 2 
1674 : d0 09 __ BNE $167f ; (crt_fmul + 25)
1676 : 85 27 __ STA ACCU + 0 
1678 : 85 28 __ STA ACCU + 1 
167a : 85 29 __ STA ACCU + 2 
167c : 85 2a __ STA ACCU + 3 
167e : 60 __ __ RTS
167f : a5 2a __ LDA ACCU + 3 
1681 : 45 06 __ EOR WORK + 3 
1683 : 29 80 __ AND #$80
1685 : 85 2a __ STA ACCU + 3 
1687 : a9 ff __ LDA #$ff
1689 : c5 07 __ CMP WORK + 4 
168b : f0 42 __ BEQ $16cf ; (crt_fmul + 105)
168d : c5 08 __ CMP WORK + 5 
168f : f0 3e __ BEQ $16cf ; (crt_fmul + 105)
1691 : a9 00 __ LDA #$00
1693 : 85 09 __ STA WORK + 6 
1695 : 85 0a __ STA WORK + 7 
1697 : 85 0b __ STA WORK + 8 
1699 : a4 27 __ LDY ACCU + 0 
169b : a5 03 __ LDA WORK + 0 
169d : d0 06 __ BNE $16a5 ; (crt_fmul + 63)
169f : a5 04 __ LDA WORK + 1 
16a1 : f0 0a __ BEQ $16ad ; (crt_fmul + 71)
16a3 : d0 05 __ BNE $16aa ; (crt_fmul + 68)
16a5 : 20 00 17 JSR $1700 ; (crt_fmul8 + 0)
16a8 : a5 04 __ LDA WORK + 1 
16aa : 20 00 17 JSR $1700 ; (crt_fmul8 + 0)
16ad : a5 05 __ LDA WORK + 2 
16af : 20 00 17 JSR $1700 ; (crt_fmul8 + 0)
16b2 : 38 __ __ SEC
16b3 : a5 0b __ LDA WORK + 8 
16b5 : 30 06 __ BMI $16bd ; (crt_fmul + 87)
16b7 : 06 09 __ ASL WORK + 6 
16b9 : 26 0a __ ROL WORK + 7 
16bb : 2a __ __ ROL
16bc : 18 __ __ CLC
16bd : 29 7f __ AND #$7f
16bf : 85 0b __ STA WORK + 8 
16c1 : a5 07 __ LDA WORK + 4 
16c3 : 65 08 __ ADC WORK + 5 
16c5 : 90 19 __ BCC $16e0 ; (crt_fmul + 122)
16c7 : e9 7f __ SBC #$7f
16c9 : b0 04 __ BCS $16cf ; (crt_fmul + 105)
16cb : c9 ff __ CMP #$ff
16cd : d0 15 __ BNE $16e4 ; (crt_fmul + 126)
16cf : a5 2a __ LDA ACCU + 3 
16d1 : 09 7f __ ORA #$7f
16d3 : 85 2a __ STA ACCU + 3 
16d5 : a9 80 __ LDA #$80
16d7 : 85 29 __ STA ACCU + 2 
16d9 : a9 00 __ LDA #$00
16db : 85 27 __ STA ACCU + 0 
16dd : 85 28 __ STA ACCU + 1 
16df : 60 __ __ RTS
16e0 : e9 7e __ SBC #$7e
16e2 : 90 15 __ BCC $16f9 ; (crt_fmul + 147)
16e4 : 4a __ __ LSR
16e5 : 05 2a __ ORA ACCU + 3 
16e7 : 85 2a __ STA ACCU + 3 
16e9 : a9 00 __ LDA #$00
16eb : 6a __ __ ROR
16ec : 05 0b __ ORA WORK + 8 
16ee : 85 29 __ STA ACCU + 2 
16f0 : a5 0a __ LDA WORK + 7 
16f2 : 85 28 __ STA ACCU + 1 
16f4 : a5 09 __ LDA WORK + 6 
16f6 : 85 27 __ STA ACCU + 0 
16f8 : 60 __ __ RTS
16f9 : a9 00 __ LDA #$00
16fb : 85 2a __ STA ACCU + 3 
16fd : f0 d8 __ BEQ $16d7 ; (crt_fmul + 113)
16ff : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1700 : 38 __ __ SEC
1701 : 6a __ __ ROR
1702 : 90 1e __ BCC $1722 ; (crt_fmul8 + 34)
1704 : aa __ __ TAX
1705 : 18 __ __ CLC
1706 : 98 __ __ TYA
1707 : 65 09 __ ADC WORK + 6 
1709 : 85 09 __ STA WORK + 6 
170b : a5 0a __ LDA WORK + 7 
170d : 65 28 __ ADC ACCU + 1 
170f : 85 0a __ STA WORK + 7 
1711 : a5 0b __ LDA WORK + 8 
1713 : 65 29 __ ADC ACCU + 2 
1715 : 6a __ __ ROR
1716 : 85 0b __ STA WORK + 8 
1718 : 8a __ __ TXA
1719 : 66 0a __ ROR WORK + 7 
171b : 66 09 __ ROR WORK + 6 
171d : 4a __ __ LSR
171e : f0 0d __ BEQ $172d ; (crt_fmul8 + 45)
1720 : b0 e2 __ BCS $1704 ; (crt_fmul8 + 4)
1722 : 66 0b __ ROR WORK + 8 
1724 : 66 0a __ ROR WORK + 7 
1726 : 66 09 __ ROR WORK + 6 
1728 : 4a __ __ LSR
1729 : 90 f7 __ BCC $1722 ; (crt_fmul8 + 34)
172b : d0 d7 __ BNE $1704 ; (crt_fmul8 + 4)
172d : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
172e : a5 27 __ LDA ACCU + 0 
1730 : 05 28 __ ORA ACCU + 1 
1732 : 05 29 __ ORA ACCU + 2 
1734 : d0 03 __ BNE $1739 ; (crt_fdiv + 11)
1736 : 85 2a __ STA ACCU + 3 
1738 : 60 __ __ RTS
1739 : a5 2a __ LDA ACCU + 3 
173b : 45 06 __ EOR WORK + 3 
173d : 29 80 __ AND #$80
173f : 85 2a __ STA ACCU + 3 
1741 : a5 08 __ LDA WORK + 5 
1743 : f0 62 __ BEQ $17a7 ; (crt_fdiv + 121)
1745 : a5 07 __ LDA WORK + 4 
1747 : c9 ff __ CMP #$ff
1749 : f0 5c __ BEQ $17a7 ; (crt_fdiv + 121)
174b : a9 00 __ LDA #$00
174d : 85 09 __ STA WORK + 6 
174f : 85 0a __ STA WORK + 7 
1751 : 85 0b __ STA WORK + 8 
1753 : a2 18 __ LDX #$18
1755 : a5 27 __ LDA ACCU + 0 
1757 : c5 03 __ CMP WORK + 0 
1759 : a5 28 __ LDA ACCU + 1 
175b : e5 04 __ SBC WORK + 1 
175d : a5 29 __ LDA ACCU + 2 
175f : e5 05 __ SBC WORK + 2 
1761 : 90 13 __ BCC $1776 ; (crt_fdiv + 72)
1763 : a5 27 __ LDA ACCU + 0 
1765 : e5 03 __ SBC WORK + 0 
1767 : 85 27 __ STA ACCU + 0 
1769 : a5 28 __ LDA ACCU + 1 
176b : e5 04 __ SBC WORK + 1 
176d : 85 28 __ STA ACCU + 1 
176f : a5 29 __ LDA ACCU + 2 
1771 : e5 05 __ SBC WORK + 2 
1773 : 85 29 __ STA ACCU + 2 
1775 : 38 __ __ SEC
1776 : 26 09 __ ROL WORK + 6 
1778 : 26 0a __ ROL WORK + 7 
177a : 26 0b __ ROL WORK + 8 
177c : ca __ __ DEX
177d : f0 0a __ BEQ $1789 ; (crt_fdiv + 91)
177f : 06 27 __ ASL ACCU + 0 
1781 : 26 28 __ ROL ACCU + 1 
1783 : 26 29 __ ROL ACCU + 2 
1785 : b0 dc __ BCS $1763 ; (crt_fdiv + 53)
1787 : 90 cc __ BCC $1755 ; (crt_fdiv + 39)
1789 : 38 __ __ SEC
178a : a5 0b __ LDA WORK + 8 
178c : 30 06 __ BMI $1794 ; (crt_fdiv + 102)
178e : 06 09 __ ASL WORK + 6 
1790 : 26 0a __ ROL WORK + 7 
1792 : 2a __ __ ROL
1793 : 18 __ __ CLC
1794 : 29 7f __ AND #$7f
1796 : 85 0b __ STA WORK + 8 
1798 : a5 07 __ LDA WORK + 4 
179a : e5 08 __ SBC WORK + 5 
179c : 90 1a __ BCC $17b8 ; (crt_fdiv + 138)
179e : 18 __ __ CLC
179f : 69 7f __ ADC #$7f
17a1 : b0 04 __ BCS $17a7 ; (crt_fdiv + 121)
17a3 : c9 ff __ CMP #$ff
17a5 : d0 15 __ BNE $17bc ; (crt_fdiv + 142)
17a7 : a5 2a __ LDA ACCU + 3 
17a9 : 09 7f __ ORA #$7f
17ab : 85 2a __ STA ACCU + 3 
17ad : a9 80 __ LDA #$80
17af : 85 29 __ STA ACCU + 2 
17b1 : a9 00 __ LDA #$00
17b3 : 85 28 __ STA ACCU + 1 
17b5 : 85 27 __ STA ACCU + 0 
17b7 : 60 __ __ RTS
17b8 : 69 7f __ ADC #$7f
17ba : 90 15 __ BCC $17d1 ; (crt_fdiv + 163)
17bc : 4a __ __ LSR
17bd : 05 2a __ ORA ACCU + 3 
17bf : 85 2a __ STA ACCU + 3 
17c1 : a9 00 __ LDA #$00
17c3 : 6a __ __ ROR
17c4 : 05 0b __ ORA WORK + 8 
17c6 : 85 29 __ STA ACCU + 2 
17c8 : a5 0a __ LDA WORK + 7 
17ca : 85 28 __ STA ACCU + 1 
17cc : a5 09 __ LDA WORK + 6 
17ce : 85 27 __ STA ACCU + 0 
17d0 : 60 __ __ RTS
17d1 : a9 00 __ LDA #$00
17d3 : 85 2a __ STA ACCU + 3 
17d5 : 85 29 __ STA ACCU + 2 
17d7 : 85 28 __ STA ACCU + 1 
17d9 : 85 27 __ STA ACCU + 0 
17db : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
17dc : 24 28 __ BIT ACCU + 1 
17de : 10 0d __ BPL $17ed ; (divs16 + 17)
17e0 : 20 fa 17 JSR $17fa ; (negaccu + 0)
17e3 : 24 04 __ BIT WORK + 1 
17e5 : 10 0d __ BPL $17f4 ; (divs16 + 24)
17e7 : 20 08 18 JSR $1808 ; (negtmp + 0)
17ea : 4c 16 18 JMP $1816 ; (divmod + 0)
17ed : 24 04 __ BIT WORK + 1 
17ef : 10 f9 __ BPL $17ea ; (divs16 + 14)
17f1 : 20 08 18 JSR $1808 ; (negtmp + 0)
17f4 : 20 16 18 JSR $1816 ; (divmod + 0)
17f7 : 4c fa 17 JMP $17fa ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
17fa : 38 __ __ SEC
17fb : a9 00 __ LDA #$00
17fd : e5 27 __ SBC ACCU + 0 
17ff : 85 27 __ STA ACCU + 0 
1801 : a9 00 __ LDA #$00
1803 : e5 28 __ SBC ACCU + 1 
1805 : 85 28 __ STA ACCU + 1 
1807 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1808 : 38 __ __ SEC
1809 : a9 00 __ LDA #$00
180b : e5 03 __ SBC WORK + 0 
180d : 85 03 __ STA WORK + 0 
180f : a9 00 __ LDA #$00
1811 : e5 04 __ SBC WORK + 1 
1813 : 85 04 __ STA WORK + 1 
1815 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1816 : a5 28 __ LDA ACCU + 1 
1818 : d0 31 __ BNE $184b ; (divmod + 53)
181a : a5 04 __ LDA WORK + 1 
181c : d0 1e __ BNE $183c ; (divmod + 38)
181e : 85 06 __ STA WORK + 3 
1820 : a2 04 __ LDX #$04
1822 : 06 27 __ ASL ACCU + 0 
1824 : 2a __ __ ROL
1825 : c5 03 __ CMP WORK + 0 
1827 : 90 02 __ BCC $182b ; (divmod + 21)
1829 : e5 03 __ SBC WORK + 0 
182b : 26 27 __ ROL ACCU + 0 
182d : 2a __ __ ROL
182e : c5 03 __ CMP WORK + 0 
1830 : 90 02 __ BCC $1834 ; (divmod + 30)
1832 : e5 03 __ SBC WORK + 0 
1834 : 26 27 __ ROL ACCU + 0 
1836 : ca __ __ DEX
1837 : d0 eb __ BNE $1824 ; (divmod + 14)
1839 : 85 05 __ STA WORK + 2 
183b : 60 __ __ RTS
183c : a5 27 __ LDA ACCU + 0 
183e : 85 05 __ STA WORK + 2 
1840 : a5 28 __ LDA ACCU + 1 
1842 : 85 06 __ STA WORK + 3 
1844 : a9 00 __ LDA #$00
1846 : 85 27 __ STA ACCU + 0 
1848 : 85 28 __ STA ACCU + 1 
184a : 60 __ __ RTS
184b : a5 04 __ LDA WORK + 1 
184d : d0 1f __ BNE $186e ; (divmod + 88)
184f : a5 03 __ LDA WORK + 0 
1851 : 30 1b __ BMI $186e ; (divmod + 88)
1853 : a9 00 __ LDA #$00
1855 : 85 06 __ STA WORK + 3 
1857 : a2 10 __ LDX #$10
1859 : 06 27 __ ASL ACCU + 0 
185b : 26 28 __ ROL ACCU + 1 
185d : 2a __ __ ROL
185e : c5 03 __ CMP WORK + 0 
1860 : 90 02 __ BCC $1864 ; (divmod + 78)
1862 : e5 03 __ SBC WORK + 0 
1864 : 26 27 __ ROL ACCU + 0 
1866 : 26 28 __ ROL ACCU + 1 
1868 : ca __ __ DEX
1869 : d0 f2 __ BNE $185d ; (divmod + 71)
186b : 85 05 __ STA WORK + 2 
186d : 60 __ __ RTS
186e : a9 00 __ LDA #$00
1870 : 85 05 __ STA WORK + 2 
1872 : 85 06 __ STA WORK + 3 
1874 : 84 02 __ STY $02 
1876 : a0 10 __ LDY #$10
1878 : 18 __ __ CLC
1879 : 26 27 __ ROL ACCU + 0 
187b : 26 28 __ ROL ACCU + 1 
187d : 26 05 __ ROL WORK + 2 
187f : 26 06 __ ROL WORK + 3 
1881 : 38 __ __ SEC
1882 : a5 05 __ LDA WORK + 2 
1884 : e5 03 __ SBC WORK + 0 
1886 : aa __ __ TAX
1887 : a5 06 __ LDA WORK + 3 
1889 : e5 04 __ SBC WORK + 1 
188b : 90 04 __ BCC $1891 ; (divmod + 123)
188d : 86 05 __ STX WORK + 2 
188f : 85 06 __ STA WORK + 3 
1891 : 88 __ __ DEY
1892 : d0 e5 __ BNE $1879 ; (divmod + 99)
1894 : 26 27 __ ROL ACCU + 0 
1896 : 26 28 __ ROL ACCU + 1 
1898 : a4 02 __ LDY $02 
189a : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
189b : 24 28 __ BIT ACCU + 1 
189d : 10 0d __ BPL $18ac ; (mods16 + 17)
189f : 20 fa 17 JSR $17fa ; (negaccu + 0)
18a2 : 24 04 __ BIT WORK + 1 
18a4 : 10 0d __ BPL $18b3 ; (mods16 + 24)
18a6 : 20 08 18 JSR $1808 ; (negtmp + 0)
18a9 : 4c 16 18 JMP $1816 ; (divmod + 0)
18ac : 24 04 __ BIT WORK + 1 
18ae : 10 f9 __ BPL $18a9 ; (mods16 + 14)
18b0 : 20 08 18 JSR $1808 ; (negtmp + 0)
18b3 : 20 16 18 JSR $1816 ; (divmod + 0)
18b6 : 38 __ __ SEC
18b7 : a9 00 __ LDA #$00
18b9 : e5 05 __ SBC WORK + 2 
18bb : 85 05 __ STA WORK + 2 
18bd : a9 00 __ LDA #$00
18bf : e5 06 __ SBC WORK + 3 
18c1 : 85 06 __ STA WORK + 3 
18c3 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
18c4 : 20 58 15 JSR $1558 ; (freg + 36)
18c7 : a5 07 __ LDA WORK + 4 
18c9 : c9 7f __ CMP #$7f
18cb : b0 07 __ BCS $18d4 ; (f32_to_i16 + 16)
18cd : a9 00 __ LDA #$00
18cf : 85 27 __ STA ACCU + 0 
18d1 : 85 28 __ STA ACCU + 1 
18d3 : 60 __ __ RTS
18d4 : 38 __ __ SEC
18d5 : e9 8e __ SBC #$8e
18d7 : 90 16 __ BCC $18ef ; (f32_to_i16 + 43)
18d9 : 24 2a __ BIT ACCU + 3 
18db : 30 09 __ BMI $18e6 ; (f32_to_i16 + 34)
18dd : a9 ff __ LDA #$ff
18df : 85 27 __ STA ACCU + 0 
18e1 : a9 7f __ LDA #$7f
18e3 : 85 28 __ STA ACCU + 1 
18e5 : 60 __ __ RTS
18e6 : a9 00 __ LDA #$00
18e8 : 85 27 __ STA ACCU + 0 
18ea : a9 80 __ LDA #$80
18ec : 85 28 __ STA ACCU + 1 
18ee : 60 __ __ RTS
18ef : aa __ __ TAX
18f0 : 46 29 __ LSR ACCU + 2 
18f2 : 66 28 __ ROR ACCU + 1 
18f4 : e8 __ __ INX
18f5 : d0 f9 __ BNE $18f0 ; (f32_to_i16 + 44)
18f7 : 24 2a __ BIT ACCU + 3 
18f9 : 10 0e __ BPL $1909 ; (f32_to_i16 + 69)
18fb : 38 __ __ SEC
18fc : a9 00 __ LDA #$00
18fe : e5 28 __ SBC ACCU + 1 
1900 : 85 27 __ STA ACCU + 0 
1902 : a9 00 __ LDA #$00
1904 : e5 29 __ SBC ACCU + 2 
1906 : 85 28 __ STA ACCU + 1 
1908 : 60 __ __ RTS
1909 : a5 28 __ LDA ACCU + 1 
190b : 85 27 __ STA ACCU + 0 
190d : a5 29 __ LDA ACCU + 2 
190f : 85 28 __ STA ACCU + 1 
1911 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1912 : 24 28 __ BIT ACCU + 1 
1914 : 30 03 __ BMI $1919 ; (sint16_to_float + 7)
1916 : 4c 30 19 JMP $1930 ; (uint16_to_float + 0)
1919 : 38 __ __ SEC
191a : a9 00 __ LDA #$00
191c : e5 27 __ SBC ACCU + 0 
191e : 85 27 __ STA ACCU + 0 
1920 : a9 00 __ LDA #$00
1922 : e5 28 __ SBC ACCU + 1 
1924 : 85 28 __ STA ACCU + 1 
1926 : 20 30 19 JSR $1930 ; (uint16_to_float + 0)
1929 : a5 2a __ LDA ACCU + 3 
192b : 09 80 __ ORA #$80
192d : 85 2a __ STA ACCU + 3 
192f : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1930 : a5 27 __ LDA ACCU + 0 
1932 : 05 28 __ ORA ACCU + 1 
1934 : d0 05 __ BNE $193b ; (uint16_to_float + 11)
1936 : 85 29 __ STA ACCU + 2 
1938 : 85 2a __ STA ACCU + 3 
193a : 60 __ __ RTS
193b : a2 8e __ LDX #$8e
193d : a5 28 __ LDA ACCU + 1 
193f : 30 06 __ BMI $1947 ; (uint16_to_float + 23)
1941 : ca __ __ DEX
1942 : 06 27 __ ASL ACCU + 0 
1944 : 2a __ __ ROL
1945 : 10 fa __ BPL $1941 ; (uint16_to_float + 17)
1947 : 29 7f __ AND #$7f
1949 : 85 29 __ STA ACCU + 2 
194b : a5 27 __ LDA ACCU + 0 
194d : 85 28 __ STA ACCU + 1 
194f : 8a __ __ TXA
1950 : 4a __ __ LSR
1951 : 85 2a __ STA ACCU + 3 
1953 : a9 00 __ LDA #$00
1955 : 85 27 __ STA ACCU + 0 
1957 : 6a __ __ ROR
1958 : 05 29 __ ORA ACCU + 2 
195a : 85 29 __ STA ACCU + 2 
195c : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
195d : 84 02 __ STY $02 
195f : a0 20 __ LDY #$20
1961 : a9 00 __ LDA #$00
1963 : 85 07 __ STA WORK + 4 
1965 : 85 08 __ STA WORK + 5 
1967 : 85 09 __ STA WORK + 6 
1969 : 85 0a __ STA WORK + 7 
196b : a5 05 __ LDA WORK + 2 
196d : 05 06 __ ORA WORK + 3 
196f : d0 78 __ BNE $19e9 ; (divmod32 + 140)
1971 : a5 04 __ LDA WORK + 1 
1973 : d0 27 __ BNE $199c ; (divmod32 + 63)
1975 : 18 __ __ CLC
1976 : 26 27 __ ROL ACCU + 0 
1978 : 26 28 __ ROL ACCU + 1 
197a : 26 29 __ ROL ACCU + 2 
197c : 26 2a __ ROL ACCU + 3 
197e : 2a __ __ ROL
197f : 90 05 __ BCC $1986 ; (divmod32 + 41)
1981 : e5 03 __ SBC WORK + 0 
1983 : 38 __ __ SEC
1984 : b0 06 __ BCS $198c ; (divmod32 + 47)
1986 : c5 03 __ CMP WORK + 0 
1988 : 90 02 __ BCC $198c ; (divmod32 + 47)
198a : e5 03 __ SBC WORK + 0 
198c : 88 __ __ DEY
198d : d0 e7 __ BNE $1976 ; (divmod32 + 25)
198f : 85 07 __ STA WORK + 4 
1991 : 26 27 __ ROL ACCU + 0 
1993 : 26 28 __ ROL ACCU + 1 
1995 : 26 29 __ ROL ACCU + 2 
1997 : 26 2a __ ROL ACCU + 3 
1999 : a4 02 __ LDY $02 
199b : 60 __ __ RTS
199c : a5 2a __ LDA ACCU + 3 
199e : d0 10 __ BNE $19b0 ; (divmod32 + 83)
19a0 : a6 29 __ LDX ACCU + 2 
19a2 : 86 2a __ STX ACCU + 3 
19a4 : a6 28 __ LDX ACCU + 1 
19a6 : 86 29 __ STX ACCU + 2 
19a8 : a6 27 __ LDX ACCU + 0 
19aa : 86 28 __ STX ACCU + 1 
19ac : 85 27 __ STA ACCU + 0 
19ae : a0 18 __ LDY #$18
19b0 : 18 __ __ CLC
19b1 : 26 27 __ ROL ACCU + 0 
19b3 : 26 28 __ ROL ACCU + 1 
19b5 : 26 29 __ ROL ACCU + 2 
19b7 : 26 2a __ ROL ACCU + 3 
19b9 : 26 07 __ ROL WORK + 4 
19bb : 26 08 __ ROL WORK + 5 
19bd : 90 0c __ BCC $19cb ; (divmod32 + 110)
19bf : a5 07 __ LDA WORK + 4 
19c1 : e5 03 __ SBC WORK + 0 
19c3 : aa __ __ TAX
19c4 : a5 08 __ LDA WORK + 5 
19c6 : e5 04 __ SBC WORK + 1 
19c8 : 38 __ __ SEC
19c9 : b0 0c __ BCS $19d7 ; (divmod32 + 122)
19cb : 38 __ __ SEC
19cc : a5 07 __ LDA WORK + 4 
19ce : e5 03 __ SBC WORK + 0 
19d0 : aa __ __ TAX
19d1 : a5 08 __ LDA WORK + 5 
19d3 : e5 04 __ SBC WORK + 1 
19d5 : 90 04 __ BCC $19db ; (divmod32 + 126)
19d7 : 86 07 __ STX WORK + 4 
19d9 : 85 08 __ STA WORK + 5 
19db : 88 __ __ DEY
19dc : d0 d3 __ BNE $19b1 ; (divmod32 + 84)
19de : 26 27 __ ROL ACCU + 0 
19e0 : 26 28 __ ROL ACCU + 1 
19e2 : 26 29 __ ROL ACCU + 2 
19e4 : 26 2a __ ROL ACCU + 3 
19e6 : a4 02 __ LDY $02 
19e8 : 60 __ __ RTS
19e9 : a0 10 __ LDY #$10
19eb : a5 2a __ LDA ACCU + 3 
19ed : 85 08 __ STA WORK + 5 
19ef : a5 29 __ LDA ACCU + 2 
19f1 : 85 07 __ STA WORK + 4 
19f3 : a9 00 __ LDA #$00
19f5 : 85 29 __ STA ACCU + 2 
19f7 : 85 2a __ STA ACCU + 3 
19f9 : 18 __ __ CLC
19fa : 26 27 __ ROL ACCU + 0 
19fc : 26 28 __ ROL ACCU + 1 
19fe : 26 07 __ ROL WORK + 4 
1a00 : 26 08 __ ROL WORK + 5 
1a02 : 26 09 __ ROL WORK + 6 
1a04 : 26 0a __ ROL WORK + 7 
1a06 : a5 07 __ LDA WORK + 4 
1a08 : c5 03 __ CMP WORK + 0 
1a0a : a5 08 __ LDA WORK + 5 
1a0c : e5 04 __ SBC WORK + 1 
1a0e : a5 09 __ LDA WORK + 6 
1a10 : e5 05 __ SBC WORK + 2 
1a12 : a5 0a __ LDA WORK + 7 
1a14 : e5 06 __ SBC WORK + 3 
1a16 : 90 18 __ BCC $1a30 ; (divmod32 + 211)
1a18 : a5 07 __ LDA WORK + 4 
1a1a : e5 03 __ SBC WORK + 0 
1a1c : 85 07 __ STA WORK + 4 
1a1e : a5 08 __ LDA WORK + 5 
1a20 : e5 04 __ SBC WORK + 1 
1a22 : 85 08 __ STA WORK + 5 
1a24 : a5 09 __ LDA WORK + 6 
1a26 : e5 05 __ SBC WORK + 2 
1a28 : 85 09 __ STA WORK + 6 
1a2a : a5 0a __ LDA WORK + 7 
1a2c : e5 06 __ SBC WORK + 3 
1a2e : 85 0a __ STA WORK + 7 
1a30 : 88 __ __ DEY
1a31 : d0 c7 __ BNE $19fa ; (divmod32 + 157)
1a33 : 26 27 __ ROL ACCU + 0 
1a35 : 26 28 __ ROL ACCU + 1 
1a37 : a4 02 __ LDY $02 
1a39 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1a3a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
tm:
1a3b : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
tile:
1a3d : __ __ __ BYT 51 52 53 54                                     : QRST
--------------------------------------------------------------------
giocharmap:
1a41 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1a42 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1a52 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
