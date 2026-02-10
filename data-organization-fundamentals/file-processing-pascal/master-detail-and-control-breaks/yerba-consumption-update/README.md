# Yerba Consumption Master Update Using Multiple Detail Files

## Problem Overview

This exercise simulates the monthly update of a master file that stores historical yerba mate consumption data per province in Argentina.

The system consists of:
- A **master file**, ordered by province code, containing:
  - Province code
  - Province name
  - Number of inhabitants
  - Total kilograms of yerba consumed historically
- **Sixteen detail files**, each ordered by province code, containing:
  - Province code
  - Kilograms of yerba consumed during a specific monthly survey

A province may appear zero, one, or multiple times across different detail files.

## Objective

The program must:
- Update the master file by accumulating the consumption data from all detail files
- Traverse each file **only once**
- After updating, report on screen:
  - Provinces whose total historical consumption exceeds 10,000 kilograms
  - The average yerba consumption per inhabitant for those provinces

## Key Concepts Applied

- Master–detail file processing
- Simultaneous traversal of multiple ordered files
- Minimum selection algorithm across multiple detail files
- Sequential file access
- Aggregated updates and reporting

## Notes

- The master and all detail files are assumed to be sorted by province code
- The solution avoids unnecessary file passes to ensure efficiency
