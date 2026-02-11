# B-Tree of Order 5 – Left Underflow Policy

Given the following B-Tree of order 5, show how the tree evolves after performing the operations listed below.

## B-Tree Properties

- Order: 5
- Maximum keys per node: 4
- Minimum keys per node (except root): ⌈5/2⌉ − 1 = 1
- Overflow must be resolved by node splitting.
- Underflow must be resolved using **left policy**.
- Each operation must be justified step by step.
- Indicate disk reads and writes in order of occurrence.
- Draw the resulting tree after each operation.

## Operations

1. +320  
2. -390  
3. -400  
4. -533  

For each operation:

- Indicate the search path.
- Justify structural changes.
- Specify whether overflow or underflow occurs.
- Detail how the condition is resolved.
- Count disk reads and writes.
