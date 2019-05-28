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

	mov r10, #250  @@contador para que stepper de media vuelta
	mov r11, #0  @Deterina direccion actual del stepper  0: Derecha   1: Izquierda
	mov r6, #0    @@Modo seleccionado para controlar 1: Hardware  0: Software
	bl GetGpioAddress 
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

	@GPIO para lectura (entrada) puerto 21 del boton  velocida tortuga
	mov r0,#21
	mov r1,#0
	bl SetGpioFunction

	@GPIO para lectura (entrada) puerto 20 del boton velocidad lenta
	mov r0,#20
	mov r1,#0
	bl SetGpioFunction

	@GPIO para lectura (entrada) puerto 16 del boton velocidad normal
	mov r0,#16
	mov r1,#0
	bl SetGpioFunction

	@GPIO para lectura (entrada) puerto 07 del boton velocidad rapida 
	mov r0,#7
	mov r1,#0
	bl SetGpioFunction

	@GPIO para lectura (entrada) puerto 08 del boton velocidad flash
	mov r0,#8
	mov r1,#0
	bl SetGpioFunction

	@GPIO para lectura (entrada) puerto 23 del boton apagar
	mov r0,#23
	mov r1,#0
	bl SetGpioFunction

	@GPIO para escritura (salida) puerto 25 para LED
	mov r0,#25
	mov r1,#1
	bl SetGpioFunction

	/*PUERTOS DEL STEPPER*/

	@GPIO para escritura (salida) puerto 26 
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
  
	mov r8,#3    @Controlador de velocidad del stepper de 0 a 5, donde 3 es la velocidad intermedia
	

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
	@Apagar GPIO 25 LED
	mov r0,#25
	mov r1,#0
	bl SetGpio

	modo:
		@Se elije software o hardware
		ldr r0, =formato
		bl printf
		ldr r0,=mensaje_modo
		bl puts
		ldr r0,=entrada
		ldr r1,=eleccion
		bl scanf
		cmp r0, #0  @Se verifica que la opcion sea correcta
		beq Num_Mal      
		ldr r9, =eleccion    @@Se evalua la opcion
		ldr r9, [r9]
		cmp r9, #1
		moveq r6, #0
		beq imprimirMenu    @@Si eljie software se imprime el menu
		cmpne r9, #2
		moveq r6, #1
		beq hardwaremode    @@Si elije hardware se permite presionar los botones
		bne modo


	hardwaremode:
		@Encender LED para que presione boton
		mov r0,#25
		mov r1,#1
		bl SetGpio
		mov r10, #250
		mov r6, #1     @Se establece 1 en r6 para saber que esta en modo hardware
		bl retro
		@@Se evalua que puerto presiono y se ejecuta la opcion seleccionada
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
		mov r0, #23
		bl GetGpio
		teq r0, #0
		bne fin
		bl retro
		mov r0, #21
		bl GetGpio
		teq r0, #0
		movne r8,#2
		bne evaluar
		bl retro
		mov r0, #20
		bl GetGpio
		teq r0, #0
		movne r8,#3
		bne evaluar
		bl retro
		mov r0, #16
		bl GetGpio
		teq r0, #0
		movne r8,#4
		bne evaluar
		bl retro
		mov r0, #7
		bl GetGpio
		teq r0, #0
		movne r8,#5
		bne evaluar
		bl retro
		mov r0, #8
		bl GetGpio
		teq r0, #0
		movne r8,#6
		bne evaluar
		bl retro
		b hardwaremode   @Se repite el ciclo
	

	imprimirMenu:
		mov r6, #0   @Se establece r6 con 0 para modo software
		mov r10, #250
		/*mov r1, r10
		ldr r0, =formato
		bl printf*/
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
		/*Se evalua que numero ingreso y se ejecuta la opcioin seleccionada*/
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
		@Apagar LED
		mov r0,#25
		mov r1,#0
		bl SetGpio
		//mov r10, #250
		@Se evalua que direccion actualmente va el stepper
		cmp r11, #0
		beq opcionderecha
		cmp r11, #1
		beq opcionizquierda
	
	

	aumentar:
		@Incrementa la velocidad actual
		cmp r8, #6
		addlt r8, r8, #1
		b evaluar

	disminuir:
		@Disminuye la velocidad del stepper
		cmp r8, #2
		subgt r8, r8, #1
		b evaluar

	cambiodireccion:
		@Switch de la direccion a la que el stepper gira
		cmp r11, #0
		moveq r11, #1
		movne r11, #0
		b evaluar

	opcionderecha:
		@Se evalua la velocidad actual para ejecutarla girando hacia la derecha
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
		b comparar


	opcionizquierda:
		@Se evalua la velocidad actual para ejecutarla girando hacia la Izquierda
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
		b comparar

	Num_Mal:
		ldr r0,=mal
		bl puts
		bl getchar @para que borre la informacion del buffer de teclado
		b imprimirMenu

	inicioRight:
		@Giro predeterminado hacia derecha velocidad medida
		bl vel3Right
		sub r10, r10, #1
		cmp r10, #0
		bne inicioRight
		beq comparar
		
	bajaRight:
		bl vel4Right
		sub r10, r10, #1
		cmp r10, #0
		bne bajaRight
		b comparar

	tortugaRight:
		bl vel5Right
		sub r10, r10, #1
		cmp r10, #0
		bne tortugaRight
		b comparar

	rapidaRight:
		bl vel2Right
		sub r10, r10, #1
		cmp r10, #0
		bne rapidaRight
		b comparar

	flashRight:
		bl vel1Right
		sub r10, r10, #1
		cmp r10, #0
		bne flashRight
		b comparar

	inicioLeft:
		bl vel3Left
		sub r10, r10, #1
		cmp r10, #0
		bne inicioLeft
		b comparar
		

	bajaLeft:
		bl vel4Left
		sub r10, r10, #1
		cmp r10, #0
		bne bajaLeft
		b comparar

	tortugaLeft:
		bl vel5Left
		sub r10, r10, #1
		cmp r10, #0
		bne tortugaLeft
		b comparar

	rapidaLeft:
		bl vel2Left
		sub r10, r10, #1
		cmp r10, #0
		bne rapidaLeft
		b comparar

	flashLeft:
		bl vel1Left
		sub r10, r10, #1
		cmp r10, #0
		bne flashLeft
		b comparar
		
	comparar:
		@@Compara en que modo se esta ejcutando el Programa
		cmp r6, #0
		beq imprimirMenu
		cmp r6,#1
		beq hardwaremode

	/* salida correcta */
	fin:
		@Apagar LED
		mov r0,#25
		mov r1,#0
		bl SetGpio
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


