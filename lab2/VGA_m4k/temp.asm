 constant
 switches 0
 sram_data 1
 sync 2
 cpu_id 3
 rom_data 4
 rom_addr 4
 LEDred 3
 vga_addr 0
 sram_addr 0
 mutex_addr 0
 vga_data 1
 sram_data 1
 vga_cntl 2
 sram_cntl 2
 mutex_cntl 2
 white 255
 black 0
 gray1 21
 gray2 42
 gray3 63
 gray4 170
 gray5 213
 gray6 234
 red 240
 yellow 252
 green 204
 cyan 207
 forever 1
 N 1200
 not_done -1
 shared_count -2
 shared_count_no -3
 mem_lock 7
 cpu2_lock 2
 cpu3_lock 3
 zero 48
 a 97
 variable
 count
 x 1200
 y 1200
 rand
 rand2
 temp
 neighbor
 agg_count
 ymax
 color
 vga_putstr_count
 vga_putstr_x
 vga_putstr_y
 vga_putstr_color
 vga_puthex_x
 vga_puthex_y
 vga_puthex_color
 vga_puthex_value
 vga_puthex_count
 vga_puthex_shift
 function
 rand_bit
 vga_putchar
 vga_putstr
 vga_puthex
 program
 main:
 1 out[vga_cntl]
 100 =count
 while count 540 lt
 do
 white 475 count
; inline vga_point
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
   if push.4 then 8 shl endif
   out[vga_data] 
	push.4 1 shl 
	4 bor out[vga_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline vga_point

 count 1 add =count
 endwhile
 0 dup =agg_count out[LEDred]
 0 shared_count
; inline sram_write
	out[sram_addr]
	out[sram_data]
	12 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
	nop. 
; end inline sram_write

 0 shared_count_no
; inline sram_write
	out[sram_addr]
	out[sram_data]
	12 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
	nop. 
; end inline sram_write

 in[switches] in[cpu_id] add =rand
 if in[cpu_id] 1 eq
 then
 cyan =color
 endif
 if in[cpu_id] 2 eq
 then
 green =color
 cpu2_lock
; inline mutex_test_set
	out[sram_addr]
	17 out[sram_cntl] 
   while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline mutex_test_set

 endif
 if in[cpu_id] 3 eq
 then
 red =color
 cpu3_lock
; inline mutex_test_set
	out[sram_addr]
	17 out[sram_cntl] 
   while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline mutex_test_set

 endif
 if in[cpu_id] 1 eq
 then
 "Cornell yellow 5 20 vga_putstr
 "ece5760 yellow 5 84 vga_putstr
 "count green 26 20 vga_putstr
 "count_low red 26 80 vga_putstr
 endif
 1 not_done
; inline sram_write
	out[sram_addr]
	out[sram_data]
	12 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
	nop. 
; end inline sram_write

 450 =ymax
 0 =count
 while count N lt
 do
 count 1 shr =x[count]
 ymax =y[count]
 count 1 add =count
 endwhile
 while not_done
; inline sram_read
	out[sram_addr]
	5 out[sram_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline sram_read

 do
 0 =count
 while count N lt
 do
 black y[count] x[count]
; inline vga_point
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
   if push.4 then 8 shl endif
   out[vga_data] 
	push.4 1 shl 
	4 bor out[vga_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline vga_point

 rand_bit x[count] add =x[count]
 rand_bit y[count] add =y[count]
 if x[count] 635 gt then
 633 =x[count]
 endif
 if x[count] 5 le then
 7 =x[count]
 endif
 if y[count] 475 gt then
 470 =y[count]
 endif
 if y[count] 5 le then
 7 =y[count]
 endif
 color y[count] x[count]
; inline vga_point
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
   if push.4 then 8 shl endif
   out[vga_data] 
	push.4 1 shl 
	4 bor out[vga_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline vga_point

 0 =neighbor
 if y[count] 1 add x[count] 1 add
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if y[count] 1 add x[count] 1 sub
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if y[count] 1 sub x[count] 1 add
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if y[count] 1 sub x[count] 1 sub
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if y[count] x[count] 1 add
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if y[count] x[count] 1 sub
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if y[count] 1 sub x[count]
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if y[count] 1 add x[count]
; inline vga_read
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
	5 out[vga_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
	1 out[vga_cntl] 
   if push.4 then 8 shr endif
; end inline vga_read
 white eq
 then neighbor 1 add =neighbor endif
 if neighbor 0 gt
 then
 white y[count] x[count]
; inline vga_point
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
   if push.4 then 8 shl endif
   out[vga_data] 
	push.4 1 shl 
	4 bor out[vga_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline vga_point

 agg_count 1 add dup =agg_count out[LEDred]
 shared_count_no
; inline sram_read
	out[sram_addr]
	5 out[sram_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline sram_read
 1 add
 shared_count_no
; inline sram_write
	out[sram_addr]
	out[sram_data]
	12 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
	nop. 
; end inline sram_write

 while mem_lock
; inline mutex_test_set
	out[sram_addr]
	17 out[sram_cntl] 
   while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline mutex_test_set
 do endwhile
 shared_count
; inline sram_read
	out[sram_addr]
	5 out[sram_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline sram_read
 1 add shared_count
; inline sram_write
	out[sram_addr]
	out[sram_data]
	12 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
	nop. 
; end inline sram_write

 mem_lock
; inline mutex_clear
	out[sram_addr]
	65 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline mutex_clear

 if y[count] ymax lt then y[count] 20 sub =ymax endif
 count rand_bit 127 mul add
 rand_bit 63 mul add
 rand_bit 31 mul add
 511 band 60 add =x[count]
 ymax =y[count]
 if ymax 10 lt then 0 not_done
; inline sram_write
	out[sram_addr]
	out[sram_data]
	12 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
	nop. 
; end inline sram_write
 endif
 if in[cpu_id] 1 eq
 then
 shared_count
; inline sram_read
	out[sram_addr]
	5 out[sram_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline sram_read
 green 42 20 vga_puthex
 endif
 endif
 count 1 add =count
 endwhile
 endwhile
 if in[cpu_id] 2 eq
 then
 cpu2_lock
; inline mutex_clear
	out[sram_addr]
	65 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline mutex_clear

 endif
 if in[cpu_id] 3 eq
 then
 cpu3_lock
; inline mutex_clear
	out[sram_addr]
	65 out[sram_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline mutex_clear

 endif
 if in[cpu_id] 1 eq
 then
 while cpu2_lock
; inline mutex_read
	out[sram_addr]
	33 out[sram_cntl] 
   while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline mutex_read
 do endwhile
 while cpu3_lock
; inline mutex_read
	out[sram_addr]
	33 out[sram_cntl] 
   while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline mutex_read
 do endwhile
 shared_count
; inline sram_read
	out[sram_addr]
	5 out[sram_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline sram_read
 green 42 20 vga_puthex
 shared_count_no
; inline sram_read
	out[sram_addr]
	5 out[sram_cntl] 
	while in[sync] not do endwhile 
	in[sram_data]
   1 out[vga_cntl]
; end inline sram_read
 red 42 80 vga_puthex
 endif
 if in[cpu_id] 1 eq
 then
 "Cornell white 5 20 vga_putstr
 "ece5760 white 5 84 vga_putstr
 "count green 26 20 vga_putstr
 "count_low red 26 80 vga_putstr
 endif
 while forever do endwhile
 vga_puthex:
 =vga_puthex_x
 =vga_puthex_y
 =vga_puthex_color
 =vga_puthex_value
 5 =vga_puthex_count
 16 =vga_puthex_shift
 while vga_puthex_count 0 gt
 do
 vga_puthex_value vga_puthex_shift shr 15 band
 if dup 10 lt
 then zero add
 else 10 sub a add
 endif
 vga_puthex_color vga_puthex_y vga_puthex_x
 vga_putchar
 vga_puthex_count 1 sub =vga_puthex_count
 vga_puthex_shift 4 sub =vga_puthex_shift
 vga_puthex_x 8 add =vga_puthex_x
 endwhile
 return
 vga_putstr:
 =vga_putstr_x
 =vga_putstr_y
 =vga_putstr_color
 =vga_putstr_count
 while vga_putstr_count 0 gt
 do
 vga_putstr_color vga_putstr_y vga_putstr_x
 vga_putchar
 vga_putstr_x 8 add =vga_putstr_x
 vga_putstr_count 1 sub =vga_putstr_count
 endwhile
 return
 vga_putchar:
 pop.8
 pop.9
 pop.6
 4 shl pop.7
 0 pop.11
 while push.11 16 lt
 do
 push.7 push.11 add out[rom_addr]
 0 pop.10
 while push.10 8 lt
 do
 if in[rom_data] push.10 shl 128 band
 then push.6 else black endif
 push.9 push.11 add
 push.8 push.10 add

; inline vga_point
   dup
   1 band pop.4 
   1 shr pop.5 
   9 shl
   push.5 bor out[vga_addr]
   if push.4 then 8 shl endif
   out[vga_data] 
	push.4 1 shl 
	4 bor out[vga_cntl] 
   while in[sync] not do endwhile 
   1 out[vga_cntl]
; end inline vga_point

 push.10 1 add pop.10
 endwhile
 push.11 1 add pop.11
 endwhile
 return
 rand_bit:
 rand2 dup 11 shl bxor 17 shr =temp
 rand 17 shr rand2 1 shl bor =rand2
 rand 1 shl temp bor dup =rand
 1 band 1 shl 1 sub
 return
