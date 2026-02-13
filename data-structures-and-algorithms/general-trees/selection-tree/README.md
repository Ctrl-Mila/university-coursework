# Selection Tree 

A **selection tree** is a general tree where each node stores the **minimum value among its children**.

Goal -> Determine whether a given general tree satisfies the selection tree property.

## Solution Approach

- The tree is traversed **recursively**.
- For each node:
  - the minimum value among its children is computed,
  - and compared with the node’s own value.
- If any node violates the property, the process stops immediately.
- If all nodes satisfy the condition, the tree is considered a selection tree.

The validation is performed in a single traversal of the tree.
