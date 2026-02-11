# B-Tree of Order 5 – Right Underflow Policy

Given the following B-Tree of order 5, show how the tree evolves after performing the operations listed below.

## B-Tree Properties

- Order: 5
- Maximum keys per node: 4
- Minimum keys per node (except root): ⌈5/2⌉ − 1 = 1
- Overflow must be resolved by node splitting.
- Underflow must be resolved using **right policy**.
- Each operation must include disk read/write accounting.
- Draw the tree after each operation.

## Operations

1. +450  
2. -485  
3. -511  
4. -614  

For each operation:

- Indicate search path.
- Justify overflow/underflow handling.
- Specify redistribution or merge strategy.
- Count disk reads and writes.
