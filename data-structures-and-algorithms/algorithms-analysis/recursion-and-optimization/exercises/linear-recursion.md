## Problem

Determine the time complexity of the following recursive function:

int f(int n) {
    if (n == 0) return 0;
    return f(n - 1) + 1;
}

## Approach

The function calls itself once per recursive step, reducing `n` by 1 each time.

## Time Complexity Analysis

- One recursive call per value of `n`
- Total calls: `n`

**Result:** `O(n)`

## Conclusion

A recursion that reduces the problem size by a constant amount at each step has linear time complexity.
