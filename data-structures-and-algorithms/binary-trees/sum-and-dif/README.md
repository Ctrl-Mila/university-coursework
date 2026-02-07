# Sum and Difference Tree

This exercise builds a new binary tree derived from an original binary tree of integers.

For each node in the new tree, two values are stored:
- The sum of all values along the path from the root to the current node
- The difference between the value of the current node and the value of its parent

The root node assumes a parent value of 0.

The solution uses recursion to propagate accumulated values and preserves the original tree structure.
