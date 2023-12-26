.cpu cortex-m0

/* software floating-point linkage. cortex-m0 chips don't have a hw fpu*/
.fpu softvfp

/* 16-bit thumb 1/2 instruction set is supported only on cortex-M chips */
.thumb

.text

/* virtual table */
.global vtable

/* entry point */
.global reset_handler

.type vtable, %object
vtable:
	.word _estack
	.word reset_handler
.size vtable, .-vtable

.type reset_handler, %function
reset_handler:
	/* set up the stack */
	LDR r0, =_estack
	MOV sp, r0

	/* go to main loop */
	b main_loop
.size reset_handler, .-reset_handler
