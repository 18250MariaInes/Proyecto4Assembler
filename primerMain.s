@ Basado en el curso de la U. de Cambridge de Alex Chadwick
@ lab13_GPIO.s enciende 3 leds en secuencia al presionar un boton
@ Funciona con cualquier puerto, utilizando biblioteca gpio0_2.s

 .text
 .align 2
 .global main
main:
	@utilizando la biblioteca GPIO (gpio0_2.s)
	bl GetGpioAddress @solo se llama una vez
	mov r10, #0  @Contador para ciclo

	@GPIO para lectura (entrada) puerto 14 del boton
	mov r0,#14
	mov r1,#0
	bl SetGpioFunction

	@GPIO para lectura (entrada) puerto 15 del boton
	mov r0,#15
	mov r1,#0
	bl SetGpioFunction

	@prueba led 
	mov r0,#21
	mov r1,#1
	bl SetGpioFunction

	/*PUERTOS DEL MOTOR*/
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

loop:
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

	mov r0,#21
	mov r1,#0
	bl SetGpio

	@loop:
	@Revision del boton
	@Para revisar si el nivel de un GPIO esta en alto o bajo 
	@se lee en la direccion 0x3F200034 para los GPIO 0-31

	mov r0, #14
	bl GetGpio
	@Si el boton esta en alto (1), fue presionado y enciende los leds
	teq r0,#0 			@es lo mismo que un CMP
	bne encender
	b loop

encender:

	mov r0,#26		@se enciende el 26 y 6
	mov r1,#1
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar

	mov r0,#6		
	mov r1,#1
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar

	mov r0,#6		@se apaga el 6
	mov r1,#0
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar

	mov r0,#19		@se encienden el 26 y 19
	mov r1,#1
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar

	mov r0,#26		@se apaga el 26
	mov r1,#0
	bl SetGpio
	mov r0, #15   @se revisa el boton
    bl GetGpio 
	bl retro
	cmp r0,#0
	bne apagar

	mov r0,#13		@se enciende el 13 y 19
	mov r1,#1
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar

	mov r0,#19		@se apaga el 19
	mov r1,#0
	bl SetGpio
	
	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar
	
	mov r0,#6		@se enciende el 6 y 13
	mov r1,#1
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar
	
	@Apagar GPIO 26
	mov r0,#26
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 19
	mov r0,#19
	mov r1,#0
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar

	@Apagar GPIO 13
	mov r0,#13
	mov r1,#0
	bl SetGpio
	@Apagar GPIO 6
	mov r0,#6
	mov r1,#0
	bl SetGpio

	bl retro
	mov r0, #15   @se revisa el boton
    bl GetGpio
	cmp r0,#0
	bne apagar
	
	b encender

revisar:
	mov r0, #15   @se revisa el boton
	bl GetGpio
	cmp r0,#0
	bne apagar
	b encender

apagar:
	
	@prueba led
	mov r0,#21
	mov r1,#1
	bl SetGpio

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

	mov r0, #14
	bl GetGpio
	@Si el boton esta en alto (1), fue presionado y enciende los leds
	teq r0,#0 			@es lo mismo que un CMP
	bne encender
	
	b apagar

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
