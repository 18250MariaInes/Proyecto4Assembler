.global vel1Left, vel2Left, vel3Left, vel4Left, vel5Left

vel1Left:
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

		//Dobles pasos
		mov r0,#13		@se enciende el 13 y 6
		mov r1,#1
		bl SetGpio

		mov r0,#6		
		mov r1,#1
		bl SetGpio
		
		bl retro
		
		mov r0,#6		@se apaga el 6
		mov r1,#0
		bl SetGpio
		
		mov r0,#19		@se encienden el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		
		mov r0,#13		@se apaga el 13
		mov r1,#0
		bl SetGpio
		bl retro

		mov r0,#26		@se enciende el 26 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		
		mov r0,#19		@se apaga el 19
		mov r1,#0
		bl SetGpio
		bl retro

		mov r0,#6		@se enciende el 6 y 26
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


vel2Left:
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

		//Dobles pasos
		mov r0,#13		@se enciende el 13 y 6
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
		
		mov r0,#19		@se encienden el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		
		mov r0,#13		@se apaga el 13
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro

		mov r0,#26		@se enciende el 26 y 19
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

		mov r0,#6		@se enciende el 6 y 26
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


vel3Left:
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

		//Dobles pasos
		mov r0,#13		@se enciende el 13 y 6
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
		
		mov r0,#19		@se encienden el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		
		mov r0,#13		@se apaga el 13
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#26		@se enciende el 26 y 19
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

		mov r0,#6		@se enciende el 6 y 26
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

vel4Left:
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

		//Dobles pasos
		mov r0,#13		@se enciende el 13 y 6
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
		
		mov r0,#19		@se encienden el 13 y 19
		mov r1,#1
		bl SetGpio

		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		
		mov r0,#13		@se apaga el 13
		mov r1,#0
		bl SetGpio
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro
		bl retro

		mov r0,#26		@se enciende el 26 y 19
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

		mov r0,#6		@se enciende el 6 y 26
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

vel5Left:
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

		//Dobles pasos
		mov r0,#13		@se enciende el 13 y 6
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
		
		mov r0,#19		@se encienden el 13 y 19
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
		
		mov r0,#13		@se apaga el 13
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

		mov r0,#26		@se enciende el 26 y 19
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

		mov r0,#6		@se enciende el 6 y 26
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
