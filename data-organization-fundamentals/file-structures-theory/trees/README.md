# B-Trees – File Structure and Disk-Based Operations

This section contains theoretical exercises focused on **B-Tree structures** used in file organization and indexing systems.

The exercises simulate disk-based behavior, explicitly detailing:

- Node reads and writes (I/O operations)
- Overflow handling with split propagation
- Underflow resolution policies
- Internal node deletion with successor replacement
- Redistribution and merge strategies
- Root creation and height changes

All trees are B-Trees of **order 5**, meaning:

- Maximum keys per node: 4
- Minimum keys per node (except root): 1
- Minimum number of children: 2 (for internal nodes)

Each exercise includes:
- The original problem statement
- Step-by-step justification of operations
- Disk I/O analysis
- Graphical representation of tree states after each operation
