# Maximum Value Filtered Path 

Given a **general tree** of integers where each node contains either 0 or 1, the goal is to find the path with the **maximum value** under specific constraints.

## Problem Definition

- The value of a path is calculated as the sum of each node value multiplied by its level.
- Only nodes with value **1** are added to the resulting path.
- Nodes with value **0** are ignored during traversal.
- If multiple paths have the same maximum value, the first one found is returned.
- The path cannot be built first and filtered afterwards.

## Solution Approach

- A **backtracking** strategy is used to explore all root-to-leaf paths.
- During traversal, the current path, accumulated value, and maximum result are tracked.
- Filtering is applied during traversal, not as a post-processing step.

This solution highlights controlled state management during recursive exploration.
