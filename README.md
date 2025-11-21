# Lab-9-Multiplier-Design-Combinational-and-Sequential-

## Overview

This repository contains the Verilog designs, testbenches, simulation waveforms, and FPGA implementation files for Lab #9 of ECE 128.
The objective was to design a 4-bit combinational multiplier and a sequential shift-and-add multiplier, verify them in simulation, and test the outputs on the Basys-3 FPGA board.

## Functionality

The combinational multiplier computes the product through pure logic and updates immediately based on switch inputs.

The sequential multiplier uses shifting, conditional add, and internal registers to compute the result over several clock cycles. Reset is tied low in the top module, so the design initializes automatically.

## How to Run

1. Open the project in Vivado 2023.1

2. Add design sources and testbenches

3. Run behavioral simulation

4. Program the Basys-3 to observe the product on the LEDs

#### Inputs:

A = sw[3:0]
B = sw[7:4]

#### Output:

Product P[7:0] → LEDs
