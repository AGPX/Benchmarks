	.text
	.zeropage	__rc0
	.zeropage	__rc1
	.zeropage	__rc2
	.zeropage	__rc3
	.zeropage	__rc4
	.zeropage	__rc5
	.zeropage	__rc6
	.zeropage	__rc7
	.zeropage	__rc8
	.zeropage	__rc9
	.zeropage	__rc10
	.zeropage	__rc11
	.zeropage	__rc12
	.zeropage	__rc13
	.zeropage	__rc14
	.zeropage	__rc15
	.zeropage	__rc16
	.zeropage	__rc17
	.zeropage	__rc18
	.zeropage	__rc19
	.zeropage	__rc20
	.zeropage	__rc21
	.zeropage	__rc22
	.zeropage	__rc23
	.zeropage	__rc24
	.zeropage	__rc25
	.zeropage	__rc26
	.zeropage	__rc27
	.zeropage	__rc28
	.zeropage	__rc29
	.zeropage	__rc30
	.zeropage	__rc31
	.file	"ld-temp.o"
                                        ; Start of file scope inline assembly
	.section	.init.250,"axR",@progbits
shift:
	lda	#14
	jsr	__CHROUT

                                        ; End of file scope inline assembly
	.section	.text._Z4drawh,"ax",@progbits
	.type	_Z4drawh,@function              ; -- Begin function _Z4drawh
_Z4drawh:                               ; @_Z4drawh
; %bb.0:
	ldx	#42
	stx	__rc2
	ldx	#4
	stx	__rc3
	ldx	#2
	stx	__rc4
	ldx	#4
	stx	__rc5
	ldx	#40
	stx	__rc6
	ldx	#4
	stx	__rc7
	ldy	#0
	ldx	#0
	stx	__rc8
	ldx	#4
	stx	__rc9
.LBB0_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
                                        ;       Child Loop BB0_3 Depth 3
                                        ;         Child Loop BB0_6 Depth 4
	sty	__rc18
	ldx	__rc6
	stx	__rc12
	ldx	__rc7
	stx	__rc13
	ldx	#0
	ldy	__rc8
	sty	__rc10
	ldy	__rc9
	sty	__rc11
.LBB0_2:                                ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_3 Depth 3
                                        ;         Child Loop BB0_6 Depth 4
	stx	__rc19
	bit	__set_v
	ldx	#0
	stx	mos8(.L_Z4drawh_zp_stk+1)       ; 1-byte Folded Spill
	stx	mos8(.L_Z4drawh_zp_stk)         ; 1-byte Folded Spill
.LBB0_3:                                ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_2 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_6 Depth 4
	ldx	#1
	bvs	.LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=3
	ldx	#0
.LBB0_5:                                ;   in Loop: Header=BB0_3 Depth=3
	stx	__rc14
	ldy	#0
	ldx	mos8(.L_Z4drawh_zp_stk)         ; 1-byte Folded Reload
.LBB0_6:                                ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_2 Depth=2
                                        ;       Parent Loop BB0_3 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	stx	__rc15
	inc	__rc15
	lda	mos8(_ZL4tile),x
	sta	(__rc10),y
	lda	mos8(.L_Z4drawh_zp_stk)         ; 1-byte Folded Reload
	eor	__rc15
	and	#3
	ldy	#1
	ldx	__rc15
	cmp	#2
	bne	.LBB0_6
; %bb.7:                                ;   in Loop: Header=BB0_3 Depth=3
	ldy	mos8(.L_Z4drawh_zp_stk+1)       ; 1-byte Folded Reload
	tya
	clc
	adc	__rc12
	sta	__rc10
	lda	__rc13
	adc	#0
	sta	__rc11
	clc
	tya
	adc	#40
	sta	mos8(.L_Z4drawh_zp_stk+1)       ; 1-byte Folded Spill
	clv
	ldx	__rc15
	stx	mos8(.L_Z4drawh_zp_stk)         ; 1-byte Folded Spill
	lda	__rc14
	bne	.LBB0_3
; %bb.8:                                ;   in Loop: Header=BB0_2 Depth=2
	lda	__rc4
	ldx	__rc19
	stx	__rc12
	clc
	adc	__rc12
	sta	__rc10
	lda	__rc5
	adc	#0
	sta	__rc11
	lda	__rc19
	clc
	adc	#2
	sta	__rc14
	lda	__rc2
	clc
	adc	__rc12
	sta	__rc12
	lda	__rc3
	adc	#0
	sta	__rc13
	cpx	#38
	ldx	__rc14
	bcs	.LBB0_9
	jmp	.LBB0_2
.LBB0_9:                                ;   in Loop: Header=BB0_1 Depth=1
	lda	__rc8
	clc
	adc	#80
	sta	__rc8
	lda	__rc9
	adc	#0
	sta	__rc9
	ldx	__rc18
	lda	__rc18
	clc
	adc	#2
	tay
	lda	__rc6
	clc
	adc	#80
	sta	__rc6
	lda	__rc7
	adc	#0
	sta	__rc7
	lda	__rc4
	clc
	adc	#80
	sta	__rc4
	lda	__rc5
	adc	#0
	sta	__rc5
	lda	__rc2
	clc
	adc	#80
	sta	__rc2
	lda	__rc3
	adc	#0
	sta	__rc3
	cpx	#23
	bcs	.LBB0_10
	jmp	.LBB0_1
.LBB0_10:
	rts
.Lfunc_end0:
	.size	_Z4drawh, .Lfunc_end0-_Z4drawh
                                        ; -- End function
	.section	.text._Z5timerv,"ax",@progbits
	.type	_Z5timerv,@function             ; -- Begin function _Z5timerv
_Z5timerv:                              ; @_Z5timerv
; %bb.0:
	ldx	tm
	ldy	tm+1
	inx
	bne	.LBB1_2
; %bb.1:
	iny
.LBB1_2:
	stx	tm
	sty	tm+1
	;APP
	jmp	59953
	;NO_APP
	rts
.Lfunc_end1:
	.size	_Z5timerv, .Lfunc_end1-_Z5timerv
                                        ; -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            ; -- Begin function main
	.type	main,@function
main:                                   ; @main
; %bb.0:
	clc
	lda	__rc0
	adc	#254
	sta	__rc0
	lda	__rc1
	adc	#255
	sta	__rc1
	ldx	#mos16lo(_Z5timerv)
	ldy	#mos16hi(_Z5timerv)
	stx	788
	sty	789
	ldx	#100
.LBB2_1:                                ; =>This Inner Loop Header: Depth=1
	stx	mos8(.Lmain_zp_stk)
	jsr	_Z4drawh
	ldx	mos8(.Lmain_zp_stk)
	dex
	bne	.LBB2_1
; %bb.2:
	;APP
	jsr	58692
	;NO_APP
	lda	tm
	ldx	tm+1
	ldy	#0
	sta	(__rc0),y
	iny
	txa
	sta	(__rc0),y
	jsr	printf
	ldx	#0
	txa
	pha
	clc
	lda	__rc0
	adc	#2
	sta	__rc0
	lda	__rc1
	adc	#0
	sta	__rc1
	pla
	rts
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
                                        ; -- End function
	.section	.text.exit,"ax",@progbits
	.globl	exit                            ; -- Begin function exit
	.type	exit,@function
exit:                                   ; @exit
; %bb.0:
	jsr	_fini
.LBB3_1:                                ; =>This Inner Loop Header: Depth=1
	jmp	.LBB3_1
.Lfunc_end3:
	.size	exit, .Lfunc_end3-exit
                                        ; -- End function
	.section	.text._ZN12_GLOBAL__N_13putEcP6Status,"ax",@progbits
	.type	_ZN12_GLOBAL__N_13putEcP6Status,@function ; -- Begin function _ZN12_GLOBAL__N_13putEcP6Status
_ZN12_GLOBAL__N_13putEcP6Status:        ; @_ZN12_GLOBAL__N_13putEcP6Status
; %bb.0:
	sta	__rc8
	ldx	__rc3
	clc
	lda	__rc2
	adc	#5
	tay
	lda	__rc3
	stx	__rc5
	adc	#0
	clc
	sty	__rc6
	ldy	#5
	sta	__rc7
	lda	(__rc2),y
	tax
	lda	__rc2
	adc	#3
	sta	__rc4
	lda	__rc5
	adc	#0
	sta	__rc5
	ldy	#1
	lda	(__rc6),y
	cmp	(__rc4),y
	bne	.LBB4_2
; %bb.1:
	ldy	#3
	sta	__rc7
	lda	(__rc2),y
	sta	__rc4
	stx	__rc6
	cpx	__rc4
	bcc	.LBB4_3
	jmp	.LBB4_7
.LBB4_2:
	stx	__rc6
	cmp	(__rc4),y
	sta	__rc7
	bcc	.LBB4_3
	jmp	.LBB4_7
.LBB4_3:
	lda	__rc2
	clc
	adc	#15
	sta	__rc4
	lda	__rc3
	adc	#0
	sta	__rc5
	ldy	#1
	lda	(__rc4),y
	ldx	#0
	stx	__rc4
	ldx	#0
	stx	__rc5
	cmp	__rc5
	bne	.LBB4_6
; %bb.4:
	ldy	#15
	lda	(__rc2),y
	cmp	__rc4
	bne	.LBB4_6
; %bb.5:
	lda	__rc2
	clc
	adc	#9
	sta	__rc4
	lda	__rc3
	adc	#0
	ldy	#9
	sta	__rc5
	clc
	lda	__rc6
	adc	(__rc2),y
	tax
	ldy	#1
	lda	__rc7
	adc	(__rc4),y
	stx	__rc4
	sta	__rc5
	dey
	lda	__rc8
	sta	(__rc4),y
	jmp	.LBB4_7
.LBB4_6:
	ldx	__rc2
	stx	mos8(.L_ZN12_GLOBAL__N_13putEcP6Status_zp_stk) ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.L_ZN12_GLOBAL__N_13putEcP6Status_zp_stk+1) ; 1-byte Folded Spill
	ldx	#0
	lda	__rc8
	jsr	putchar
	ldx	mos8(.L_ZN12_GLOBAL__N_13putEcP6Status_zp_stk) ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.L_ZN12_GLOBAL__N_13putEcP6Status_zp_stk+1) ; 1-byte Folded Reload
	stx	__rc3
.LBB4_7:
	ldy	#5
	lda	__rc2
	clc
	adc	#5
	sta	__rc4
	lda	__rc3
	adc	#0
	sta	__rc5
	lda	(__rc2),y
	tax
	ldy	#1
	lda	(__rc4),y
	inx
	bne	.LBB4_9
; %bb.8:
	clc
	adc	#1
.LBB4_9:
	sta	__rc6
	txa
	ldy	#5
	sta	(__rc2),y
	ldy	#1
	lda	__rc6
	sta	(__rc4),y
	rts
.Lfunc_end4:
	.size	_ZN12_GLOBAL__N_13putEcP6Status, .Lfunc_end4-_ZN12_GLOBAL__N_13putEcP6Status
                                        ; -- End function
	.section	.text._ZN12_GLOBAL__N_112print_stringEPKcP6Status,"ax",@progbits
	.type	_ZN12_GLOBAL__N_112print_stringEPKcP6Status,@function ; -- Begin function _ZN12_GLOBAL__N_112print_stringEPKcP6Status
_ZN12_GLOBAL__N_112print_stringEPKcP6Status: ; @_ZN12_GLOBAL__N_112print_stringEPKcP6Status
; %bb.0:
	ldx	__rc2
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk)
	ldx	__rc3
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+1)
	ldx	__rc4
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)
	ldx	__rc5
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+3)
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)
	clc
	adc	#13
	sta	__rc2
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+3)
	adc	#0
	sta	__rc3
	ldy	#1
	lda	(__rc2),y
	bmi	.LBB5_4
; %bb.1:
	ldy	#13
	sta	__rc2
	lda	(mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)),y
	ldx	__rc2
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+6) ; 1-byte Folded Spill
	bne	.LBB5_5
; %bb.2:
	tax
	bne	.LBB5_5
; %bb.3:
	ldx	#0
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+7) ; 1-byte Folded Spill
	jmp	.LBB5_30
.LBB5_4:
	lda	#255
	tax
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+6) ; 1-byte Folded Spill
.LBB5_5:
	sta	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+7) ; 1-byte Folded Spill
	ldy	#0
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk)
	stx	__rc6
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+1)
	stx	__rc7
	sty	__rc2
	sty	__rc3
.LBB5_6:                                ; =>This Inner Loop Header: Depth=1
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk)
	clc
	adc	__rc2
	sta	__rc4
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+1)
	adc	__rc3
	sta	__rc5
	lda	(__rc4),y
	bne	.LBB5_7
	jmp	.LBB5_29
.LBB5_7:                                ;   in Loop: Header=BB5_6 Depth=1
	inc	__rc2
	bne	.LBB5_9
; %bb.8:                                ;   in Loop: Header=BB5_6 Depth=1
	inc	__rc3
.LBB5_9:                                ;   in Loop: Header=BB5_6 Depth=1
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+6) ; 1-byte Folded Reload
	cpx	__rc3
	bne	.LBB5_6
; %bb.10:                               ;   in Loop: Header=BB5_6 Depth=1
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+7) ; 1-byte Folded Reload
	cpx	__rc2
	bne	.LBB5_6
.LBB5_11:
	ldy	#1
	lda	(mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)),y
	and	#1
	beq	.LBB5_12
	jmp	.LBB5_20
.LBB5_12:
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)
	clc
	adc	#11
	sta	__rc4
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+3)
	adc	#0
	sta	__rc5
	ldy	#11
	lda	(mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)),y
	sta	__rc3
	ldy	#1
	lda	(__rc4),y
	sta	__rc2
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+6) ; 1-byte Folded Reload
	cpx	__rc2
	bne	.LBB5_14
; %bb.13:
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+7) ; 1-byte Folded Reload
	cpx	__rc3
	bcc	.LBB5_15
	jmp	.LBB5_20
.LBB5_14:
	cpx	__rc2
	bcs	.LBB5_20
.LBB5_15:
	sec
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+7) ; 1-byte Folded Reload
	txa
	sbc	__rc3
	tay
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+6) ; 1-byte Folded Reload
	sbc	__rc2
	sta	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+5)
.LBB5_16:                               ; =>This Inner Loop Header: Depth=1
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)
	stx	__rc2
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+3)
	stx	__rc3
	sty	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+4)
	lda	#32
	jsr	_ZN12_GLOBAL__N_13putEcP6Status
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+5)
	inc	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+4)
	bne	.LBB5_18
; %bb.17:                               ;   in Loop: Header=BB5_16 Depth=1
	inx
.LBB5_18:                               ;   in Loop: Header=BB5_16 Depth=1
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+5)
	ldy	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+4)
	txa
	bne	.LBB5_16
; %bb.19:                               ;   in Loop: Header=BB5_16 Depth=1
	lda	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+4)
	bne	.LBB5_16
.LBB5_20:
	ldy	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+7) ; 1-byte Folded Reload
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+6) ; 1-byte Folded Reload
	stx	__rc2
	lda	__rc2
	bne	.LBB5_22
; %bb.21:
	tya
	beq	.LBB5_28
.LBB5_22:                               ; =>This Inner Loop Header: Depth=1
	dey
	cpy	#255
	bne	.LBB5_24
; %bb.23:                               ;   in Loop: Header=BB5_22 Depth=1
	dec	__rc2
.LBB5_24:                               ;   in Loop: Header=BB5_22 Depth=1
	sty	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+4)
	ldx	__rc2
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+5)
	ldy	#0
	lda	(mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk)),y
	inc	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk)
	bne	.LBB5_26
; %bb.25:                               ;   in Loop: Header=BB5_22 Depth=1
	inc	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+1)
.LBB5_26:                               ;   in Loop: Header=BB5_22 Depth=1
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+2)
	stx	__rc2
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+3)
	stx	__rc3
	jsr	_ZN12_GLOBAL__N_13putEcP6Status
	ldx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+5)
	stx	__rc2
	ldy	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+4)
	lda	__rc2
	bne	.LBB5_22
; %bb.27:                               ;   in Loop: Header=BB5_22 Depth=1
	tya
	bne	.LBB5_22
.LBB5_28:
	rts
.LBB5_29:
	ldx	__rc2
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+7) ; 1-byte Folded Spill
	ldx	__rc3
.LBB5_30:
	stx	mos8(.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk+6) ; 1-byte Folded Spill
	jmp	.LBB5_11
.Lfunc_end5:
	.size	_ZN12_GLOBAL__N_112print_stringEPKcP6Status, .Lfunc_end5-_ZN12_GLOBAL__N_112print_stringEPKcP6Status
                                        ; -- End function
	.section	.text.printf,"ax",@progbits
	.type	printf,@function                ; -- Begin function printf
printf:                                 ; @printf
; %bb.0:
	clc
	ldx	__rc0
	ldy	__rc1
	stx	mos8(.Lprintf_zp_stk+67)
	sty	mos8(.Lprintf_zp_stk+68)
	ldx	mos8(.Lprintf_zp_stk+67)
	ldy	mos8(.Lprintf_zp_stk+68)
	stx	mos8(.Lprintf_zp_stk+46)
	sty	mos8(.Lprintf_zp_stk+47)
	ldx	#255
	stx	mos8(.Lprintf_zp_stk+51)
	stx	mos8(.Lprintf_zp_stk+52)
	lda	#0
	sta	mos8(.Lprintf_zp_stk+53)
	sta	mos8(.Lprintf_zp_stk+54)
	tax
	stx	mos8(.Lprintf_zp_stk+2)
	tax
	stx	mos8(.Lprintf_zp_stk+3)
	ldx	mos8(.Lprintf_zp_stk+2)
	ldy	mos8(.Lprintf_zp_stk+3)
	stx	mos8(.Lprintf_zp_stk+57)
	sty	mos8(.Lprintf_zp_stk+58)
	ldx	#2
	stx	mos8(.Lprintf_zp_stk+63)
	sta	mos8(.Lprintf_zp_stk+64)
	ldx	mos8(.Lprintf_zp_stk+46)
	ldy	mos8(.Lprintf_zp_stk+47)
	stx	mos8(.Lprintf_zp_stk+65)
	sty	mos8(.Lprintf_zp_stk+66)
	ldx	#mos8(.Lprintf_zp_stk+37)
	ldy	#mos8(0)
	stx	__rc2
	sty	__rc3
	lda	#mos8(.Lprintf_zp_stk+12)
	clc
	adc	#2
	sta	mos8(.Lprintf_zp_stk+79)        ; 1-byte Folded Spill
	lda	#mos8(0)
	adc	#0
	sta	mos8(.Lprintf_zp_stk+80)        ; 1-byte Folded Spill
	inc	__rc2
	bne	.LBB6_2
; %bb.1:
	inc	__rc3
.LBB6_2:
	ldx	__rc2
	stx	mos8(.Lprintf_zp_stk+73)        ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lprintf_zp_stk+74)        ; 1-byte Folded Spill
	ldx	#mos16lo(.L.str)
	stx	mos8(.Lprintf_zp_stk+6)
	ldx	#mos16hi(.L.str)
	stx	mos8(.Lprintf_zp_stk+7)
.LBB6_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_25 Depth 2
                                        ;     Child Loop BB6_34 Depth 2
                                        ;     Child Loop BB6_53 Depth 2
                                        ;     Child Loop BB6_105 Depth 2
                                        ;     Child Loop BB6_132 Depth 2
                                        ;       Child Loop BB6_114 Depth 3
                                        ;       Child Loop BB6_124 Depth 3
                                        ;       Child Loop BB6_130 Depth 3
                                        ;     Child Loop BB6_176 Depth 2
                                        ;     Child Loop BB6_219 Depth 2
                                        ;     Child Loop BB6_226 Depth 2
                                        ;     Child Loop BB6_260 Depth 2
                                        ;     Child Loop BB6_295 Depth 2
	ldx	mos8(.Lprintf_zp_stk+6)
	stx	mos8(.Lprintf_zp_stk+4)
	ldx	mos8(.Lprintf_zp_stk+7)
	stx	mos8(.Lprintf_zp_stk+5)
	ldy	#0
	lda	(mos8(.Lprintf_zp_stk+6)),y
	cmp	#37
	beq	.LBB6_10
; %bb.4:                                ;   in Loop: Header=BB6_3 Depth=1
	tax
	bne	.LBB6_5
	jmp	.LBB6_321
.LBB6_5:                                ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	jsr	putchar
	inc	mos8(.Lprintf_zp_stk+4)
	bne	.LBB6_7
; %bb.6:                                ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+5)
.LBB6_7:                                ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+53)
	bne	.LBB6_9
; %bb.8:                                ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+54)
.LBB6_9:                                ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+4)
	stx	mos8(.Lprintf_zp_stk+6)
	ldx	mos8(.Lprintf_zp_stk+5)
	stx	mos8(.Lprintf_zp_stk+7)
	jmp	.LBB6_3
.LBB6_10:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+6)
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+7)
	stx	__rc3
	inc	__rc2
	bne	.LBB6_12
; %bb.11:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	__rc3
.LBB6_12:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	#1
	lda	(mos8(.Lprintf_zp_stk+4)),y
	cmp	#37
	bne	.LBB6_15
; %bb.13:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	mos8(.Lprintf_zp_stk+53)
	lda	mos8(.Lprintf_zp_stk+54)
	cmp	mos8(.Lprintf_zp_stk+52)
	beq	.LBB6_14
	jmp	.LBB6_37
.LBB6_14:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	cpy	__rc2
	bcs	.LBB6_322
	jmp	.LBB6_38
.LBB6_322:                              ;   in Loop: Header=BB6_3 Depth=1
	jmp	.LBB6_42
.LBB6_15:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+49)
	stx	mos8(.Lprintf_zp_stk+50)
	stx	mos8(.Lprintf_zp_stk+48)
	stx	mos8(.Lprintf_zp_stk+59)
	stx	mos8(.Lprintf_zp_stk+60)
	dex
	stx	mos8(.Lprintf_zp_stk+61)
	stx	mos8(.Lprintf_zp_stk+62)
	inx
	stx	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Spill
	ldy	#0
	jmp	.LBB6_25
.LBB6_16:                               ;   in Loop: Header=BB6_25 Depth=2
	ldx	#2
	jmp	.LBB6_21
.LBB6_17:                               ;   in Loop: Header=BB6_25 Depth=2
	ldx	__rc5
	cpx	#32
	beq	.LBB6_22
; %bb.18:                               ;   in Loop: Header=BB6_25 Depth=2
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	cpx	#35
	beq	.LBB6_19
	jmp	.LBB6_32
.LBB6_19:                               ;   in Loop: Header=BB6_25 Depth=2
	ldx	#4
	jmp	.LBB6_21
.LBB6_20:                               ;   in Loop: Header=BB6_25 Depth=2
	ldx	#16
.LBB6_21:                               ;   in Loop: Header=BB6_25 Depth=2
	stx	__rc4
	jmp	.LBB6_23
.LBB6_22:                               ;   in Loop: Header=BB6_25 Depth=2
	ldx	#8
	stx	__rc4
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
.LBB6_23:                               ;   in Loop: Header=BB6_25 Depth=2
	ora	__rc4
	sta	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+49)
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+50)
	inc	__rc2
	bne	.LBB6_25
; %bb.24:                               ;   in Loop: Header=BB6_25 Depth=2
	inc	__rc3
.LBB6_25:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(__rc2),y
	sec
	sta	__rc5
	sbc	#42
	cmp	#7
	bcs	.LBB6_17
; %bb.26:                               ;   in Loop: Header=BB6_25 Depth=2
	tax
	ldy	.LJTI6_0,x
	lda	.LJTI6_0+7,x
	tax
	sty	__rc6
	ldy	#0
	stx	__rc7
	ldx	#1
	stx	__rc4
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	jmp	(__rc6)
.LBB6_27:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+65)
	ldx	mos8(.Lprintf_zp_stk+66)
	sta	__rc6
	stx	__rc7
	clc
	adc	#2
	sta	__rc4
	txa
	adc	#0
	ldx	__rc4
	stx	mos8(.Lprintf_zp_stk+65)
	sta	mos8(.Lprintf_zp_stk+66)
	lda	(__rc6),y
	sta	__rc5
	ldy	#1
	lda	(__rc6),y
	sta	__rc4
	bpl	.LBB6_29
; %bb.28:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	ora	#1
	sta	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+49)
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+50)
	sec
	txa
	sbc	__rc5
	sta	__rc5
	txa
	sbc	__rc4
.LBB6_29:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc5
	stx	mos8(.Lprintf_zp_stk+59)
	sta	mos8(.Lprintf_zp_stk+60)
	inc	__rc2
	bne	.LBB6_31
; %bb.30:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	__rc3
.LBB6_31:                               ;   in Loop: Header=BB6_3 Depth=1
	stx	mos8(.Lprintf_zp_stk+10)
	sta	mos8(.Lprintf_zp_stk+8)
	jmp	.LBB6_47
.LBB6_32:                               ;   in Loop: Header=BB6_3 Depth=1
	clc
	lda	__rc5
	adc	#208
	cmp	#10
	bcc	.LBB6_33
	jmp	.LBB6_45
.LBB6_33:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc5
	stx	__rc4
	sty	__rc5
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
.LBB6_34:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldy	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sty	__rc6
	asl	__rc6
	stx	__rc7
	rol	__rc7
	lda	__rc6
	asl
	ldx	__rc7
	stx	__rc8
	rol	__rc8
	asl
	rol	__rc8
	clc
	adc	__rc6
	tax
	lda	__rc8
	adc	__rc7
	sta	__rc6
	txa
	clc
	adc	__rc4
	sta	__rc7
	lda	__rc6
	adc	__rc5
	sta	__rc4
	clc
	lda	__rc7
	adc	#208
	sta	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	lda	__rc4
	adc	#255
	tax
	ldy	#1
	lda	(__rc2),y
	sta	__rc4
	clc
	adc	#208
	inc	__rc2
	bne	.LBB6_36
; %bb.35:                               ;   in Loop: Header=BB6_34 Depth=2
	inc	__rc3
.LBB6_36:                               ;   in Loop: Header=BB6_34 Depth=2
	cmp	#10
	ldy	#0
	sty	__rc5
	bcs	.LBB6_46
	jmp	.LBB6_34
.LBB6_37:                               ;   in Loop: Header=BB6_3 Depth=1
	cmp	mos8(.Lprintf_zp_stk+52)
	bcs	.LBB6_42
.LBB6_38:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_41
; %bb.39:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_41
; %bb.40:                               ;   in Loop: Header=BB6_3 Depth=1
	clc
	tax
	tya
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	txa
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	lda	#37
	ldy	#0
	sta	(__rc2),y
	jmp	.LBB6_42
.LBB6_41:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	#37
	jsr	__CHROUT
.LBB6_42:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+53)
	bne	.LBB6_44
; %bb.43:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+54)
.LBB6_44:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+4)
	clc
	adc	#2
	sta	mos8(.Lprintf_zp_stk+6)
	lda	mos8(.Lprintf_zp_stk+5)
	adc	#0
	sta	mos8(.Lprintf_zp_stk+7)
	jmp	.LBB6_3
.LBB6_45:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
.LBB6_46:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sty	mos8(.Lprintf_zp_stk+59)
	stx	mos8(.Lprintf_zp_stk+60)
	sty	mos8(.Lprintf_zp_stk+10)
	stx	mos8(.Lprintf_zp_stk+8)
.LBB6_47:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	#0
	lda	(__rc2),y
	ldx	#255
	cmp	#46
	bne	.LBB6_50
; %bb.48:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	#1
	lda	(__rc2),y
	cmp	#42
	bne	.LBB6_51
; %bb.49:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+65)
	ldx	mos8(.Lprintf_zp_stk+66)
	sta	__rc4
	stx	__rc5
	clc
	adc	#2
	tay
	txa
	adc	#0
	sty	mos8(.Lprintf_zp_stk+65)
	sta	mos8(.Lprintf_zp_stk+66)
	lda	__rc2
	clc
	adc	#2
	sta	__rc2
	lda	__rc3
	adc	#0
	sta	__rc3
	ldy	#0
	lda	(__rc4),y
	sta	__rc6
	iny
	lda	(__rc4),y
	dey
	ldx	__rc6
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	stx	mos8(.Lprintf_zp_stk+61)
	sta	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+62)
	jmp	.LBB6_62
.LBB6_50:                               ;   in Loop: Header=BB6_3 Depth=1
	stx	__rc4
	jmp	.LBB6_63
.LBB6_51:                               ;   in Loop: Header=BB6_3 Depth=1
	sta	__rc7
	clc
	adc	#208
	cmp	#10
	bcc	.LBB6_52
	jmp	.LBB6_59
.LBB6_52:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	#0
	tax
	sta	__rc8
	tay
	sty	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	sty	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	iny
	sty	__rc11
	stx	__rc6
.LBB6_53:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldy	__rc6
	sty	__rc4
	ldy	__rc11
	sty	__rc5
	ldy	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sty	__rc9
	asl	__rc9
	ldy	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	sty	__rc10
	rol	__rc10
	lda	__rc9
	asl
	tay
	lda	__rc10
	rol
	sty	__rc12
	asl	__rc12
	rol
	tay
	lda	__rc12
	clc
	adc	__rc9
	sta	__rc9
	tya
	adc	__rc10
	sta	__rc10
	lda	__rc9
	clc
	adc	__rc7
	sta	__rc7
	lda	__rc10
	adc	__rc8
	sta	__rc8
	clc
	lda	__rc7
	adc	#208
	tay
	lda	__rc8
	sty	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	adc	#255
	sta	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	inc	__rc11
	bne	.LBB6_55
; %bb.54:                               ;   in Loop: Header=BB6_53 Depth=2
	inc	__rc6
.LBB6_55:                               ;   in Loop: Header=BB6_53 Depth=2
	lda	__rc2
	clc
	adc	__rc5
	sta	__rc8
	lda	__rc3
	adc	__rc4
	sta	__rc9
	ldy	#1
	lda	(__rc8),y
	sta	__rc7
	clc
	adc	#208
	cmp	#10
	stx	__rc8
	bcs	.LBB6_56
	jmp	.LBB6_53
.LBB6_56:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	__rc2
	clc
	adc	__rc5
	sta	__rc2
	lda	__rc3
	adc	__rc4
	sta	__rc3
	inc	__rc2
	bne	.LBB6_58
; %bb.57:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	__rc3
.LBB6_58:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	stx	mos8(.Lprintf_zp_stk+61)
	ldx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	stx	mos8(.Lprintf_zp_stk+62)
	ldy	#0
	jmp	.LBB6_62
.LBB6_59:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	__rc2
	bne	.LBB6_61
; %bb.60:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	__rc3
.LBB6_61:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+61)
	ldy	#0
	sty	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	stx	mos8(.Lprintf_zp_stk+62)
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
.LBB6_62:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	and	#239
	sta	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+49)
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+50)
	lda	(__rc2),y
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	stx	__rc4
	ldx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
.LBB6_63:                               ;   in Loop: Header=BB6_3 Depth=1
	stx	mos8(.Lprintf_zp_stk+9)
	ldy	#1
	ldx	__rc2
	stx	mos8(.Lprintf_zp_stk+6)
	ldx	__rc3
	stx	mos8(.Lprintf_zp_stk+7)
	inc	mos8(.Lprintf_zp_stk+6)
	bne	.LBB6_65
; %bb.64:                               ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+7)
.LBB6_65:                               ;   in Loop: Header=BB6_3 Depth=1
	sec
	tax
	sbc	#108
	bvc	.LBB6_67
; %bb.66:                               ;   in Loop: Header=BB6_3 Depth=1
	eor	#128
.LBB6_67:                               ;   in Loop: Header=BB6_3 Depth=1
	cmp	#0
	bpl	.LBB6_72
; %bb.68:                               ;   in Loop: Header=BB6_3 Depth=1
	cpx	#76
	beq	.LBB6_78
; %bb.69:                               ;   in Loop: Header=BB6_3 Depth=1
	txa
	cpx	#104
	bne	.LBB6_70
	jmp	.LBB6_82
.LBB6_70:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	#8
	ldy	#0
	cmp	#106
	bne	.LBB6_76
; %bb.71:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+6)
	sta	__rc2
	lda	mos8(.Lprintf_zp_stk+7)
	sta	__rc3
	lda	#8
	jmp	.LBB6_77
.LBB6_72:                               ;   in Loop: Header=BB6_3 Depth=1
	cpx	#108
	beq	.LBB6_79
; %bb.73:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	#0
	cpx	#116
	beq	.LBB6_75
; %bb.74:                               ;   in Loop: Header=BB6_3 Depth=1
	cpx	#122
	bne	.LBB6_76
.LBB6_75:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+6)
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+7)
	stx	__rc3
.LBB6_76:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	#2
	txa
.LBB6_77:                               ;   in Loop: Header=BB6_3 Depth=1
	sta	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	jmp	.LBB6_85
.LBB6_78:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	ora	#64
	sta	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+49)
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+50)
	ldx	mos8(.Lprintf_zp_stk+6)
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+7)
	stx	__rc3
	ldx	#2
	ldy	#2
	jmp	.LBB6_81
.LBB6_79:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	(__rc2),y
	ldx	#4
	cmp	#108
	beq	.LBB6_80
	jmp	.LBB6_310
.LBB6_80:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	__rc2
	clc
	adc	#2
	sta	__rc2
	lda	__rc3
	adc	#0
	sta	__rc3
	ldx	#8
	ldy	#8
.LBB6_81:                               ;   in Loop: Header=BB6_3 Depth=1
	sty	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	jmp	.LBB6_84
.LBB6_82:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	(__rc2),y
	ldx	#2
	cmp	#104
	beq	.LBB6_83
	jmp	.LBB6_311
.LBB6_83:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	__rc2
	clc
	adc	#2
	sta	__rc2
	lda	__rc3
	adc	#0
	sta	__rc3
	ldx	#1
	stx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	inx
.LBB6_84:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	#0
.LBB6_85:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	(__rc2),y
	ldy	__rc2
	sty	mos8(.Lprintf_zp_stk+6)
	ldy	__rc3
	sty	mos8(.Lprintf_zp_stk+7)
.LBB6_86:                               ;   in Loop: Header=BB6_3 Depth=1
	stx	mos8(.Lprintf_zp_stk)
	tay
	sec
	sbc	#99
	cmp	#22
	bcs	.LBB6_89
; %bb.87:                               ;   in Loop: Header=BB6_3 Depth=1
	tax
	ldy	.LJTI6_1,x
	lda	.LJTI6_1+22,x
	tax
	sty	__rc2
	stx	__rc3
	ldy	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	jmp	(__rc2)
.LBB6_88:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc4
	stx	mos8(.Lprintf_zp_stk+2)
	ldy	#10
	ldx	#10
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	sty	mos8(.Lprintf_zp_stk+48)
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	jmp	.LBB6_102
.LBB6_89:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	cpy	#88
	beq	.LBB6_90
	jmp	.LBB6_309
.LBB6_90:                               ;   in Loop: Header=BB6_3 Depth=1
	ldy	__rc4
	sty	mos8(.Lprintf_zp_stk+2)
	txa
	tay
	ldx	#16
	stx	mos8(.Lprintf_zp_stk+48)
	lda	#0
	ora	#1
	jmp	.LBB6_94
.LBB6_91:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc4
	stx	mos8(.Lprintf_zp_stk+2)
	ldx	#16
	stx	mos8(.Lprintf_zp_stk+48)
	tya
	ora	#132
	jmp	.LBB6_93
.LBB6_92:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc4
	stx	mos8(.Lprintf_zp_stk+2)
	ldx	#16
	stx	mos8(.Lprintf_zp_stk+48)
	tya
	ora	#128
.LBB6_93:                               ;   in Loop: Header=BB6_3 Depth=1
	tay
	lda	#0
	ora	#1
	sty	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Spill
.LBB6_94:                               ;   in Loop: Header=BB6_3 Depth=1
	sty	mos8(.Lprintf_zp_stk+49)
	sta	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+50)
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	jmp	.LBB6_102
.LBB6_95:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+65)
	ldx	mos8(.Lprintf_zp_stk+66)
	sta	__rc2
	stx	__rc3
	clc
	adc	#2
	tay
	txa
	adc	#0
	sty	mos8(.Lprintf_zp_stk+65)
	sta	mos8(.Lprintf_zp_stk+66)
	ldy	#0
	lda	(__rc2),y
	tax
	iny
	lda	(__rc2),y
	stx	__rc2
	sta	__rc3
	lda	mos8(.Lprintf_zp_stk+53)
	ldx	mos8(.Lprintf_zp_stk+54)
	dey
	sta	(__rc2),y
	iny
	txa
	jmp	.LBB6_304
.LBB6_96:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+65)
	ldx	mos8(.Lprintf_zp_stk+66)
	sta	__rc2
	stx	__rc3
	clc
	adc	#2
	tay
	txa
	adc	#0
	sty	mos8(.Lprintf_zp_stk+65)
	sta	mos8(.Lprintf_zp_stk+66)
	ldy	#0
	lda	(__rc2),y
	tax
	iny
	lda	(__rc2),y
	stx	__rc2
	sta	__rc3
	jmp	.LBB6_99
.LBB6_97:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc4
	stx	mos8(.Lprintf_zp_stk+2)
	lda	#8
	jmp	.LBB6_101
.LBB6_98:                               ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+65)
	ldx	mos8(.Lprintf_zp_stk+66)
	sta	__rc2
	stx	__rc3
	clc
	adc	#2
	tay
	txa
	adc	#0
	sty	mos8(.Lprintf_zp_stk+65)
	sta	mos8(.Lprintf_zp_stk+66)
	ldy	#0
	lda	(__rc2),y
	sta	mos8(.Lprintf_zp_stk+35)
	sty	mos8(.Lprintf_zp_stk+36)
	ldx	#mos8(.Lprintf_zp_stk+35)
	stx	__rc2
	ldx	#mos8(0)
	stx	__rc3
.LBB6_99:                               ;   in Loop: Header=BB6_3 Depth=1
	ldx	#mos8(.Lprintf_zp_stk+48)
	stx	__rc4
	ldx	#mos8(0)
	stx	__rc5
	jsr	_ZN12_GLOBAL__N_112print_stringEPKcP6Status
	jmp	.LBB6_305
.LBB6_100:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc4
	stx	mos8(.Lprintf_zp_stk+2)
	lda	#10
.LBB6_101:                              ;   in Loop: Header=BB6_3 Depth=1
	tax
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+48)
	lda	#0
	ora	#1
	sty	mos8(.Lprintf_zp_stk+49)
	sta	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+50)
.LBB6_102:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	sta	mos8(.Lprintf_zp_stk+37)
	ldy	mos8(.Lprintf_zp_stk+65)
	ldx	mos8(.Lprintf_zp_stk+66)
	stx	mos8(.Lprintf_zp_stk+11)
	sty	__rc4
	sty	mos8(.Lprintf_zp_stk+3)
	stx	__rc5
	ldx	mos8(.Lprintf_zp_stk+73)        ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+74)        ; 1-byte Folded Reload
	stx	__rc3
	ldx	#0
	sta	mos8(.Lprintf_zp_stk+1)
	jsr	memcpy
	clc
	lda	mos8(.Lprintf_zp_stk+3)
	adc	mos8(.Lprintf_zp_stk)
	tax
	lda	mos8(.Lprintf_zp_stk+11)
	adc	#0
	stx	mos8(.Lprintf_zp_stk+65)
	sta	mos8(.Lprintf_zp_stk+66)
	lda	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	and	#1
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Spill
	tax
	beq	.LBB6_103
	jmp	.LBB6_111
.LBB6_103:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	mos8(.Lprintf_zp_stk+1)
	ldx	mos8(.Lprintf_zp_stk+37),y
	lda	mos8(.Lprintf_zp_stk+1)
	ldy	mos8(.Lprintf_zp_stk+8)
	sty	__rc7
	ldy	mos8(.Lprintf_zp_stk+2)
	sty	mos8(.Lprintf_zp_stk+8)
	ldy	#0
	sty	mos8(.Lprintf_zp_stk+2)
	ldy	#0
	sty	mos8(.Lprintf_zp_stk+3)
	cpx	#0
	bmi	.LBB6_104
	jmp	.LBB6_112
.LBB6_104:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	ldy	#0
	stx	__rc2
.LBB6_105:                              ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sec
	lda	#0
	sbc	mos8(.Lprintf_zp_stk+38),y
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	bcs	.LBB6_107
; %bb.106:                              ;   in Loop: Header=BB6_105 Depth=2
	ldx	#1
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
.LBB6_107:                              ;   in Loop: Header=BB6_105 Depth=2
	sec
	sbc	__rc2
	sta	__rc3
	ldx	#0
	stx	__rc2
	bcs	.LBB6_109
; %bb.108:                              ;   in Loop: Header=BB6_105 Depth=2
	ldx	#1
	stx	__rc2
.LBB6_109:                              ;   in Loop: Header=BB6_105 Depth=2
	lda	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	ora	__rc2
	sta	__rc2
	lda	__rc3
	sta	mos8(.Lprintf_zp_stk+38),y
	iny
	sty	__rc3
	ldx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	cpx	__rc3
	bne	.LBB6_105
; %bb.110:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#1
                                        ; kill: def $xlsb killed $xlsb def $x
	stx	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Spill
	lda	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	jmp	.LBB6_112
.LBB6_111:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+1)
	ldx	mos8(.Lprintf_zp_stk+8)
	stx	__rc7
	ldx	mos8(.Lprintf_zp_stk+2)
	stx	mos8(.Lprintf_zp_stk+8)
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+2)
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+3)
.LBB6_112:                              ;   in Loop: Header=BB6_3 Depth=1
	asl
	asl
	asl
	sta	__rc2
	ldx	#0
	ldy	#0
	jmp	.LBB6_132
.LBB6_113:                              ;   in Loop: Header=BB6_114 Depth=3
	sta	mos8(.Lprintf_zp_stk+14),x
	inx
	lda	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sta	__rc3
	cpx	__rc3
	beq	.LBB6_121
.LBB6_114:                              ;   Parent Loop BB6_3 Depth=1
                                        ;     Parent Loop BB6_132 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	mos8(.Lprintf_zp_stk+14),x
	asl
	cpy	#0
	beq	.LBB6_116
; %bb.115:                              ;   in Loop: Header=BB6_114 Depth=3
	ora	#1
.LBB6_116:                              ;   in Loop: Header=BB6_114 Depth=3
	ldy	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	sty	__rc4
	sty	__rc3
	cmp	__rc3
	ldy	#1
	bcs	.LBB6_118
; %bb.117:                              ;   in Loop: Header=BB6_114 Depth=3
	ldy	#0
.LBB6_118:                              ;   in Loop: Header=BB6_114 Depth=3
	bcc	.LBB6_113
; %bb.119:                              ;   in Loop: Header=BB6_114 Depth=3
	sec
	sbc	__rc4
	sta	mos8(.Lprintf_zp_stk+14),x
	inx
	lda	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sta	__rc3
	cpx	__rc3
	bne	.LBB6_114
; %bb.120:                              ;   in Loop: Header=BB6_132 Depth=2
	ldy	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	tya
	tax
	inx
	lda	#1
	sta	mos8(.Lprintf_zp_stk+14),y
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
.LBB6_121:                              ;   in Loop: Header=BB6_132 Depth=2
	ldx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	lda	mos8(.Lprintf_zp_stk+37),x
	tax
	bpl	.LBB6_129
; %bb.122:                              ;   in Loop: Header=BB6_132 Depth=2
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	beq	.LBB6_127
; %bb.123:                              ;   in Loop: Header=BB6_132 Depth=2
	ldx	#0
	ldy	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	sty	__rc4
.LBB6_124:                              ;   Parent Loop BB6_3 Depth=1
                                        ;     Parent Loop BB6_132 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	mos8(.Lprintf_zp_stk+14),x
	clc
	adc	#1
	inc	mos8(.Lprintf_zp_stk+14),x
	cmp	__rc4
	bcc	.LBB6_129
; %bb.125:                              ;   in Loop: Header=BB6_124 Depth=3
	sec
	sbc	__rc4
	sta	mos8(.Lprintf_zp_stk+14),x
	inx
	stx	__rc3
	lda	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	cmp	__rc3
	bne	.LBB6_124
	jmp	.LBB6_128
.LBB6_126:                              ;   in Loop: Header=BB6_132 Depth=2
	ldx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	lda	mos8(.Lprintf_zp_stk+37),x
	tax
	lda	#0
	sta	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	txa
	bpl	.LBB6_129
	jmp	.LBB6_128
.LBB6_127:                              ;   in Loop: Header=BB6_132 Depth=2
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
.LBB6_128:                              ;   in Loop: Header=BB6_132 Depth=2
	ldy	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	tya
	tax
	inx
	lda	#1
	sta	mos8(.Lprintf_zp_stk+14),y
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
.LBB6_129:                              ;   in Loop: Header=BB6_132 Depth=2
	ldx	#1
	ldy	#0
	lda	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	sta	__rc3
	sty	__rc4
.LBB6_130:                              ;   Parent Loop BB6_3 Depth=1
                                        ;     Parent Loop BB6_132 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lda	mos8(.Lprintf_zp_stk+37),x
	asl
	sta	__rc8
	lda	#0
	rol
	tay
	lda	__rc8
	ora	__rc4
	sta	mos8(.Lprintf_zp_stk+37),x
	inx
	dec	__rc3
	sty	__rc4
	bne	.LBB6_130
; %bb.131:                              ;   in Loop: Header=BB6_132 Depth=2
	ldy	__rc5
	iny
	cpy	__rc2
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	bcs	.LBB6_134
.LBB6_132:                              ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_114 Depth 3
                                        ;       Child Loop BB6_124 Depth 3
                                        ;       Child Loop BB6_130 Depth 3
	sty	__rc5
	txa
	beq	.LBB6_126
; %bb.133:                              ;   in Loop: Header=BB6_132 Depth=2
	stx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Spill
	ldy	#0
	ldx	#0
	jmp	.LBB6_114
.LBB6_134:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	ldy	mos8(.Lprintf_zp_stk+9)
	bpl	.LBB6_136
; %bb.135:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#1
	ldy	#0
	stx	mos8(.Lprintf_zp_stk+8)
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sty	mos8(.Lprintf_zp_stk+9)
.LBB6_136:                              ;   in Loop: Header=BB6_3 Depth=1
	and	#4
	ldy	#1
	cmp	#0
	beq	.LBB6_144
; %bb.137:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	cmp	#16
	beq	.LBB6_141
; %bb.138:                              ;   in Loop: Header=BB6_3 Depth=1
	cmp	#8
	bne	.LBB6_144
; %bb.139:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	cpx	mos8(.Lprintf_zp_stk+9)
	beq	.LBB6_140
	jmp	.LBB6_314
.LBB6_140:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	cpx	mos8(.Lprintf_zp_stk+8)
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	bcc	.LBB6_145
	jmp	.LBB6_315
.LBB6_141:                              ;   in Loop: Header=BB6_3 Depth=1
	txa
	beq	.LBB6_144
; %bb.142:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	and	#128
	bne	.LBB6_143
	jmp	.LBB6_318
.LBB6_143:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#120
	jmp	.LBB6_319
.LBB6_144:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
.LBB6_145:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#45
	stx	mos8(.Lprintf_zp_stk+78)        ; 1-byte Folded Spill
	ldx	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Reload
	beq	.LBB6_147
.LBB6_146:                              ;   in Loop: Header=BB6_3 Depth=1
                                        ; implicit-def: $rc2
                                        ; kill: killed $rc2
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+77)        ; 1-byte Folded Spill
	stx	mos8(.Lprintf_zp_stk+76)        ; 1-byte Folded Spill
	sty	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Spill
	jmp	.LBB6_151
.LBB6_147:                              ;   in Loop: Header=BB6_3 Depth=1
	tax
	and	#2
	ldy	#43
	sty	mos8(.Lprintf_zp_stk+78)        ; 1-byte Folded Spill
	tay
	bne	.LBB6_150
; %bb.148:                              ;   in Loop: Header=BB6_3 Depth=1
	txa
	and	#8
	ldy	#1
	tax
	beq	.LBB6_149
	jmp	.LBB6_313
.LBB6_149:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#1
	stx	mos8(.Lprintf_zp_stk+77)        ; 1-byte Folded Spill
	dex
	stx	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Spill
                                        ; implicit-def: $rc2
                                        ; kill: killed $rc2
                                        ; implicit-def: $rc2
                                        ; kill: killed $rc2
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+76)        ; 1-byte Folded Spill
	jmp	.LBB6_151
.LBB6_150:                              ;   in Loop: Header=BB6_3 Depth=1
                                        ; implicit-def: $rc2
                                        ; kill: killed $rc2
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+77)        ; 1-byte Folded Spill
	stx	mos8(.Lprintf_zp_stk+76)        ; 1-byte Folded Spill
	inx
	stx	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Spill
.LBB6_151:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	#0
.LBB6_152:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+9)
	bne	.LBB6_157
; %bb.153:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+8)
	lda	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sta	__rc2
	cpx	__rc2
	tax
	lda	mos8(.Lprintf_zp_stk+8)
	sta	__rc2
	lda	mos8(.Lprintf_zp_stk+9)
	sta	__rc3
	bcs	.LBB6_155
.LBB6_154:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	#0
	stx	__rc2
	sta	__rc3
.LBB6_155:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Reload
	clc
	adc	__rc2
	sta	__rc8
	sta	__rc4
	lda	__rc3
	adc	#0
	sta	__rc5
	cmp	__rc7
	bne	.LBB6_158
; %bb.156:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	__rc8
	cmp	mos8(.Lprintf_zp_stk+10)
	jmp	.LBB6_159
.LBB6_157:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+9)
	cpx	#0
	ldx	mos8(.Lprintf_zp_stk+8)
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+9)
	stx	__rc3
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	bcc	.LBB6_154
	jmp	.LBB6_155
.LBB6_158:                              ;   in Loop: Header=BB6_3 Depth=1
	cmp	__rc7
.LBB6_159:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	#0
	sta	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	bcc	.LBB6_160
	jmp	.LBB6_179
.LBB6_160:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	and	#17
	beq	.LBB6_162
; %bb.161:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+10)
	sec
	sbc	__rc4
	sta	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	lda	__rc7
	sbc	__rc5
	sta	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	jmp	.LBB6_179
.LBB6_162:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+53)
	stx	__rc4
	sec
	lda	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Reload
	sbc	mos8(.Lprintf_zp_stk+10)
	tax
	lda	#0
	sbc	__rc7
	sta	__rc5
	clc
	txa
	adc	__rc2
	sta	mos8(.Lprintf_zp_stk)
	lda	__rc5
	adc	__rc3
	sta	mos8(.Lprintf_zp_stk+1)
	lda	mos8(.Lprintf_zp_stk+54)
	jmp	.LBB6_176
.LBB6_163:                              ;   in Loop: Header=BB6_176 Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
.LBB6_164:                              ;   in Loop: Header=BB6_176 Depth=2
	ldx	mos8(.Lprintf_zp_stk+1)
	stx	__rc2
	bcs	.LBB6_170
; %bb.165:                              ;   in Loop: Header=BB6_176 Depth=2
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_168
; %bb.166:                              ;   in Loop: Header=BB6_176 Depth=2
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_168
; %bb.167:                              ;   in Loop: Header=BB6_176 Depth=2
	clc
	tax
	lda	__rc4
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	txa
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	lda	#32
	sta	(__rc2),y
	jmp	.LBB6_169
.LBB6_168:                              ;   in Loop: Header=BB6_176 Depth=2
	lda	#32
	jsr	__CHROUT
	ldy	#0
.LBB6_169:                              ;   in Loop: Header=BB6_176 Depth=2
	ldx	mos8(.Lprintf_zp_stk+1)
	stx	__rc2
.LBB6_170:                              ;   in Loop: Header=BB6_176 Depth=2
	ldx	mos8(.Lprintf_zp_stk+53)
	lda	mos8(.Lprintf_zp_stk+54)
	inx
	bne	.LBB6_172
; %bb.171:                              ;   in Loop: Header=BB6_176 Depth=2
	clc
	adc	#1
.LBB6_172:                              ;   in Loop: Header=BB6_176 Depth=2
	stx	__rc4
	stx	mos8(.Lprintf_zp_stk+53)
	sta	mos8(.Lprintf_zp_stk+54)
	ldx	mos8(.Lprintf_zp_stk)
	inx
	bne	.LBB6_174
; %bb.173:                              ;   in Loop: Header=BB6_176 Depth=2
	inc	__rc2
.LBB6_174:                              ;   in Loop: Header=BB6_176 Depth=2
	stx	mos8(.Lprintf_zp_stk)
	sty	__rc17
	ldy	__rc2
	sty	mos8(.Lprintf_zp_stk+1)
	ldy	__rc17
	inc	__rc2
	dec	__rc2
	bne	.LBB6_176
; %bb.175:                              ;   in Loop: Header=BB6_176 Depth=2
	cpx	#0
	beq	.LBB6_178
.LBB6_176:                              ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
	beq	.LBB6_177
	jmp	.LBB6_163
.LBB6_177:                              ;   in Loop: Header=BB6_176 Depth=2
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	ldx	__rc4
	cpx	__rc2
	jmp	.LBB6_164
.LBB6_178:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	stx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
.LBB6_179:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+77)        ; 1-byte Folded Reload
	bne	.LBB6_191
; %bb.180:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+53)
	sta	__rc3
	lda	mos8(.Lprintf_zp_stk+54)
	cmp	mos8(.Lprintf_zp_stk+52)
	bne	.LBB6_182
; %bb.181:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sta	__rc5
	lda	__rc3
	cmp	__rc2
	lda	__rc5
	jmp	.LBB6_183
.LBB6_182:                              ;   in Loop: Header=BB6_3 Depth=1
	cmp	mos8(.Lprintf_zp_stk+52)
.LBB6_183:                              ;   in Loop: Header=BB6_3 Depth=1
	sta	__rc2
	bcs	.LBB6_189
; %bb.184:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_187
; %bb.185:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_187
; %bb.186:                              ;   in Loop: Header=BB6_3 Depth=1
	clc
	lda	__rc3
	adc	mos8(.Lprintf_zp_stk+57)
	tax
	lda	__rc2
	adc	mos8(.Lprintf_zp_stk+58)
	stx	__rc2
	sta	__rc3
	lda	mos8(.Lprintf_zp_stk+78)        ; 1-byte Folded Reload
	sta	(__rc2),y
	jmp	.LBB6_188
.LBB6_187:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	lda	mos8(.Lprintf_zp_stk+78)        ; 1-byte Folded Reload
	jsr	putchar
	ldy	#0
.LBB6_188:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
.LBB6_189:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+53)
	bne	.LBB6_191
; %bb.190:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+54)
.LBB6_191:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+76)        ; 1-byte Folded Reload
	beq	.LBB6_203
; %bb.192:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+53)
	sta	__rc3
	lda	mos8(.Lprintf_zp_stk+54)
	cmp	mos8(.Lprintf_zp_stk+52)
	bne	.LBB6_194
; %bb.193:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	sta	__rc5
	lda	__rc3
	cmp	__rc2
	lda	__rc5
	jmp	.LBB6_195
.LBB6_194:                              ;   in Loop: Header=BB6_3 Depth=1
	cmp	mos8(.Lprintf_zp_stk+52)
.LBB6_195:                              ;   in Loop: Header=BB6_3 Depth=1
	sta	__rc2
	bcs	.LBB6_201
; %bb.196:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_199
; %bb.197:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_199
; %bb.198:                              ;   in Loop: Header=BB6_3 Depth=1
	clc
	lda	__rc3
	adc	mos8(.Lprintf_zp_stk+57)
	tax
	lda	__rc2
	adc	mos8(.Lprintf_zp_stk+58)
	stx	__rc2
	sta	__rc3
	lda	mos8(.Lprintf_zp_stk+81)        ; 1-byte Folded Reload
	sta	(__rc2),y
	jmp	.LBB6_200
.LBB6_199:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	lda	mos8(.Lprintf_zp_stk+81)        ; 1-byte Folded Reload
	jsr	putchar
	ldy	#0
.LBB6_200:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
.LBB6_201:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+53)
	bne	.LBB6_203
; %bb.202:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+54)
.LBB6_203:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	#16
	and	mos8(.Lprintf_zp_stk+49)
	bne	.LBB6_204
	jmp	.LBB6_222
.LBB6_204:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+49)
	and	#1
	beq	.LBB6_205
	jmp	.LBB6_222
.LBB6_205:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	sta	__rc2
	lda	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	sta	__rc3
	lda	__rc3
	bne	.LBB6_207
; %bb.206:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	__rc2
	bne	.LBB6_207
	jmp	.LBB6_320
.LBB6_207:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+53)
	stx	__rc4
	lda	mos8(.Lprintf_zp_stk+54)
	jmp	.LBB6_219
.LBB6_208:                              ;   in Loop: Header=BB6_219 Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
	bcs	.LBB6_213
.LBB6_209:                              ;   in Loop: Header=BB6_219 Depth=2
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_212
; %bb.210:                              ;   in Loop: Header=BB6_219 Depth=2
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_212
; %bb.211:                              ;   in Loop: Header=BB6_219 Depth=2
	clc
	tax
	lda	__rc4
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	txa
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	lda	#48
	sta	(__rc2),y
	jmp	.LBB6_213
.LBB6_212:                              ;   in Loop: Header=BB6_219 Depth=2
	lda	#48
	jsr	__CHROUT
	ldy	#0
.LBB6_213:                              ;   in Loop: Header=BB6_219 Depth=2
	ldx	mos8(.Lprintf_zp_stk+53)
	lda	mos8(.Lprintf_zp_stk+54)
	inx
	bne	.LBB6_215
; %bb.214:                              ;   in Loop: Header=BB6_219 Depth=2
	clc
	adc	#1
.LBB6_215:                              ;   in Loop: Header=BB6_219 Depth=2
	stx	__rc4
	stx	mos8(.Lprintf_zp_stk+53)
	sta	mos8(.Lprintf_zp_stk+54)
	ldx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	stx	__rc3
	ldx	#255
	dec	__rc2
	cpx	__rc2
	bne	.LBB6_217
; %bb.216:                              ;   in Loop: Header=BB6_219 Depth=2
	dec	__rc3
.LBB6_217:                              ;   in Loop: Header=BB6_219 Depth=2
	ldx	__rc2
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	bne	.LBB6_219
; %bb.218:                              ;   in Loop: Header=BB6_219 Depth=2
	ldx	__rc2
	beq	.LBB6_221
.LBB6_219:                              ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
	beq	.LBB6_220
	jmp	.LBB6_208
.LBB6_220:                              ;   in Loop: Header=BB6_219 Depth=2
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	ldx	__rc4
	cpx	__rc2
	bcs	.LBB6_213
	jmp	.LBB6_209
.LBB6_221:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	stx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
.LBB6_222:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	#0
	cmp	mos8(.Lprintf_zp_stk+9)
	bne	.LBB6_224
; %bb.223:                              ;   in Loop: Header=BB6_3 Depth=1
	cpx	mos8(.Lprintf_zp_stk+8)
	bcc	.LBB6_225
	jmp	.LBB6_240
.LBB6_224:                              ;   in Loop: Header=BB6_3 Depth=1
	cmp	mos8(.Lprintf_zp_stk+9)
	bcc	.LBB6_225
	jmp	.LBB6_240
.LBB6_225:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+53)
	stx	__rc3
	lda	mos8(.Lprintf_zp_stk+54)
.LBB6_226:                              ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldx	#255
	dec	mos8(.Lprintf_zp_stk+8)
	cpx	mos8(.Lprintf_zp_stk+8)
	bne	.LBB6_228
; %bb.227:                              ;   in Loop: Header=BB6_226 Depth=2
	dec	mos8(.Lprintf_zp_stk+9)
.LBB6_228:                              ;   in Loop: Header=BB6_226 Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
	bne	.LBB6_230
; %bb.229:                              ;   in Loop: Header=BB6_226 Depth=2
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	ldx	__rc3
	cpx	__rc2
	bcc	.LBB6_231
	jmp	.LBB6_235
.LBB6_230:                              ;   in Loop: Header=BB6_226 Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
	bcs	.LBB6_235
.LBB6_231:                              ;   in Loop: Header=BB6_226 Depth=2
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_234
; %bb.232:                              ;   in Loop: Header=BB6_226 Depth=2
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_234
; %bb.233:                              ;   in Loop: Header=BB6_226 Depth=2
	clc
	tax
	lda	__rc3
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	txa
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	lda	#48
	sta	(__rc2),y
	jmp	.LBB6_235
.LBB6_234:                              ;   in Loop: Header=BB6_226 Depth=2
	lda	#48
	jsr	__CHROUT
	ldy	#0
.LBB6_235:                              ;   in Loop: Header=BB6_226 Depth=2
	ldx	mos8(.Lprintf_zp_stk+53)
	lda	mos8(.Lprintf_zp_stk+54)
	inx
	bne	.LBB6_237
; %bb.236:                              ;   in Loop: Header=BB6_226 Depth=2
	clc
	adc	#1
.LBB6_237:                              ;   in Loop: Header=BB6_226 Depth=2
	stx	__rc3
	stx	mos8(.Lprintf_zp_stk+53)
	sta	mos8(.Lprintf_zp_stk+54)
	ldx	#0
	cpx	mos8(.Lprintf_zp_stk+9)
	bne	.LBB6_239
; %bb.238:                              ;   in Loop: Header=BB6_226 Depth=2
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	cpx	mos8(.Lprintf_zp_stk+8)
	bcs	.LBB6_240
	jmp	.LBB6_226
.LBB6_239:                              ;   in Loop: Header=BB6_226 Depth=2
	cpx	mos8(.Lprintf_zp_stk+9)
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	bcs	.LBB6_240
	jmp	.LBB6_226
.LBB6_240:                              ;   in Loop: Header=BB6_3 Depth=1
	txa
	bne	.LBB6_241
	jmp	.LBB6_278
.LBB6_241:                              ;   in Loop: Header=BB6_3 Depth=1
	dex
	bne	.LBB6_242
	jmp	.LBB6_262
.LBB6_242:                              ;   in Loop: Header=BB6_3 Depth=1
	stx	mos8(.Lprintf_zp_stk+8)
	ldx	mos8(.Lprintf_zp_stk+79)        ; 1-byte Folded Reload
	txa
	clc
	adc	mos8(.Lprintf_zp_stk+8)
	sta	mos8(.Lprintf_zp_stk)
	lda	mos8(.Lprintf_zp_stk+80)        ; 1-byte Folded Reload
	adc	#0
	sta	mos8(.Lprintf_zp_stk+1)
	jmp	.LBB6_260
.LBB6_243:                              ;   in Loop: Header=BB6_260 Depth=2
	sta	__rc3
	lda	#128
	and	mos8(.Lprintf_zp_stk+49)
	beq	.LBB6_245
; %bb.244:                              ;   in Loop: Header=BB6_260 Depth=2
	ldx	#97
	jmp	.LBB6_246
.LBB6_245:                              ;   in Loop: Header=BB6_260 Depth=2
	ldx	#65
.LBB6_246:                              ;   in Loop: Header=BB6_260 Depth=2
	stx	__rc2
	clc
	lda	__rc3
	adc	__rc2
	clc
	adc	#246
.LBB6_247:                              ;   in Loop: Header=BB6_260 Depth=2
	ldy	mos8(.Lprintf_zp_stk+53)
	ldx	mos8(.Lprintf_zp_stk+54)
	cpx	mos8(.Lprintf_zp_stk+52)
	bne	.LBB6_249
; %bb.248:                              ;   in Loop: Header=BB6_260 Depth=2
	stx	__rc4
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	sty	__rc3
	cpy	__rc2
	jmp	.LBB6_250
.LBB6_249:                              ;   in Loop: Header=BB6_260 Depth=2
	sty	__rc3
	stx	__rc4
	cpx	mos8(.Lprintf_zp_stk+52)
.LBB6_250:                              ;   in Loop: Header=BB6_260 Depth=2
	ldy	#0
	bcs	.LBB6_255
; %bb.251:                              ;   in Loop: Header=BB6_260 Depth=2
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_254
; %bb.252:                              ;   in Loop: Header=BB6_260 Depth=2
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_254
; %bb.253:                              ;   in Loop: Header=BB6_260 Depth=2
	clc
	tax
	lda	__rc3
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	lda	__rc4
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	txa
	sta	(__rc2),y
	jmp	.LBB6_255
.LBB6_254:                              ;   in Loop: Header=BB6_260 Depth=2
	ldx	#0
	jsr	putchar
	ldy	#0
.LBB6_255:                              ;   in Loop: Header=BB6_260 Depth=2
	inc	mos8(.Lprintf_zp_stk+53)
	bne	.LBB6_257
; %bb.256:                              ;   in Loop: Header=BB6_260 Depth=2
	inc	mos8(.Lprintf_zp_stk+54)
.LBB6_257:                              ;   in Loop: Header=BB6_260 Depth=2
	dec	mos8(.Lprintf_zp_stk+8)
	ldx	#255
	dec	mos8(.Lprintf_zp_stk)
	cpx	mos8(.Lprintf_zp_stk)
	bne	.LBB6_259
; %bb.258:                              ;   in Loop: Header=BB6_260 Depth=2
	dec	mos8(.Lprintf_zp_stk+1)
.LBB6_259:                              ;   in Loop: Header=BB6_260 Depth=2
	lda	mos8(.Lprintf_zp_stk+8)
	beq	.LBB6_262
.LBB6_260:                              ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lda	(mos8(.Lprintf_zp_stk)),y
	cmp	#10
	bcc	.LBB6_261
	jmp	.LBB6_243
.LBB6_261:                              ;   in Loop: Header=BB6_260 Depth=2
	ora	#48
	jmp	.LBB6_247
.LBB6_262:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+14)
	cmp	#10
	bcs	.LBB6_264
; %bb.263:                              ;   in Loop: Header=BB6_3 Depth=1
	ora	#48
	jmp	.LBB6_268
.LBB6_264:                              ;   in Loop: Header=BB6_3 Depth=1
	sta	__rc3
	lda	#128
	and	mos8(.Lprintf_zp_stk+49)
	beq	.LBB6_266
; %bb.265:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#97
	jmp	.LBB6_267
.LBB6_266:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#65
.LBB6_267:                              ;   in Loop: Header=BB6_3 Depth=1
	stx	__rc2
	clc
	lda	__rc3
	adc	__rc2
	clc
	adc	#246
.LBB6_268:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	mos8(.Lprintf_zp_stk+53)
	ldx	mos8(.Lprintf_zp_stk+54)
	cpx	mos8(.Lprintf_zp_stk+52)
	bne	.LBB6_270
; %bb.269:                              ;   in Loop: Header=BB6_3 Depth=1
	stx	__rc4
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	sty	__rc3
	cpy	__rc2
	jmp	.LBB6_271
.LBB6_270:                              ;   in Loop: Header=BB6_3 Depth=1
	sty	__rc3
	stx	__rc4
	cpx	mos8(.Lprintf_zp_stk+52)
.LBB6_271:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	#0
	bcs	.LBB6_276
; %bb.272:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_275
; %bb.273:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_275
; %bb.274:                              ;   in Loop: Header=BB6_3 Depth=1
	clc
	tax
	lda	__rc3
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	lda	__rc4
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	txa
	sta	(__rc2),y
	jmp	.LBB6_276
.LBB6_275:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#0
	jsr	putchar
	ldy	#0
.LBB6_276:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+53)
	bne	.LBB6_278
; %bb.277:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+54)
.LBB6_278:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	mos8(.Lprintf_zp_stk+49)
	and	#1
	bne	.LBB6_282
; %bb.279:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+53)
	stx	__rc4
	lda	mos8(.Lprintf_zp_stk+54)
.LBB6_280:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	mos8(.Lprintf_zp_stk+51)
	ldx	mos8(.Lprintf_zp_stk+52)
	stx	__rc2
	stx	__rc3
	cmp	__rc2
	beq	.LBB6_281
	jmp	.LBB6_297
.LBB6_281:                              ;   in Loop: Header=BB6_3 Depth=1
	sty	__rc2
	ldx	__rc4
	cpx	__rc2
	jmp	.LBB6_298
.LBB6_282:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+53)
	stx	__rc4
	lda	mos8(.Lprintf_zp_stk+54)
	ldx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	stx	__rc3
	ldx	__rc3
	beq	.LBB6_283
	jmp	.LBB6_295
.LBB6_283:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc2
	beq	.LBB6_280
	jmp	.LBB6_295
.LBB6_284:                              ;   in Loop: Header=BB6_295 Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
	bcs	.LBB6_289
.LBB6_285:                              ;   in Loop: Header=BB6_295 Depth=2
	ldx	mos8(.Lprintf_zp_stk+64)
	cpx	mos8(.Lprintf_zp_stk+3)
	bne	.LBB6_288
; %bb.286:                              ;   in Loop: Header=BB6_295 Depth=2
	ldx	mos8(.Lprintf_zp_stk+63)
	cpx	mos8(.Lprintf_zp_stk+2)
	bne	.LBB6_288
; %bb.287:                              ;   in Loop: Header=BB6_295 Depth=2
	clc
	tax
	lda	__rc4
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	txa
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	lda	#32
	sta	(__rc2),y
	jmp	.LBB6_289
.LBB6_288:                              ;   in Loop: Header=BB6_295 Depth=2
	lda	#32
	jsr	__CHROUT
	ldy	#0
.LBB6_289:                              ;   in Loop: Header=BB6_295 Depth=2
	ldx	mos8(.Lprintf_zp_stk+53)
	lda	mos8(.Lprintf_zp_stk+54)
	inx
	bne	.LBB6_291
; %bb.290:                              ;   in Loop: Header=BB6_295 Depth=2
	clc
	adc	#1
.LBB6_291:                              ;   in Loop: Header=BB6_295 Depth=2
	stx	__rc4
	stx	mos8(.Lprintf_zp_stk+53)
	sta	mos8(.Lprintf_zp_stk+54)
	ldx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Reload
	stx	__rc2
	ldx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Reload
	stx	__rc3
	ldx	#255
	dec	__rc2
	cpx	__rc2
	bne	.LBB6_293
; %bb.292:                              ;   in Loop: Header=BB6_295 Depth=2
	dec	__rc3
.LBB6_293:                              ;   in Loop: Header=BB6_295 Depth=2
	ldx	__rc2
	stx	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	ldx	__rc3
	stx	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	bne	.LBB6_295
; %bb.294:                              ;   in Loop: Header=BB6_295 Depth=2
	ldx	__rc2
	bne	.LBB6_295
	jmp	.LBB6_280
.LBB6_295:                              ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	mos8(.Lprintf_zp_stk+52)
	beq	.LBB6_296
	jmp	.LBB6_284
.LBB6_296:                              ;   in Loop: Header=BB6_295 Depth=2
	ldx	mos8(.Lprintf_zp_stk+51)
	stx	__rc2
	ldx	__rc4
	cpx	__rc2
	bcs	.LBB6_289
	jmp	.LBB6_285
.LBB6_297:                              ;   in Loop: Header=BB6_3 Depth=1
	stx	__rc2
	cmp	__rc2
.LBB6_298:                              ;   in Loop: Header=BB6_3 Depth=1
	tya
	ldy	#0
	bcc	.LBB6_305
; %bb.299:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	__rc3
	bne	.LBB6_301
; %bb.300:                              ;   in Loop: Header=BB6_3 Depth=1
	tax
	beq	.LBB6_305
.LBB6_301:                              ;   in Loop: Header=BB6_3 Depth=1
	clc
	adc	mos8(.Lprintf_zp_stk+57)
	sta	__rc2
	lda	__rc3
	adc	mos8(.Lprintf_zp_stk+58)
	sta	__rc3
	ldx	#255
	dec	__rc2
	cpx	__rc2
	bne	.LBB6_303
; %bb.302:                              ;   in Loop: Header=BB6_3 Depth=1
	dec	__rc3
.LBB6_303:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	#0
.LBB6_304:                              ;   in Loop: Header=BB6_3 Depth=1
	sta	(__rc2),y
.LBB6_305:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+6)
	bne	.LBB6_307
; %bb.306:                              ;   in Loop: Header=BB6_3 Depth=1
	inc	mos8(.Lprintf_zp_stk+7)
.LBB6_307:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+7)
	cpx	mos8(.Lprintf_zp_stk+5)
	beq	.LBB6_308
	jmp	.LBB6_3
.LBB6_308:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	mos8(.Lprintf_zp_stk+6)
	cpx	mos8(.Lprintf_zp_stk+4)
	beq	.LBB6_309
	jmp	.LBB6_3
.LBB6_309:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	#0
	lda	(mos8(.Lprintf_zp_stk+4)),y
	jmp	.LBB6_5
.LBB6_310:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	#4
	jmp	.LBB6_312
.LBB6_311:                              ;   in Loop: Header=BB6_3 Depth=1
	ldy	#2
.LBB6_312:                              ;   in Loop: Header=BB6_3 Depth=1
	sty	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	jmp	.LBB6_86
.LBB6_313:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#32
	stx	mos8(.Lprintf_zp_stk+78)        ; 1-byte Folded Spill
	jmp	.LBB6_146
.LBB6_314:                              ;   in Loop: Header=BB6_3 Depth=1
	cpx	mos8(.Lprintf_zp_stk+9)
	lda	mos8(.Lprintf_zp_stk+71)        ; 1-byte Folded Reload
	ldx	mos8(.Lprintf_zp_stk+69)        ; 1-byte Folded Reload
	bcs	.LBB6_315
	jmp	.LBB6_145
.LBB6_315:                              ;   in Loop: Header=BB6_3 Depth=1
	stx	mos8(.Lprintf_zp_stk+8)
	ldx	#0
	inc	mos8(.Lprintf_zp_stk+8)
	bne	.LBB6_317
; %bb.316:                              ;   in Loop: Header=BB6_3 Depth=1
	inx
.LBB6_317:                              ;   in Loop: Header=BB6_3 Depth=1
	stx	mos8(.Lprintf_zp_stk+9)
	jmp	.LBB6_145
.LBB6_318:                              ;   in Loop: Header=BB6_3 Depth=1
	ldx	#88
.LBB6_319:                              ;   in Loop: Header=BB6_3 Depth=1
	stx	mos8(.Lprintf_zp_stk+81)        ; 1-byte Folded Spill
	ldy	#0
	ldx	#1
	stx	mos8(.Lprintf_zp_stk+76)        ; 1-byte Folded Spill
	ldx	#48
	stx	mos8(.Lprintf_zp_stk+78)        ; 1-byte Folded Spill
	ldx	#2
	stx	mos8(.Lprintf_zp_stk+75)        ; 1-byte Folded Spill
	ldx	#0
	stx	mos8(.Lprintf_zp_stk+77)        ; 1-byte Folded Spill
	jmp	.LBB6_152
.LBB6_320:                              ;   in Loop: Header=BB6_3 Depth=1
	lda	#0
	sta	mos8(.Lprintf_zp_stk+70)        ; 1-byte Folded Spill
	sta	mos8(.Lprintf_zp_stk+72)        ; 1-byte Folded Spill
	jmp	.LBB6_222
.LBB6_321:
	rts
.Lfunc_end6:
	.size	printf, .Lfunc_end6-printf
	.section	.rodata.printf,"a",@progbits
.LJTI6_0:
	.byte	.LBB6_27@mos16lo
	.byte	.LBB6_16@mos16lo
	.byte	.LBB6_32@mos16lo
	.byte	.LBB6_23@mos16lo
	.byte	.LBB6_32@mos16lo
	.byte	.LBB6_32@mos16lo
	.byte	.LBB6_20@mos16lo
	.byte	.LBB6_27@mos16hi
	.byte	.LBB6_16@mos16hi
	.byte	.LBB6_32@mos16hi
	.byte	.LBB6_23@mos16hi
	.byte	.LBB6_32@mos16hi
	.byte	.LBB6_32@mos16hi
	.byte	.LBB6_20@mos16hi
.LJTI6_1:
	.byte	.LBB6_98@mos16lo
	.byte	.LBB6_88@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_88@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_95@mos16lo
	.byte	.LBB6_97@mos16lo
	.byte	.LBB6_91@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_96@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_100@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_309@mos16lo
	.byte	.LBB6_92@mos16lo
	.byte	.LBB6_98@mos16hi
	.byte	.LBB6_88@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_88@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_95@mos16hi
	.byte	.LBB6_97@mos16hi
	.byte	.LBB6_91@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_96@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_100@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_309@mos16hi
	.byte	.LBB6_92@mos16hi
                                        ; -- End function
	.section	.text.putchar,"ax",@progbits
	.type	putchar,@function               ; -- Begin function putchar
putchar:                                ; @putchar
; %bb.0:
	stx	mos8(.Lputchar_zp_stk+1)
	cmp	#10
	beq	.LBB7_9
; %bb.1:
	cmp	#8
	beq	.LBB7_10
; %bb.2:
	cmp	#97
	bcc	.LBB7_5
; %bb.3:
	cmp	#123
	tax
	bcs	.LBB7_8
; %bb.4:
	and	#95
	jmp	.LBB7_8
.LBB7_5:
	cmp	#65
	tax
	bcc	.LBB7_8
; %bb.6:
	cpx	#91
	bcs	.LBB7_8
; %bb.7:
	ora	#128
.LBB7_8:
	stx	mos8(.Lputchar_zp_stk)
	jsr	__CHROUT
	ldx	mos8(.Lputchar_zp_stk+1)
	lda	mos8(.Lputchar_zp_stk)
	rts
.LBB7_9:
	tax
	lda	#13
	jmp	.LBB7_8
.LBB7_10:
	tax
	lda	#157
	jmp	.LBB7_8
.Lfunc_end7:
	.size	putchar, .Lfunc_end7-putchar
                                        ; -- End function
	.section	.text.memcpy,"ax",@progbits
	.weak	memcpy                          ; -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; %bb.0:
	sta	__rc8
	txa
	bne	.LBB106_2
; %bb.1:
	lda	__rc8
	beq	.LBB106_11
.LBB106_2:
	ldy	#0
	lda	__rc2
	sta	__rc6
	lda	__rc3
	sta	__rc7
.LBB106_3:                              ; =>This Inner Loop Header: Depth=1
	lda	(__rc4),y
	sta	(__rc6),y
	inc	__rc6
	bne	.LBB106_5
; %bb.4:                                ;   in Loop: Header=BB106_3 Depth=1
	inc	__rc7
.LBB106_5:                              ;   in Loop: Header=BB106_3 Depth=1
	inc	__rc4
	bne	.LBB106_7
; %bb.6:                                ;   in Loop: Header=BB106_3 Depth=1
	inc	__rc5
.LBB106_7:                              ;   in Loop: Header=BB106_3 Depth=1
	lda	#255
	dec	__rc8
	cmp	__rc8
	bne	.LBB106_9
; %bb.8:                                ;   in Loop: Header=BB106_3 Depth=1
	dex
.LBB106_9:                              ;   in Loop: Header=BB106_3 Depth=1
	txa
	bne	.LBB106_3
; %bb.10:                               ;   in Loop: Header=BB106_3 Depth=1
	lda	__rc8
	bne	.LBB106_3
.LBB106_11:
	rts
.Lfunc_end8:
	.size	memcpy, .Lfunc_end8-memcpy
                                        ; -- End function
	.section	.text.__memset,"ax",@progbits
	.weak	__memset                        ; -- Begin function __memset
	.type	__memset,@function
__memset:                               ; @__memset
; %bb.0:
	ldy	__rc4
	bne	.LBB108_2
; %bb.1:
	cpx	#0
	beq	.LBB108_8
.LBB108_2:                              ; =>This Inner Loop Header: Depth=1
	ldy	#0
	sta	(__rc2),y
	inc	__rc2
	bne	.LBB108_4
; %bb.3:                                ;   in Loop: Header=BB108_2 Depth=1
	inc	__rc3
.LBB108_4:                              ;   in Loop: Header=BB108_2 Depth=1
	dex
	cpx	#255
	bne	.LBB108_6
; %bb.5:                                ;   in Loop: Header=BB108_2 Depth=1
	dec	__rc4
.LBB108_6:                              ;   in Loop: Header=BB108_2 Depth=1
	ldy	__rc4
	bne	.LBB108_2
; %bb.7:                                ;   in Loop: Header=BB108_2 Depth=1
	cpx	#0
	bne	.LBB108_2
.LBB108_8:
	rts
.Lfunc_end9:
	.size	__memset, .Lfunc_end9-__memset
                                        ; -- End function
	.type	_ZL4tile,@object                ; @_ZL4tile
	.section	.zp.data,"aw",@progbits
_ZL4tile:
	.ascii	"QRST"
	.size	_ZL4tile, 4

	.type	tm,@object                      ; @tm
	.section	.bss.tm,"aw",@nobits
tm:
	.short	0                               ; 0x0
	.size	tm, 2

	.type	.L.str,@object                  ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"TIME: %u\n"
	.size	.L.str, 10

	.type	.Lzp_stack,@object              ; @zp_stack
	.section	.zp.noinit,"aw",@nobits
.Lzp_stack:
	.zero	95
	.size	.Lzp_stack, 95

.set .Lputchar_zp_stk, .Lzp_stack+93
	.size	.Lputchar_zp_stk, 2
.set .L_ZN12_GLOBAL__N_13putEcP6Status_zp_stk, .Lzp_stack+91
	.size	.L_ZN12_GLOBAL__N_13putEcP6Status_zp_stk, 2
.set .L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk, .Lzp_stack+83
	.size	.L_ZN12_GLOBAL__N_112print_stringEPKcP6Status_zp_stk, 8
.set .Lprintf_zp_stk, .Lzp_stack+1
	.size	.Lprintf_zp_stk, 82
.set .L_Z4drawh_zp_stk, .Lzp_stack+1
	.size	.L_Z4drawh_zp_stk, 2
.set .Lmain_zp_stk, .Lzp_stack
	.size	.Lmain_zp_stk, 1
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.ident	"clang version 20.0.0git (https://github.com/llvm-mos/llvm-mos 9c474559bc43dab19cdcba9279dfe27b56dd3fd3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z5timerv
	.addrsig_sym tm
	.addrsig_sym .Lzp_stack
	.section	.llvm_sympart,"",@llvm_sympart,unique,1
	.ascii	"contingent"
	.zero	1
	.long	memcpy
	.section	.llvm_sympart,"",@llvm_sympart,unique,2
	.ascii	"contingent"
	.zero	1
	.long	__memset
	;Declaring this symbol tells the CRT that there is something in .bss, so it may need to be zeroed.
	.globl	__do_zero_bss
	;Declaring this symbol tells the CRT that there is something in .zp.data, so it may need to be copied from LMA to VMA.
	.globl	__do_copy_zp_data
	;Declaring this symbol tells the CRT that the stack pointer needs to be initialized.
	.globl	__do_init_stack
