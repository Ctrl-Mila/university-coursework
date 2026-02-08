## Problem

Determine the time complexity of the following recursive function:

int f(int n) {
    if (n <= 1) return 1;
    return f(n - 1) + f(n - 1);
}

## Approach

Each call generates two new recursive calls of size `n - 1`.

## Time Complexity Analysis

- Recurrence: `T(n) = 2T(n - 1) + O(1)`
- This forms a binary recursion tree

**Result:** `O(2^n)`

## Conclusion

Recursive functions that branch into multiple calls without reducing the problem significantly lead to exponential time complexity.
