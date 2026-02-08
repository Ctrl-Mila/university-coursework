## Problem

Determine the time complexity of the following recursive function:

int f(int n) {
    if (n <= 1) return 1;
    return f(n / 2) + 1;
}

## Approach

Each recursive call reduces the input size by half.

## Time Complexity Analysis

- Recurrence: `T(n) = T(n / 2) + O(1)`
- Number of levels: `log n`

**Result:** `O(log n)`

## Conclusion

Dividing the problem size by a constant factor at each recursive step results in logarithmic time complexity.
