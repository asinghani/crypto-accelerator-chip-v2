# Cryptography Accelerator v2

This is a cryptography accelerator chip for the Skywater MPW-THREE tapeout. It includes an AES256 core (with some key-entropy restrictions to reduce the number of bits in the key), a SHA256 core, a VGA game demo, and some other experimental structures. This includes improved versions of the unsuccessful cores from MPW-ONE.

For documentation on the AES and SHA cores (including the original Chisel source code), see [asinghani/crypto-accelerator](https://github.com/asinghani/crypto-accelerator)

### Overview

This chip contains 4 major components:

1. AES128/256 Accelerator
    - Optimized for balance between speed and area, can encrypt or decrypt a 16-byte block in ~20 cycles for AES128 or ~28 cycles for AES256
    - Supports both ECB and CBC modes (CBC is recommended because it is much more secure against certain types of attacks) with no performance penalty for using CBC
    - Has some internal key-entropy limitations since it is meant for experimental use

2. SHA256 Accelerator
    - Can hash a single 512-bit block in ~66 cycles (and is able to process multiple blocks immediately back-to-back, i.e. when hashing a large file)

3. VGA Game Demo
    - Contributed by [Ethan Polcyn](https://github.com/ethanleep) (and then ported to run on the ASIC environment)
    - Consists of a small infinite side-scrolling jumping game (based on the Chromium Browser's "No internet"-game), playable using button input from one of the chip's I/O pins
    - Renders VGA video output at 640x480 through the chip's output pins

<img src="https://raw.githubusercontent.com/asinghani/crypto-accelerator-chip/main/doc/dino.png" width="600pt" />

4. Caravel harness/padframe
    - Contains a picorv32 CPU (which is used to interface with the rest of the cores through the Wishbone bus) and the padframe
    - See [efabless/caravel](https://github.com/efabless/caravel) for details. 
