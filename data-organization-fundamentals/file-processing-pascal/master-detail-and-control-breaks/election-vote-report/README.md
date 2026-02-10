# Hierarchical Vote Counting with Control Breaks

## Problem Overview

This exercise processes an ordered file containing vote counts from electoral tables, grouped by province and locality.

Each record in the file includes:
- Province code
- Locality code
- Table number
- Number of votes cast at that table

The file is ordered by province code and locality code.

## Objective

The program must generate a structured report displaying:
- Total votes per locality
- Total votes per province
- Overall total votes across all provinces

The report must be produced using a **single sequential pass** over the file.

## Key Concepts Applied

- Control break processing
- Hierarchical aggregation (province → locality → table)
- Sequential file traversal
- Report generation with subtotals and totals

## Notes

- The exercise focuses on logical data grouping rather than file updates
- No random access or auxiliary data structures are used
- The solution emphasizes clarity and correctness in control break handling
