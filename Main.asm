; ---------------------------------------------------------------------------------------
; Vector Table
	dc.l	"SEGA", CPUStart
; ---------------------------------------------------------------------------------------
; Main Program
CPUStart:
		move.w	$A10000, ccr		;Test Hardware version
		bcc.s	@Skip			;"
		move.l	sp, $A14000		;Write "SEGA" to TMSS
	@Skip:
		lea	$C00004, a1		;VDP Control Port
		lea	(a1), a0		;Clone of VDPControl

		move.l	#$80048F00, (a1)	;Genesis Colors, Auto Inc = 0
		move.l	#$8104C000, (a1)+	;Genesis Mode, Set Control to CRAM, Set A1 to HV Counter

MainLoop:
		move.w	#$0E00, -(a0)		;$0E00 Blue

	@NotYet1:
		cmp.b	#112, (a1)
		bne.s	@NotYet1
		move.w	#$00EE, (a0)+		;$00EE Yellow

	@NotYet2:
		cmp.b	#240, (a1)
		bne.s	@NotYet2
		bra.s	MainLoop

; ---------------------------------------------------------------------------------------