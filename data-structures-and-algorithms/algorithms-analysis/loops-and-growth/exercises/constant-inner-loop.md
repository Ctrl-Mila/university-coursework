## Problem

Determine the time complexity of the following code:

for (int i = 0; i < n; i++) {
    for (int j = 0; j < 2; j++) {
        // O(1)
    }
}

## Approach

The inner loop runs a constant number of times, regardless of `n`.

## Time Complexity Analysis

- Outer loop: `n`
- Inner loop: constant

**Result:** `O(n)`

## Conclusion

Constant-time inner loops do not affect the overall asymptotic complexity.
