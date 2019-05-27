/*-Maria Ines Vasquez Figueroa 18250
  -Diana Ximena de Leon Figueroa 18607
  -Paula Camila Gonzalez Ortega 18398
  Programa que pide si seguir o no seguir dandole vueltas al motor*/

 .text
 .align 2
 .global main
 .type main,%function
main:
	stmfd sp!, {lr}	@@ SP = R13 link register

	mov r10, #250
	mov r11, #0
	mov r6, #0
	@utilizando la biblioteca GPIO (gpio0_2.s)
	bl GetGpioAddress @solo se llama una vez
	@GPIO para lectura (entrada) puerto 18 del boton cambiar direccion
	mov r0,#18
	mov r1,#0
	bl SetGpioFunction 

	@GPIO para lectura (entrada) puerto 15 del boton dismiuir velocidad
	mov r0,#15
	mov r1,#0
	bl SetGpioFunction

	@GPIO para lectura (entrada) puerto 14 del boton aumentar velocidad
	mov r0,#14
	mov r1,#0
	bl SetGpioFunction

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

	mov r8,#3
	

	//Empiezan todas apagadas
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

	modo:
		ldr r0, =formato
		bl printf
		ldr r0,=mensaje_modo
		bl puts
		ldr r0,=entrada
		ldr r1,=eleccion
		bl scanf
		cmp r0, #0
		beq Num_Mal
		ldr r9, =eleccion
		ldr r9, [r9]
		cmp r9, #1
		beq imprimirMenu
		cmpne r9, #2
		moveq r6, #1
		beq hardwaremode
		bne modo


	hardwaremode:
		mov r10, #250
		mov r6, #1
		bl retro
		mov r0, #15
		bl GetGpio
		teq r0, #0
		bne disminuir
		bl retro
		mov r0, #14
		bl GetGpio
		teq r0, #0
		bne aumentar
		bl retro
		mov r0, #18
		bl GetGpio
		teq r0, #0
		bne cambiodireccion
		bl retro
		b hardwaremode
	

	imprimirMenu:
		mov r6, #0
		mov r10, #250
		mov r1, r10
		ldr r0, =formato
		bl printf
		ldr r0,=mensaje_ingreso
		bl puts
		@ ingreso de datos
		@ r0 contiene formato de ingreso
		@ r1 contiene direccion donde almacena dato leido
		ldr r0,=entrada
		ldr r1,=eleccion
		bl scanf
		@@ Verifica que sea un numero
		cmp r0, #0
		beq Num_Mal

	verOpcion:
		/*Se evalua que numero ingreso*/
		ldr r9, =eleccion
		ldr r9, [r9]
		cmp r9, #1
		beq cambiodireccion
		cmp r9, #2
		beq aumentar
		cmp r9, #3
		beq disminuir
		cmp r9, #4
		beq fin
		bne Num_Mal
		evaluar:
		//mov r10, #250
		cmp r11, #0
		beq opcionderecha
		cmp r11, #1
		beq opcionizquierda
		

	aumentar:
		cmp r8, #6
		addlt r8, r8, #1
		b evaluar

	disminuir:
		cmp r8, #2
		subgt r8, r8, #1
		b evaluar

	cambiodireccion:
		cmp r11, #0
		moveq r11, #1
		movne r11, #0
		b evaluar

	opcionderecha:
		cmp r8, #4
		beq inicioRight
		cmp r8, #3
		beq bajaRight
		cmp r8, #2
		beq tortugaRight
		cmp r8, #5
		beq rapidaRight
		cmp r8, #6
		beq flashRight
		b imprimirMenu


	opcionizquierda:
		cmp r8, #4
		beq inicioLeft
		cmp r8, #3
		beq bajaLeft
		cmp r8, #2
		beq tortugaLeft
		cmp r8, #5
		beq rapidaLeft
		cmp r8, #6
		beq flashLeft
		b imprimirMenu

	Num_Mal:
		ldr r0,=mal
		bl puts
		bl getchar @para que borre la informacion del buffer de teclado
		b imprimirMenu

	inicioRight:
		bl vel3Right
		sub r10, r10, #1
		cmp r10, #0
		bne inicioRight
		b imprimirMenu
		
	bajaRight:
		bl vel4Right
		sub r10, r10, #1
		cmp r10, #0
		bne bajaRight
		b imprimirMenu

	tortugaRight:
		bl vel5Right
		sub r10, r10, #1
		cmp r10, #0
		bne tortugaRight
		b imprimirMenu

	rapidaRight:
		bl vel2Right
		sub r10, r10, #1
		cmp r10, #0
		bne rapidaRight
		b imprimirMenu

	flashRight:
		bl vel1Right
		sub r10, r10, #1
		cmp r10, #0
		bne flashRight
		b imprimirMenu

	inicioLeft:
		bl vel3Left
		sub r10, r10, #1
		cmp r10, #0
		bne inicioLeft
		b imprimirMenu
		

	bajaLeft:
		bl vel4Left
		sub r10, r10, #1
		cmp r10, #0
		bne bajaLeft
		b imprimirMenu

	tortugaLeft:
		bl vel5Left
		sub r10, r10, #1
		cmp r10, #0
		bne tortugaLeft
		b imprimirMenu

	rapidaLeft:
		bl vel2Left
		sub r10, r10, #1
		cmp r10, #0
		bne rapidaLeft
		b imprimirMenu

	flashLeft:
		bl vel1Left
		sub r10, r10, #1
		cmp r10, #0
		bne flashLeft
		b imprimirMenu
		


	/* salida correcta */
	fin:
		ldr r0, =despedida
		bl puts
		mov r0, #0
		mov r3, #0
		ldmfd sp!, {lr}	/* R13 = SP */
		bx lr


 .data
 .align 2
	mensaje_ingreso: .asciz "Elija una opcion\n1. Cambiar direccion\n2. Aumentar \n3. Disminuir\n4. Salir"
	mensaje_modo: .asciz "Elija una opcion\n1. Control con software \n2. Control con hardware"
	
	eleccion: .word 0
 	entrada: .asciz "%d"
 	formato: .asciz "%d\n"
	mal: 	 .asciz "Ingreso incorrecto!!\n"
	despedida:    .asciz "\nMuchas gracias por utilizar el motor!\n\tHasta luego"
	presiona: .asciz "Presiono boton"
.global myloc
myloc: .word 0

 .end


