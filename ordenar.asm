# PROGRAMA 1: ORDENAÇÃO SUPER SIMPLES
# Ordena 6 números usando selection sort básico
# Muito mais fácil de entender!

.data
    nums: .word 4, 3, 9, 5, 2, 1
    msg_original: .asciiz "Original: 4 3 9 5 2 1\n"
    msg_ordenado: .asciiz "Ordenado: "
    espaco: .asciiz " "
    quebra: .asciiz "\n"

.text
.globl main

main:
    # Mostra números originais
    li $v0, 4
    la $a0, msg_original
    syscall
    
    # Carrega endereço do array
    la $s0, nums
    
    # ORDENAÇÃO SIMPLES: Encontra o menor e coloca na primeira posição
    # Depois encontra o segundo menor e coloca na segunda posição, etc.
    
    # Posição 0: encontra o menor de todos
    jal encontra_menor_pos0
    
    # Posição 1: encontra o menor dos restantes
    jal encontra_menor_pos1
    
    # Posição 2: encontra o menor dos restantes
    jal encontra_menor_pos2
    
    # Posição 3: encontra o menor dos restantes
    jal encontra_menor_pos3
    
    # Posição 4: encontra o menor dos restantes
    jal encontra_menor_pos4
    
    # A posição 5 já está ordenada automaticamente
    
    j imprimir

# Encontra o menor número e coloca na posição 0
encontra_menor_pos0:
    lw $t1, 0($s0)   # nums[0]
    lw $t2, 4($s0)   # nums[1]
    lw $t3, 8($s0)   # nums[2]
    lw $t4, 12($s0)  # nums[3]
    lw $t5, 16($s0)  # nums[4]
    lw $t6, 20($s0)  # nums[5]
    
    li $t0, 0        # posição do menor
    move $t7, $t1    # menor valor
    
    # Compara com nums[1]
    blt $t2, $t7, menor_eh_1_pos0
    j testa_2_pos0
menor_eh_1_pos0:
    li $t0, 1
    move $t7, $t2
    
testa_2_pos0:
    # Compara com nums[2]
    blt $t3, $t7, menor_eh_2_pos0
    j testa_3_pos0
menor_eh_2_pos0:
    li $t0, 2
    move $t7, $t3
    
testa_3_pos0:
    # Compara com nums[3]
    blt $t4, $t7, menor_eh_3_pos0
    j testa_4_pos0
menor_eh_3_pos0:
    li $t0, 3
    move $t7, $t4
    
testa_4_pos0:
    # Compara com nums[4]
    blt $t5, $t7, menor_eh_4_pos0
    j testa_5_pos0
menor_eh_4_pos0:
    li $t0, 4
    move $t7, $t5
    
testa_5_pos0:
    # Compara com nums[5]
    blt $t6, $t7, menor_eh_5_pos0
    j troca_pos0
menor_eh_5_pos0:
    li $t0, 5
    move $t7, $t6
    
troca_pos0:
    # Troca nums[0] com nums[$t0]
    beq $t0, 0, fim_pos0    # se já está na posição 0, não troca
    sll $t8, $t0, 2         # $t0 * 4
    add $t8, $s0, $t8       # endereço de nums[$t0]
    lw $t9, 0($t8)          # valor em nums[$t0]
    sw $t1, 0($t8)          # nums[$t0] = nums[0]
    sw $t9, 0($s0)          # nums[0] = nums[$t0]
fim_pos0:
    jr $ra

# Encontra o menor número das posições 1-5 e coloca na posição 1
encontra_menor_pos1:
    lw $t1, 4($s0)   # nums[1]
    lw $t2, 8($s0)   # nums[2]
    lw $t3, 12($s0)  # nums[3]
    lw $t4, 16($s0)  # nums[4]
    lw $t5, 20($s0)  # nums[5]
    
    li $t0, 1        # posição do menor
    move $t7, $t1    # menor valor
    
    # Compara com nums[2]
    blt $t2, $t7, menor_eh_2_pos1
    j testa_3_pos1
menor_eh_2_pos1:
    li $t0, 2
    move $t7, $t2
    
testa_3_pos1:
    # Compara com nums[3]
    blt $t3, $t7, menor_eh_3_pos1
    j testa_4_pos1
menor_eh_3_pos1:
    li $t0, 3
    move $t7, $t3
    
testa_4_pos1:
    # Compara com nums[4]
    blt $t4, $t7, menor_eh_4_pos1
    j testa_5_pos1
menor_eh_4_pos1:
    li $t0, 4
    move $t7, $t4
    
testa_5_pos1:
    # Compara com nums[5]
    blt $t5, $t7, menor_eh_5_pos1
    j troca_pos1
menor_eh_5_pos1:
    li $t0, 5
    move $t7, $t5
    
troca_pos1:
    # Troca nums[1] com nums[$t0]
    beq $t0, 1, fim_pos1    # se já está na posição 1, não troca
    sll $t8, $t0, 2         # $t0 * 4
    add $t8, $s0, $t8       # endereço de nums[$t0]
    lw $t9, 0($t8)          # valor em nums[$t0]
    sw $t1, 0($t8)          # nums[$t0] = nums[1]
    sw $t9, 4($s0)          # nums[1] = nums[$t0]
fim_pos1:
    jr $ra

# Encontra o menor número das posições 2-5 e coloca na posição 2
encontra_menor_pos2:
    lw $t1, 8($s0)   # nums[2]
    lw $t2, 12($s0)  # nums[3]
    lw $t3, 16($s0)  # nums[4]
    lw $t4, 20($s0)  # nums[5]
    
    li $t0, 2        # posição do menor
    move $t7, $t1    # menor valor
    
    # Compara com nums[3]
    blt $t2, $t7, menor_eh_3_pos2
    j testa_4_pos2
menor_eh_3_pos2:
    li $t0, 3
    move $t7, $t2
    
testa_4_pos2:
    # Compara com nums[4]
    blt $t3, $t7, menor_eh_4_pos2
    j testa_5_pos2
menor_eh_4_pos2:
    li $t0, 4
    move $t7, $t3
    
testa_5_pos2:
    # Compara com nums[5]
    blt $t4, $t7, menor_eh_5_pos2
    j troca_pos2
menor_eh_5_pos2:
    li $t0, 5
    move $t7, $t4
    
troca_pos2:
    # Troca nums[2] com nums[$t0]
    beq $t0, 2, fim_pos2    # se já está na posição 2, não troca
    sll $t8, $t0, 2         # $t0 * 4
    add $t8, $s0, $t8       # endereço de nums[$t0]
    lw $t9, 0($t8)          # valor em nums[$t0]
    sw $t1, 0($t8)          # nums[$t0] = nums[2]
    sw $t9, 8($s0)          # nums[2] = nums[$t0]
fim_pos2:
    jr $ra

# Encontra o menor número das posições 3-5 e coloca na posição 3
encontra_menor_pos3:
    lw $t1, 12($s0)  # nums[3]
    lw $t2, 16($s0)  # nums[4]
    lw $t3, 20($s0)  # nums[5]
    
    li $t0, 3        # posição do menor
    move $t7, $t1    # menor valor
    
    # Compara com nums[4]
    blt $t2, $t7, menor_eh_4_pos3
    j testa_5_pos3
menor_eh_4_pos3:
    li $t0, 4
    move $t7, $t2
    
testa_5_pos3:
    # Compara com nums[5]
    blt $t3, $t7, menor_eh_5_pos3
    j troca_pos3
menor_eh_5_pos3:
    li $t0, 5
    move $t7, $t3
    
troca_pos3:
    # Troca nums[3] com nums[$t0]
    beq $t0, 3, fim_pos3    # se já está na posição 3, não troca
    sll $t8, $t0, 2         # $t0 * 4
    add $t8, $s0, $t8       # endereço de nums[$t0]
    lw $t9, 0($t8)          # valor em nums[$t0]
    sw $t1, 0($t8)          # nums[$t0] = nums[3]
    sw $t9, 12($s0)         # nums[3] = nums[$t0]
fim_pos3:
    jr $ra

# Encontra o menor número das posições 4-5 e coloca na posição 4
encontra_menor_pos4:
    lw $t1, 16($s0)  # nums[4]
    lw $t2, 20($s0)  # nums[5]
    
    # Compara nums[4] com nums[5]
    blt $t1, $t2, fim_pos4  # se nums[4] <= nums[5], já está ordenado
    
    # Troca nums[4] com nums[5]
    sw $t2, 16($s0)  # nums[4] = nums[5]
    sw $t1, 20($s0)  # nums[5] = nums[4]
    
fim_pos4:
    jr $ra

imprimir:
    # Mostra resultado
    li $v0, 4
    la $a0, msg_ordenado
    syscall
    
    # Imprime os 6 números diretamente
    li $v0, 1
    lw $a0, 0($s0)    # nums[0]
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    lw $a0, 4($s0)    # nums[1]
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    lw $a0, 8($s0)    # nums[2]
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    lw $a0, 12($s0)   # nums[3]
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    lw $a0, 16($s0)   # nums[4]
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    
    li $v0, 1
    lw $a0, 20($s0)   # nums[5]
    syscall
    
    # Quebra de linha
    li $v0, 4
    la $a0, quebra
    syscall
    
    # Termina
    li $v0, 10
    syscall