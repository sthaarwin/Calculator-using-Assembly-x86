
# Calculator in Assembly (x86)

This project implements a basic calculator using x86 assembly. It can perform arithmetic operations such as addition, subtraction, multiplication, and division.

## Features

- Supports basic operations (+, -, *, /)
- Command-line interface
- Input validation for numerical values

## Requirements

- NASM assembler
- Linux OS (or any x86-compatible system)
- C++ compiler (for `compiler.cpp`)

## How to Build and Run

1. Clone the repository:
   ```bash
   git clone https://github.com/sthaarwin/Calculator-using-Assembly-x86
   ```

2. Compile the C++ script `compiler.cpp`:
   ```bash
   g++ compiler.cpp -o compiler
   ```

3. Run the compiler to build and run all `.asm` files:
   ```bash
   ./compiler
   ```

   The script will search for all `.asm` files in the directory, compile them using NASM, and run the resulting executables.

## Contributing

Feel free to contribute by creating pull requests or reporting issues.
