# Water Distribution Network – Minimum Flow 

A potable water distribution network is modeled using a **general tree**, where each node represents a pipe and its children represent its bifurcations.

An initial flow enters through the root pipe and is equally divided among its children. This process continues recursively until reaching leaf nodes, which represent houses.

## Goal

Compute the **minimum flow** received by any house in the network.

## Solution Approach

- The tree is traversed **recursively**.
- At each node, the incoming flow is divided equally among its children.
- When a leaf node is reached, the corresponding flow is returned.
- The minimum value among all leaf flows is calculated in a single traversal.
