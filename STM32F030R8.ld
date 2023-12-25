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
