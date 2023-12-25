.global main_loop

.type main_loop, %function
main_loop:
LDR r7, =0xDEADBEEF
MOV r0, #0

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
.size main_loop, .-main_loop
