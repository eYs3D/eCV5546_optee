#ifndef PLATFORM_CONFIG_H
#define PLATFORM_CONFIG_H

#include <mm/generic_ram_layout.h>

/* Make stacks aligned to data cache line length */
#define STACK_ALIGNMENT		64

#define SIZE_K(n)		((n) * 1024)

#define CONSOLE_SP_UART_BASE	0xF8801900 /* UART0 */
#define SP_UART_REG_SIZE        0x80

#define SP_SPI_FLASH_BASE   0xF0000000
#define SP_SPI_FLASH_SIZE   0x20000

#define SP_GICC_SIZE		SIZE_K(8)
#define SP_GICD_SIZE		SIZE_K(4)

#define SP_GICD_BASE		0xFA001000
#define SP_GICC_BASE		0xFA002000 

#define DRAM0_BASE		    0x00000000
#define DRAM0_SIZE		    0x80000000

#endif
