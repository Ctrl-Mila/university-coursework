# Binary Network Delay

This exercise models a full binary tree as a communication network.

Each node represents a forwarding delay in seconds.
The objective is to calculate the maximum total delay along any path
from the root to a leaf node.

The solution recursively computes the maximum accumulated delay,
choosing the longest path in the tree.
