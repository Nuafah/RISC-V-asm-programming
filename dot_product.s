.data
    a: .word 1, 2, 3, 4, 5
    b: .word 6, 7, 8, 9 ,10
    output: .string "The dot product is: "
    newline: .string "\n"

.text

main:
    addi x5, x0, 0      # x5 -> i = 0
    addi x6, x0, 0      # x6 -> sop = 0
    addi x7, x0, 5      # x7 -> size = 5
    
    la x8, a            # load address a to x8
    la x9, b            # load address a to x9
    
    
loop: 
    beq x5, x7, exit    # end the loop if i == 5
    
    slli x18, x5, 2     # set x18 to i*4
    add x19, x18, x8    # add i*4 to the base address of a and put it to x19
    add x20, x18, x9    # add i*4 to the base address of b and put it to x20
    lw x21, 0(x19)      # x21 = a[i]
    lw x22, 0(x20)      # x22 = b[i]
    mul x23, x21, x22   # x23 = a[i] * b[i]
    add x6, x6, x23     # sop += x23
    
    addi x5, x5, 1      # i++
    j loop      
    
exit:
   # print an output string
   addi a0, x0, 4
   la a1, output
   ecall
   
   # print sop
   addi a0, x0, 1
   add a1, x0, x6
   ecall
   
   # print a newline
   addi a0, x0, 4
   la a1, newline
   ecall
   
   # exit cleanly
   addi a0, x0, 10
   ecall