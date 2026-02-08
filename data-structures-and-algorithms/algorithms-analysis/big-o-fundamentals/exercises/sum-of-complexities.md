## Problem

Given an algorithm composed of two sequential parts with time complexities O(n) and O(n log n), determine the overall time complexity.

## Approach

When algorithmic steps are executed sequentially, their complexities are added together.

## Time Complexity Analysis

O(n) + O(n log n)

Since `n log n` grows faster than `n`, it dominates the overall complexity.

**Result:** `O(n log n)`

## Conclusion

In Big-O analysis, when combining sequential operations, the total complexity is determined by the fastest-growing term.
