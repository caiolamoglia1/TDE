# PROGRAMA: ORDENAÇÃO SUPER FÁCIL EM ~100 LINHAS
# Ordena 6 números: 4, 3, 9, 5, 2, 1
# Usa apenas comparações simples - muito fácil!

.data
    a: .word 4    # primeiro número
    b: .word 3    # segundo número  
    c: .word 9    # terceiro número
    d: .word 5    # quarto número
    e: .word 2    # quinto número
    f: .word 1    # sexto número
    
    msg1: .asciiz "Original: 4 3 9 5 2 1\n"
    msg2: .asciiz "Ordenado: "
    espaco: .asciiz " "
    quebra: .asciiz "\n"

.text
.globl main

main:
    # Mostra números originais
    li $v0, 4
    la $a0, msg1
    syscall
    
    # Carrega os 6 números nos registradores
    lw $t0, a    # $t0 = 4
    lw $t1, b    # $t1 = 3
    lw $t2, c    # $t2 = 9
    lw $t3, d    # $t3 = 5
    lw $t4, e    # $t4 = 2
    lw $t5, f    # $t5 = 1
    
    # ORDENAÇÃO SUPER SIMPLES: Troca se primeiro > segundo
    # Fazemos várias passadas para garantir que tudo fica ordenado
    
    # PASSADA 1: Compara pares adjacentes
    # Compara $t0 e $t1
    ble $t0, $t1, skip1
    move $t6, $t0    # troca
    move $t0, $t1
    move $t1, $t6
skip1:
    # Compara $t1 e $t2  
    ble $t1, $t2, skip2
    move $t6, $t1
    move $t1, $t2
    move $t2, $t6
skip2:
    # Compara $t2 e $t3
    ble $t2, $t3, skip3
    move $t6, $t2
    move $t2, $t3
    move $t3, $t6
skip3:
    # Compara $t3 e $t4
    ble $t3, $t4, skip4
    move $t6, $t3
    move $t3, $t4
    move $t4, $t6
skip4:
    # Compara $t4 e $t5
    ble $t4, $t5, skip5
    move $t6, $t4
    move $t4, $t5
    move $t5, $t6
skip5:

    # PASSADA 2: Repete para garantir ordenação
    ble $t0, $t1, skip6
    move $t6, $t0
    move $t0, $t1
    move $t1, $t6
skip6:
    ble $t1, $t2, skip7
    move $t6, $t1
    move $t1, $t2
    move $t2, $t6
skip7:
    ble $t2, $t3, skip8
    move $t6, $t2
    move $t2, $t3
    move $t3, $t6
skip8:
    ble $t3, $t4, skip9
    move $t6, $t3
    move $t3, $t4
    move $t4, $t6
skip9:
    ble $t4, $t5, skip10
    move $t6, $t4
    move $t4, $t5
    move $t5, $t6
skip10:

    # PASSADA 3: Mais uma vez para ter certeza
    ble $t0, $t1, skip11
    move $t6, $t0
    move $t0, $t1
    move $t1, $t6
skip11:
    ble $t1, $t2, skip12
    move $t6, $t1
    move $t1, $t2
    move $t2, $t6
skip12:
    ble $t2, $t3, skip13
    move $t6, $t2
    move $t2, $t3
    move $t3, $t6
skip13:
    ble $t3, $t4, skip14
    move $t6, $t3
    move $t3, $t4
    move $t4, $t6
skip14:
    ble $t4, $t5, skip15
    move $t6, $t4
    move $t4, $t5
    move $t5, $t6
skip15:

    # PASSADA 4: Última passada 
    ble $t0, $t1, skip16
    move $t6, $t0
    move $t0, $t1
    move $t1, $t6
skip16:
    ble $t1, $t2, skip17
    move $t6, $t1
    move $t1, $t2
    move $t2, $t6
skip17:
    ble $t2, $t3, skip18
    move $t6, $t2
    move $t2, $t3
    move $t3, $t6
skip18:
    ble $t3, $t4, skip19
    move $t6, $t3
    move $t3, $t4
    move $t4, $t6
skip19:
    ble $t4, $t5, imprimir
    move $t6, $t4
    move $t4, $t5
    move $t5, $t6

imprimir:
    # Mostra resultado
    li $v0, 4
    la $a0, msg2
    syscall
    
    # Imprime os números ordenados
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t4
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    move $a0, $t5
    syscall
    
    # Quebra de linha e termina
    li $v0, 4
    la $a0, quebra
    syscall
    
    li $v0, 10
    syscall
