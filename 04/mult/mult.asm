// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// The assembly code below implements the following high-level code:
//
//   int R0 = ...; 
//   int R1 = ...;
//   int R2 = 0;
//   for (int R3 = 0; R3 < R0; R3++) {
//       R2 += R1;
//   }

       @R3
       M=0
       @R2
       M=0
(LOOP)
       @R0
       D=M
       @R3
       D=D-M
       @END
       D;JEQ
       @R1
       D=M
       @R2
       M=D+M
       @R3
       M=M+1
       @LOOP
       0;JMP
(END)
       @END
       0;JMP

