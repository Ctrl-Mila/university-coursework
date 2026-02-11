# Endangered Birds: Physical Deletion Variants

Manage a file of endangered bird species:

- Implements **logical deletion** of extinct species.
- Two methods for **physical deletion (compaction)**:
  1. Swap with last record and truncate.
  2. Single truncate after swapping multiple deleted records.
- Demonstrates alternative strategies for efficient file compaction.
