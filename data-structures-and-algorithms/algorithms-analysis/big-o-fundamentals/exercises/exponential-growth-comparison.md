## Problem

Determine whether the function 3ⁿ can be bounded by 2ⁿ using Big-O notation.

## Approach

Both functions are exponential, but the growth rate depends on the base of the exponent. A larger base leads to faster growth, which determines whether one function can serve as an upper bound for the other.

## Time Complexity Analysis

For Big-O notation to apply, there must exist constants `c` and `n₀` such that:

3ⁿ ≤ c · 2ⁿ for all n ≥ n₀

This inequality cannot hold for sufficiently large values of `n`, since 3ⁿ grows strictly faster than 2ⁿ.

**Result:** `3ⁿ is NOT O(2ⁿ)`

## Conclusion

Although both functions are exponential, differences in their bases have a major impact on growth rates. An exponential function with a smaller base cannot bound one with a larger base.
