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

	imprimirMenu:
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
		ldr r8, =eleccion
		ldr r8, [r8]
		cmp r8, #1
		beq siVueltaDer
		cmpne r8, #2
		beq siVueltaIzq
		cmpne r8, #3
		beq siVueltaDerMedia
		/*cmpne r8, #4
		beq fin*/
		bne Num_Mal

	Num_Mal:
		ldr r0,=mal
		bl puts
		bl getchar @para que borre la informacion del buffer de teclado
		b imprimirMenu

	siVueltaDer:
		bl loopDerecha
		/*sub r10, r10, #1
		cmp r10, #0
		bne siVueltaDer
		movne r1, r10
		ldr r0, =formato
		bl printf
		b siVueltaDer*/
		b imprimirMenu

	siVueltaIzq:
		bl loopIzquierda
		/*sub r10, r10, #1
		cmp r10, #0
		bne siVueltaDer
		movne r1, r10
		ldr r0, =formato
		bl printf
		b siVueltaIzq*/
		b imprimirMenu

	siVueltaDerMedia:
		bl MediaDerecha
		/*sub r10, r10, #1
		cmp r10, #0
		bne siVueltaDer
		movne r1, r10
		ldr r0, =formato
		bl printf
		b siVueltaDer*/
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
	mensaje_ingreso: .asciz "Elija una opcion\n1. Vuelta Derecha\n2. Vuelta Izquierda\n3. Velocidad Lento\n4. Velocidad Media\n5. Velocidad Alta"
	eleccion: .word 0
	formato: .asciz "%d\n"
	entrada: .asciz "%d"
	mal: 	 .asciz "Ingreso incorrecto!!\n"
	despedida:    .asciz "\nMuchas gracias por utilizar el motor!\n\tHasta luego"
	led1: 	 .asciz "La led se encendio 1 segundo!!\n"
	led2: 	 .asciz "La led se encendio 2 segundos!!\n"
	led4: 	 .asciz "La led se encendio 4 segundos!!\n"
.global myloc
myloc: .word 0

 .end


