/* Define the end of RAM and limit of stack memory 
   SRAM:  8KB SRAM on the STM32F030R8,
  	  starts at address 0x20000000 (+ 8192 = 0x2000)
   FLASH: 64k on the STM32F030R8
*/
_estack = 0x20002000;

MEMORY
{
	FLASH ( rx )      : ORIGIN = 0x08000000, LENGTH = 64K
	RAM ( rxw )       : ORIGIN = 0x20000000, LENGTH = 8K
}

SECTIONS
{
  /* The 'text' section contains the main program code. */
  .text :
  {
    . = ALIGN(4);
    *(.text)
    *(.text*)
    . = ALIGN(4);
  } >FLASH
  /* The 'data' section is space set aside in RAM for
   * things like variables, which can change. */
  _sidata = .;
  .data : AT(_sidata)
  {
    . = ALIGN(4);
    /* Mark start/end locations for the 'data' section. */
    _sdata = .;
    *(.data)
    *(.data*)
    _edata = .;
    . = ALIGN(4);
  } >RAM
}
