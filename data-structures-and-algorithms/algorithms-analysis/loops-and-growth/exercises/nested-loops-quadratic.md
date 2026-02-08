## Problem

Determine the time complexity of the following code:

for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
        // O(1)
    }
}

## Approach

The outer loop runs `n` times. For each iteration, the inner loop also runs `n` times.

## Time Complexity Analysis

- Outer loop: `n`
- Inner loop: `n`
- Total operations: `n * n`

**Result:** `O(n²)`

## Conclusion

Nested loops with independent bounds that both depend on `n` lead to quadratic time complexity.
