## Problem

Determine the time complexity of the following code:

for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j += i) {
        // O(1)
    }
}

## Approach

For a fixed value of `i`, the inner loop runs approximately `n / i` times.

## Time Complexity Analysis

Total operations:

n * (1/1 + 1/2 + 1/3 + ... + 1/n)

This sum is bounded by `O(log n)`.

**Result:** `O(n log n)`

## Conclusion

Loops where the increment depends on the outer loop often result in harmonic series and logarithmic growth.
