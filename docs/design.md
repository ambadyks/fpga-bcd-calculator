# FPGA BCD Calculator — Design Specification

**Version:** 1.0  
**Target Hardware:** EDGE Spartan-7 | Tang Nano 20K  

---

##  Project Overview
This project implements a single-digit Binary Coded Decimal (BCD) adder in Verilog HDL. It covers the full development pipeline—from writing RTL logic and simulation to synthesis, pin mapping, and testing on physical FPGA boards.

##  Functional Specifications (V1)
In version 1.0, the core calculator accepts two single-digit BCD inputs and outputs their decimal sum.

* **Inputs:** 
  * `A` : 4-bit BCD digit (`0x0` to `0x9`)
  * `B` : 4-bit BCD digit (`0x0` to `0x9`)
* **Output:** 
  * `Result` : 5-bit binary value representing a decimal sum (`0` to `18`)

### Test Cases
| Input A | Input B | Decimal Sum | Binary Output |
| :---: | :---: | :---: | :---: |
| `2` | `3` | **5** | `00101` |
| `5` | `5` | **10** | `01010` |
| `7` | `8` | **15** | `01111` |
| `9` | `9` | **18** | `10010` |

---

##  Architecture & Module Hierarchy
The hardware design is split into five distinct blocks:

1. **`bcd_adder`**: Core combinational logic that computes BCD addition (includes `+6` correction logic for sums $> 9$).
2. **`bcd_to_7seg`**: Converts BCD outputs into drive signals for seven-segment displays.
3. **`calculator_top`**: Top-level wrapper integrating arithmetic and display logic.
4. **Board Wrappers**: Target-specific top modules adapting ports to onboard switches/displays.
5. **Constraints (`.xdc` / `.cst`)**: Pin mapping files mapping logical signals to physical FPGA package pins.

---
