.text
 .align 2
 .global main
main:
	@utilizando la biblioteca GPIO (gpio0_2.s)
	bl GetGpioAddress @solo se llama una vez
	
	@GPIO para lectura (entrada) puerto 26 
	mov r0,#26
	mov r1,#1
	bl SetGpioFunction

	@GPIO para escritura (salida) puerto 19
	mov r0,#19
	mov r1,#1
	bl SetGpioFunction

	@GPIO para escritura (salida) puerto 13
	mov r0,#13
	mov r1,#1
	bl SetGpioFunction

	@GPIO para escritura (salida) puerto 6
	mov r0,#6
	mov r1,#1
	bl SetGpioFunction

	

loopRight:

	@Apagar GPIO 26
	mov r0,#26
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 19
	mov r0,#19
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 13
	mov r0,#13
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 6
	mov r0,#6
	mov r1,#0
	bl SetGpio

	b encenderRight

/*loopLeft:
	@Apagar GPIO 26
	mov r0,#26
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 19
	mov r0,#19
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 13
	mov r0,#13
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 6
	mov r0,#6
	mov r1,#0
	bl SetGpio


	b encenderLeft*/

encenderRight:
	mov r0,#26		@se enciende el 26 y 6
	mov r1,#1
	bl SetGpio

	mov r0,#6		
	mov r1,#1
	bl SetGpio
	
	bl wait
	
	mov r0,#6		@se apaga el 6
	mov r1,#0
	bl SetGpio
	
	mov r0,#19		@se encienden el 26 y 19
	mov r1,#1
	bl SetGpio

	bl wait
	
	mov r0,#26		@se apaga el 26
	mov r1,#0
	bl SetGpio
	bl wait

	mov r0,#13		@se enciende el 13 y 19
	mov r1,#1
	bl SetGpio

	bl wait
	
	mov r0,#19		@se apaga el 19
	mov r1,#0
	bl SetGpio
	bl wait

	mov r0,#6		@se enciende el 6 y 13
	mov r1,#1
	bl SetGpio
	bl wait



	b loopRight  @Se apagan todos

/*encenderLeft:
	mov r0,#13		@se enciende el 13 y 6
	mov r1,#1
	bl SetGpio

	mov r0,#6		
	mov r1,#1
	bl SetGpio
	
	bl wait
	
	mov r0,#6		@se apaga el 6
	mov r1,#0
	bl SetGpio
	
	mov r0,#19		@se encienden el 13 y 19
	mov r1,#1
	bl SetGpio

	bl wait
	
	mov r0,#13		@se apaga el 13
	mov r1,#0
	bl SetGpio
	bl wait

	mov r0,#26		@se enciende el 26 y 19
	mov r1,#1
	bl SetGpio

	bl wait
	
	mov r0,#19		@se apaga el 19
	mov r1,#0
	bl SetGpio
	bl wait

	mov r0,#6		@se enciende el 6 y 26
	mov r1,#1
	bl SetGpio
	bl wait*/

	@ loopLeft  @Se apagan todos

@ brief pause routine
wait:
 mov r0, #0x0200000 @ big number
sleepLoop:
 subs r0,#1
 bne sleepLoop @ loop delay
 mov pc,lr

 .data
 .align 2
.global myloc
myloc: .word 0

 .end
