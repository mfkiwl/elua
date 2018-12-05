#ifndef __RISCV_GDB_STUB_H__
#define __RISCV_GDB_STUB_H__

#include "trapframe.h"

#ifndef GDB_DEBUG_UART
#define GDB_DEBUG_UART 1
#endif

#ifndef GDB_DEBUG_BAUD
#define GDB_DEBUG_BAUD 115200
#endif 


t_ptrapfuntion gdb_initDebugger(int set_mtvec);

u32 gdb_setup_interface(u32 port, u32 baudrate);


/* This function will generate a breakpoint exception.  It is used at the
   beginning of a program to sync up with a debugger and can be used
   otherwise as a quick means to stop program execution and "break" into
   the debugger. */

inline void gdb_breakpoint (void)
{
  asm("sbreak");

}


#endif
