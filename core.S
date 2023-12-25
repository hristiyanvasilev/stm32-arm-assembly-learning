.cpu cortex-m0
.fpu softvfp
.thumb

.global vtable
.global reset_handler

.type vtable, %object
vtable:
	.word _estack
	.word reset_handler
.size vtable, .-vtable

.type reset_handler, %function
reset_handler:
	LDR r0, =_estack
	MOV sp, r0

	LDR r7, =0xDEADBEEF
	MOV r0, #0
	main_loop:
		/* add 1 to r0 and save result back to r0*/
		ADD r0, r0, #1

		/* substract 1 from r0 and save result back to r0 */
		SUB r0, r0, #1

		/* load 0x20001000 in r3 */
		LDR r3, =0x20001000

		/* load 0xFF in r4 (cant load more than 1 byte) */
		MOV r4, #0xFF

		/* read memory stored in addr (r3) in r2 */
		LDR r2, [r3]

		B main_loop
.size reset_handler, .-reset_handler
