# RISCVerilog

![verilog](https://img.shields.io/badge/Verilog-RISC--V-blue.svg)
![license](https://img.shields.io/github/license/tomicmilos57/RISCVerilog)

## Overview

**RISCVerilog** is a 32-bit RISC-V CPU core (RV32IM_Zicsr) implemented in Verilog.  The core is currently capable of running **bare-metal DOOM**, which proves that all **unprivileged RISC-V instructions** are correctly implemented and functioning.

The next major milestone is to run the **xv6 operating system** on this CPU. This will require implementing virtual memory, full trap handling, and Supervisor mode support. The project is designed to be minimal, educational, and progressively built up toward full OS compatibility.

## DEMO


https://github.com/user-attachments/assets/82bf480b-b5d9-47b5-9ca6-7ebfc0f35470


## Functionality

-  **SDRAM Controller** – External memory support for program/data storage  
-  **Static Cache** – Basic cache system to improve memory access speed  
-  **Dual Data Transfer Paths**:
  - **SD Card Controller** – Used to load executable programs and game assets into SDRAM
  - **Raspberry Pi Microcontroller** – Alternative method for transferring data using GPIO pins  
-  **PS/2 Controller** – Keyboard input support for user interaction  
-  **VGA Controller** – Video output for graphical display
