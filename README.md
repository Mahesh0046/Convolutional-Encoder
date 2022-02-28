# Convolutional Codes
This project was made to implement a general (n,k,m) convolutional encoder with k-input, n-output linear sequential circuit with input memory m.

## Inputs
- Firstly asking for the values of (n,k,m) and length of the message.
-  Then asking for the message signal(in accordance with the message length and value of k previously provided).
- Then at last asking for the generator matrix.

## Convolutional Coding
A convolutional encoder consists of k m-stage shift registers containing message symbols and circuits that perform some linear function to generate the codeword. The message symbols are fed into the shift registers k symbols at a time. The contents of the shift registers are shifted each time a k-symbol block is fed in. The linear function generator generates an n-symbol block from both the contents of the shift registers and the k input symbols each time an input block is fed in. Initially the contents of the shift registers are assumed to be all zeros. The number of message symbols from which an output block is generated (= (m + 1)k) is called the constraint length of the code. The ratio R = k/n is called the code rate or coding rate, which is consistent with the definition of the code rate for a block code.

In this project we have used MATLAB to perform all these functionalities.

## Outputs
The output is the generated code word symbolized by v.