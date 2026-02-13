# Hashing – File Structures

This directory contains practical exercises related to hashing techniques used in file organization.

The focus of these exercises is to demonstrate:

- Collision handling strategies
- Overflow management
- Directory growth and reduction
- Structural evolution after insertions and deletions
- Internal state representation of both the directory and data file

Each exercise includes:
- A formal problem statement
- A detailed step-by-step solution
- Visual representations of the structure after each operation

## Contents

### Extensible Hashing (Bucket Capacity = 2)

Implementation of the extensible hashing method with:

- Bucket capacity of 2 records
- Directory growth through global depth increase
- Bucket splitting with local depth increase
- Bucket merging and directory reduction
- Least significant bits used for addressing

This exercise includes insertions and deletions, demonstrating:
- Multiple splits
- Directory duplication
- Bucket merges
- Local and global depth adjustments
