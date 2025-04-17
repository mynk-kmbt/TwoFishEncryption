# TwoFishEncryption
# Overview
This repository contains the Verilog implementation of the Twofish encryption and decryption algorithm on an FPGA. Twofish is a symmetric key block cipher that operates on 128-bit blocks with key sizes of 128, 192, or 256 bits, however the given implemetaiton works for 128 bits key. The design is optimized for FPGA hardware and provides a practical example of implementing a modern cryptographic algorithm on a programmable logic device.

The project was developed as part of the ES204 Digital Systems course.

# Features

- Twofish encryption and decryption in Verilog

- Implementation of the key schedule and round function

- Optimized for FPGA implementation

- Supports key sizes: 128 bits

- Feistel network-based design with 16 rounds

- Use of key-dependent S-boxes for enhanced security

# Files

- encrypt_out.v – Final output processing module, managing ciphertext formatting after encryption rounds.

- encrypt_testbench.v – Testbench module simulating the entire encryption pipeline for functional verification.

- input_whitening.v – Handles input whitening step by XORing plaintext with the round of subkeys.

- FuncF_out.v – Manages output logic from the F-function, preparing data for further processing in the encryption round.

- F_function.v – Implements the F-function core of Twofish, combining G-functions and key mixing for round operations.

- G_Function.v – Realizes the G-function, applying key-dependent S-boxes followed by MDS matrix multiplication.

- pht_32bit.v – Implements 32-bit pseudo-Hadamard transform (PHT) used in the key mixing process and rounds .

- mds.v – Implements the MDS matrix used for diffusion in the G-function of the cipher.

- multi.v – Finite field multiplier, used for MDS matrix computations and other algebraic operations.

- Sbox.v – Constructs dynamic S-boxes using Q permutations and key material, essential for non-linearity.

- Q0.v – Describes the fixed Q0 permutation box, a non-linear byte substitution used in S-box generation.

- Q1.v – Implements the Q1 permutation box, another component for dynamically generating Twofish S-boxes.

- H_Function.v – Defines the H-function for key-dependent transformation in key scheduling and encryption.

- Mat_Multi.v – Performs finite field matrix multiplication, used S0, S1 creation.


# FPGA Configuration

The design is modular, allowing easy adaptation to different FPGA boards. The top-level module integrates encryption/decryption with key scheduling. Modify the I/O ports and constraints file according to the specific FPGA board you are working with.

For I/O communication, we attempted to implement UART. While the TX (transmit) functionality works perfectly and allows communication with a PC, the RX (receive) module could not be successfully implemented. As a workaround, we stored multiple plaintext–key pairs as internal registers. The user can interact with the design by selecting a specific pair through manual input (e.g., switches or buttons), and the corresponding ciphertext is transmitted to the PC via UART TX.

# Challenges Faced

- **UART RX Implementation Failure:**  
  While we aimed to establish full UART communication, we encountered issues with the RX (receiver) module. Despite successful transmission (TX) of data from FPGA to PC, the RX path couldn't be reliably established. As a workaround, we stored multiple (plaintext, key) pairs in registers and allowed the user to select a pair via input to be transmitted over TX to the PC.

- **Modular Design Integration:**  
  Combining all modules (key schedule, S-boxes, matrix multipliers, etc.) into a coherent top-level system without signal mismatches or simulation deadlocks took multiple debugging cycles.

- **Galois Field Arithmetic Complexity:**  
  Implementing Galois Field multiplication posed a significant challenge. Careful reference to research papers and existing implementations was necessary to validate our approach.

- **Intermediate Value Verification:**  
 Debugging internal states of the encryption algorithm in hardware was non-trivial. The reference materials lacked detailed explanation of the complete logic, so we had to cross-verify every intermediate value with a Python implementation to ensure correctness at each stage of the pipeline.

# Demonstration

In this section, you will find a demonstration of the project including a PowerPoint presentation and an instructional video.

### PowerPoint Presentation
You can view the detailed PowerPoint presentation of the project by following this [link](https://iitgnacin-my.sharepoint.com/:p:/g/personal/23110136_iitgn_ac_in/EaISYMfziCNPiQT4n5hlWA0B7a2BhbNJG31n4_IqoY5M2Q?e=tw99HG).

### Instructional Video
An instructional video that demonstrates the workings of the project can be found here: [Video Link](<insert_your_video_link>).

# References

### Algorithm Understanding
- [Twofish Encryption Algorithm on ZYBO – Instructables](https://www.instructables.com/Twofish-Encryption-Algorithm-on-ZYBO/)
- [Twofish Algorithm Explained – YouTube](https://www.youtube.com/watch?v=SpaXSMkJLs0&t=345s)
- [The Twofish Encryption Algorithm – Official Paper by Schneier et al. (PDF)](https://www.schneier.com/wp-content/uploads/2016/02/paper-twofish-paper.pdf)

### Galois Field multiplier
- [Efficient Galois Field Multiplier for Twofish – IEEE Xplore](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=803685)

### Output Verification
- [Twofish Python Implementation by K-Czaplicki – GitHub](https://github.com/K-Czaplicki/TwoFish/blob/main/TwoFish.py#L423)

### UART Reference
- [UART Implementation on Basys3 by Shubhayu Das – GitHub](https://github.com/Shubhayu-Das/UART-basys3)
