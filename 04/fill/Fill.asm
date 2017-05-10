// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// R0 - the address of current pixel
// R1 - current color
// R2 - return address

       @R1            // Set initial color
       M=0

       @LOOP          // Set return address
       D=A
       @R2
       M=D

(FILL_START)
       @SCREEN        // Initialize R0 with the address of the beginning of video memory
       D=A
       @R0
       M=D
(FILL_LOOP)
       @R1            // Read current color from R1
       D=M 
       @R0            // Read current pixel from R0
       A=M
       M=D            // Fill current pixel with current color
       A=A+1          // Calculate the address of next pixel
       D=A
       @R0
       M=D            // Store address of next pixel in R0
       @SCREEN        // Check if we reached the end of video memory
       D=D-A
       @8192
       D=D-A
       @R2            // Load return address from R2 and jump there
       A=M
       D;JEQ
       @FILL_LOOP
       0;JMP
(FILL_END)

(LOOP)
       @24576         // Read the key from keyboard
       D=M

       @KEY_PRESSED
       D;JGT

                      // Key not pressed
       @R1            // Read current color
       D=M

       @FILL_WHITE    // If current color if black, change it to white
       D;JNE

       @LOOP          // Go to the beginning of the loop
       0;JMP       

(FILL_WHITE)
       @R1            // Set fill color to white
       M=0

       @LOOP          // Set return address to LOOP
       D=A
       @R2
       M=D

       @FILL_START    // Call fill
       0;JMP

(KEY_PRESSED)
       @R1
       D=M

       @FILL_BLACK
       D;JEQ

       @LOOP          // Go to the beginning of the loop
       0;JMP

(FILL_BLACK)
       @R1            // Set fill color to black
       M=-1

       @LOOP          // Set return address to LOOP
       D=A
       @R2
       M=D

       @FILL_START    // Call fill
       0;JMP

       @LOOP
       0;JMP
(END)
