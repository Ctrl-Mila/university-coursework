## Problem

Compare the time complexity of a naive approach and an optimized approach for processing range updates.

## Naive Approach

For each query, update every affected element.

- Nested loops
- Time complexity: `O(n * m)`

## Optimized Approach

Use an auxiliary array and prefix sums.

- One pass to process queries
- One pass to apply updates

**Time Complexity:** `O(n + m)`

## Conclusion

Optimization techniques can reduce time complexity by avoiding repeated work, even when solving the same problem.
