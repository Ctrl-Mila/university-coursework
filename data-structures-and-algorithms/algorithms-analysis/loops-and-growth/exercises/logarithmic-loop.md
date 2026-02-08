## Problem

Determine the time complexity of the following loop:

for (int i = 1; i <= n; i = i * 2) {
    // O(1)
}

## Approach

The loop variable doubles on each iteration, meaning the number of iterations grows logarithmically.

## Time Complexity Analysis

- Iterations: `log₂(n)`
- Work per iteration: `O(1)`

**Result:** `O(log n)`

## Conclusion

Loops that multiply or divide the loop variable by a constant on each iteration run in logarithmic time.
