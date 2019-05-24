@ -----------------------------------
@ Universidad del Valle de Guatemala
@ Taller de Assembler 2016
@ Christian Medina Armas
@ Sample code to demonstate the use
@ of the timeLib.c libary
@ ----------------------------------
@ Build:
@ gcc -o timer timeLib.c timer.s 
@ -----------------------------------

.global retro
.data
.balign 4
int:     .asciz "%d"
newLine: .asciz "\n"
f_cycles:.asciz "\nExec stats: timer.s\nProcessor Cycles:\t%f\n"
f_hertz: .asciz "Hertz:\t\t\t%f\n"
f_sec:   .asciz "Seconds:\t\t%f\n" 
start:   .word 0
cycles:  .word 0
delayReg:.word 0x000FFFFF
@0x281EEEEE un seg

.text
.align 2

@ ---------------------------
@ Delay function
@ Input: r0 delay counter val
@ ---------------------------
delay:
    mov r7,#0

    b compare
loop:
    add r7,#1     @r7++
compare:
    cmp r7,r0     @test r7 == r0
    bne loop

   mov pc,lr

@ ---------------------------
@ Retro function
@ Input:
@ Output: seconds
@ ---------------------------
retro:
    push {lr}
    # get CYCLES_PER_SEC 
    bl  getCPS
    mov r5,r0    

    # store START time
    bl getCycles
    ldr r1,=start
    str r0,[r1]

    # call delay funtcion
    ldr r8,=delayReg
    ldr r0,[r8]	
    bl delay    

    # get END time
    bl getCycles

    # END - START
    ldr r1,=start
    ldr r1,[r1]
    sub r2,r0,r1

    # CYCLES = END-START
    ldr r3,=cycles
    str r2,[r3]

    # convert CYCLES to F32 
    vmov s0,r2
    vcvt.F32.S32 s0,s0 

    # get CYCLES_PER_SEC 
    bl   getCPS
    vmov s1,r0
    vcvt.F32.S32 s1,s1 

    # compute seconds
    vdiv.F32 s2,s0,s1
    
    vmov r0,s2	@seconds

    mov r0, #15   @se revisa el boton
    bl GetGpio
    pop {pc}

