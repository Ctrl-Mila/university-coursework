## Problem

Determine the time complexity of the following recursive function:

int f(int n) {
    if (n <= 1) return 1;
    return f(n / 2) + f(n / 2) + n;
}

## Approach

The function splits the problem into two equal subproblems and performs linear work at each level.

## Time Complexity Analysis

- Recurrence: `T(n) = 2T(n / 2) + O(n)`
- According to the Master Theorem

**Result:** `O(n log n)`

## Conclusion

This pattern is common in divide-and-conquer algorithms such as Merge Sort.
