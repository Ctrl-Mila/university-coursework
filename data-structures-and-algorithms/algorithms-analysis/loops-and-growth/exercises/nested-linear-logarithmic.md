## Problem

Determine the time complexity of the following code:

for (int i = 0; i < n; i++) {
    for (int j = 1; j <= n; j = j * 2) {
        // O(1)
    }
}

## Approach

The outer loop runs linearly, while the inner loop grows logarithmically.

## Time Complexity Analysis

- Outer loop: `O(n)`
- Inner loop: `O(log n)`
- Total complexity: `n * log n`

**Result:** `O(n log n)`

## Conclusion

When loops are nested, their time complexities multiply.
