# Solution – B-Tree Order 5 (Left Policy)

---

## Operation 1: +320

### Search Phase

- Read root (node 2).
- Since 220 < 320 < 390, descend to node 1.
- Read node 1 (leaf).

Reads: 2

### Insertion and Overflow

Node 1 contains:
225, 241, 331, 360

After insertion:
225, 241, 320, 331, 360 → overflow (5 keys)

Split:

- Left node (1): 225, 241
- Right node (new node 6): 331, 360
- Promote 320 to parent

Writes:
- Node 1
- Node 6

### Propagation to Parent

Parent (node 2) already has maximum keys:
220, 390, 455, 541

Insert 320 → overflow:
220, 320, 390, 455, 541

Split:

- Left node (2): 220, 320
- Right node (new node 7): 455, 541
- Promote 390 to new root

Create new root (node 8).

Writes:
- Node 2
- Node 7
- Node 8

### I/O Summary

Reads: 2  
Writes: 5  

---

## Operation 2: -390

### Search Phase

- Read root (8).
- Key found in internal node.

Reads: 1

### Replacement

Replace with smallest key from right subtree.

- Read node 7.
- Read node 4 (leftmost leaf of right subtree).

Successor: 400

Rewrite:
- Node 8 (replace 390 with 400)
- Node 4 (remove 400)

Remaining in node 4: 407 → no underflow.

### I/O Summary

Reads: 3  
Writes: 2  

---

## Operation 3: -400

### Search Phase

- Read root (8).
- Read node 7.
- Read node 4.

Reads: 3

Replace 400 with successor (407).

After removing 407 from node 4 → node becomes empty → underflow.

### Underflow Resolution (Left Policy)

Node 4 has no left sibling and cannot borrow.

Merge with right sibling (node 5) and parent separator (455).

Merged node contains:
455, 508, 533

Update parent (node 7).

Writes:
- Node 4
- Node 5
- Node 7
- Node 8 (updated separator)

### I/O Summary

Reads: 4  
Writes: 4  

---

## Operation 4: -533

### Search Phase

- Read root (8).
- Descend right.
- Read node 7.
- Descend left.
- Read node 4.

Reads: 3

Remove 533 from leaf.

Node still has valid number of keys → no underflow.

Writes:
- Node 4

### I/O Summary

Reads: 3  
Writes: 1  
