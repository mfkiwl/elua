// This header lists all interrupts defined for this platform

#ifndef __PLATFORM_INTS_H__
#define __PLATFORM_INTS_H__

#include "elua_int.h"

//#define INT_GPIO_POSEDGE      ELUA_INT_FIRST_ID
//#define INT_GPIO_NEGEDGE      ( ELUA_INT_FIRST_ID + 1 )
#define INT_TMR_MATCH         ( ELUA_INT_FIRST_ID  )
#define INT_UART_RX_FIFO      ( ELUA_INT_FIRST_ID + 1 )
#define INT_ELUA_LAST         INT_UART_RX_FIFO

#endif // #ifndef __PLATFORM_INTS_H__

