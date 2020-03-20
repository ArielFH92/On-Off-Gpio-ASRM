@--- Mi Primer Programa ensamblador
@--- Sección de Datos

.data
.balign 4
pin: .int 7
OUTPUT = 1

.align 2
msj:
.asciz "LED ROJO APAGADO"

@--- Variable Globales
.text
.global main
.extern printf
.extern wiringPiSetup
.extern pinMode

main: push {ip,lr}
	ldr r0, =msj
	bl puts
	bl wiringPiSetup
	ldr r0, =pin
	ldr r0, [r0]
	mov r1, #OUTPUT
	bl pinMode
	@digitalWrite(pin, 0)
	ldr r0, =pin
	ldr r0, [r0]
	mov r1, #0
	bl digitalWrite
pop {ip,pc}
