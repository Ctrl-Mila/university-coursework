# Map Routing with Graphs

This exercise models a road map as a weighted graph where:
- Vertices represent cities
- Edges represent routes between cities
- Edge weights represent distances

The objective is to find paths between cities under different constraints using graph traversal algorithms and backtracking.

## Implemented Features

The `Mapa` class provides the following operations:

- **Find any path between two cities**
- **Find a path avoiding a given set of cities**
- **Find the shortest path based on total distance**
- **Find a path without refueling, given a fuel tank limit**
- **Find a path that minimizes the number of refuels**

Each method explores the graph using depth-first search while tracking additional state (distance, fuel, refuels) when required.

## Concepts Applied

- Graph traversal (DFS)
- Backtracking
- State tracking in recursive algorithms
- Optimization based on different criteria
- Use of weighted graphs

This exercise focuses on problem-solving and algorithmic reasoning rather than relying on predefined shortest-path algorithms.
