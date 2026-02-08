## Problem

Consider an algorithm where one branch runs in O(n²) time and another runs in O(n). Only one branch is executed at runtime. Determine the overall time complexity.

## Approach

When execution paths are mutually exclusive, the overall time complexity is determined by the worst-case scenario.

## Time Complexity Analysis

max(O(n²), O(n)) = O(n²)

**Result:** `O(n²)`

## Conclusion

Big-O notation represents the upper bound of execution time. When multiple execution paths exist, the slowest one determines the overall complexity.
