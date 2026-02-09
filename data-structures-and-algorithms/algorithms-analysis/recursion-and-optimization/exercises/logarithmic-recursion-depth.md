## Problem

Analyze the recursion depth of a binary search algorithm.

## Approach

At each step, the search space is divided by two.

## Time Complexity Analysis

- Recursion depth: `log₂(n)`
- Work per level: `O(1)`

**Result:** `O(log n)`

## Conclusion

Binary search is efficient because it drastically reduces the problem size at each recursive step.
