.global vel1Right, vel2Right, vel3Right, vel4Right, vel5Right

vel1Right:
	push {lr}
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
		//dobles pasos
		mov r0,#26		@se enciende el 26 y 6
		mov r1,#1
		bl SetGpio

		mov r0,#6		
		mov r1,#1
		bl SetGpio
		
		bl retro
		
		mov r0,#6		@se apaga el 6
		mov r1,#0
		bl SetGpio
		
		mov r0,#19		@se encienden el 26 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		
		mov r0,#26		@se apaga el 26
		mov r1,#0
		bl SetGpio
		bl retro

		mov r0,#13		@se enciende el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		
		mov r0,#19		@se apaga el 19
		mov r1,#0
		bl SetGpio
		bl retro

		mov r0,#6		@se enciende el 6 y 13
		mov r1,#1
		bl SetGpio
		bl retro
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
		pop {pc}


vel2Right:
	push {lr}
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
		//dobles pasos
		mov r0,#26		@se enciende el 26 y 6
		mov r1,#1
		bl SetGpio

		mov r0,#6		
		mov r1,#1
		bl SetGpio
		
		bl retro
		bl retro
		bl retro
		
		mov r0,#6		@se apaga el 6
		mov r1,#0
		bl SetGpio
		
		mov r0,#19		@se encienden el 26 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		mov r0,#26		@se apaga el 26
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro

		mov r0,#13		@se enciende el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		
		mov r0,#19		@se apaga el 19
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro

		mov r0,#6		@se enciende el 6 y 13
		mov r1,#1
		bl SetGpio
		bl retro
		bl retro
		bl retro
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
		pop {pc}


vel3Right:
	push {lr}
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
		//dobles pasos
		mov r0,#26		@se enciende el 26 y 6
		mov r1,#1
		bl SetGpio

		mov r0,#6		
		mov r1,#1
		bl SetGpio
		
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		
		mov r0,#6		@se apaga el 6
		mov r1,#0
		bl SetGpio
		
		mov r0,#19		@se encienden el 26 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		mov r0,#26		@se apaga el 26
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#13		@se enciende el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		
		mov r0,#19		@se apaga el 19
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#6		@se enciende el 6 y 13
		mov r1,#1
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
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
		pop {pc}


vel4Right:
	push {lr}
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
		//dobles pasos
		mov r0,#26		@se enciende el 26 y 6
		mov r1,#1
		bl SetGpio

		mov r0,#6		
		mov r1,#1
		bl SetGpio
		
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		mov r0,#6		@se apaga el 6
		mov r1,#0
		bl SetGpio
		
		mov r0,#19		@se encienden el 26 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		mov r0,#26		@se apaga el 26
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#13		@se enciende el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		
		mov r0,#19		@se apaga el 19
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#6		@se enciende el 6 y 13
		mov r1,#1
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
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
		pop {pc}

vel5Right:
	push {lr}
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
		//dobles pasos
		mov r0,#26		@se enciende el 26 y 6
		mov r1,#1
		bl SetGpio

		mov r0,#6		
		mov r1,#1
		bl SetGpio
		
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		mov r0,#6		@se apaga el 6
		mov r1,#0
		bl SetGpio
		
		mov r0,#19		@se encienden el 26 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		
		mov r0,#26		@se apaga el 26
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#13		@se enciende el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		
		mov r0,#19		@se apaga el 19
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#6		@se enciende el 6 y 13
		mov r1,#1
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
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
		pop {pc}

