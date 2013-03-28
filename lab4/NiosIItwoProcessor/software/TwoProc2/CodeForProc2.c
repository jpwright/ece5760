/////// Hardware Mutex Text ////////////////
///////BRL4@cornell.edu : Oct 2006 /////////
////////////////////////////////////////////
// system.h has peripheral base addresses, IRQ definitions, and cpu details
#include "system.h"
// Next include has definition of alt_irq_register
#include "sys/alt_irq.h"
//The next includes are in syslib/DeviceDrivers[sopc_builder]
//They have the macros for setting values in peripherals
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_mutex_regs.h"
#include "altera_avalon_mutex.h"

//I like these:
#define begin {
#define end }  

/* get the hardware mutex device handle */
alt_mutex_dev* mutex ;
  
//timer ISR which is called by the HAL exception dispatcher
static void timer_isr(void* context, alt_u32 id)
begin
  //recast ISR context variable to pointer to int
  volatile int* flag_ptr = (volatile int*) context;
  IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_1_BASE, 0); //reset TO flag
  //count if we have the mutex
  if (altera_avalon_mutex_is_mine(mutex))
    *flag_ptr = *flag_ptr + 1;     //toggle inversion flag
end

int main(void)
begin
  volatile int flag; //LED inversion flag is set by ISR and read by main
  int sw; //switch input register
  flag = 0x00; //init the counter  
  //set up timer
  //one second period, 50e6 counts = 0x2FAF080
  IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_1_BASE, 0xf080);
  IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_1_BASE, 0x2fa);
  //set RUN, set CONTuous, set ITO
  IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_1_BASE, 7);
  //register the interrupt (and turn it on)
  alt_irq_register(TIMER_1_IRQ, (void*)&flag, timer_isr);
  //get hardware mutex handle
  mutex = altera_avalon_mutex_open( "/dev/mutex_0" );
  
  //now just loop and blink some lights
  while(1)
  begin
    //read the switches
    sw = 0x01 & IORD_ALTERA_AVALON_PIO_DATA(IN_1_BASE);
    if (sw) //if sw0 is up, then get mutex   
      /* acquire the mutex, setting the value to one */
      altera_avalon_mutex_lock( mutex, 1 );
    else //switch is not up so release the lock 
      altera_avalon_mutex_unlock( mutex );   
    //display current count
    IOWR_ALTERA_AVALON_PIO_DATA(OUT_1_BASE, flag);   
  end
end
