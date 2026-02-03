# Practice 3 – Concurrency and Resource Synchronization (R-Info)

This folder contains selected exercises from Practice 3 of the Concurrent Programming module,
developed in the CMRE (R-Info) environment.

The main focus of this practice is the correct use of synchronization mechanisms, especially
the blocking and releasing of shared resources, combined with message passing between robots.

## Topics covered

- Concurrent execution of multiple robots
- Mutual exclusion using `BloquearEsquina` and `LiberarEsquina`
- Coordination through message passing
- Centralized coordination (coordinator / workers pattern)
- Handling shared resources safely
- Termination conditions in concurrent scenarios

## Selected exercise

### Robot Race with Shared Resource

Four robots race along different avenues. In order to advance, each robot must access a shared
paper source located at a single corner. Access to this resource is synchronized to prevent
race conditions. A coordinator robot collects the results and determines which robot advanced
the farthest.

This exercise demonstrates:
- Proper use of critical sections
- Fair resource access
- Coordination and result aggregation

The goal of including this exercise is to showcase a realistic concurrent scenario with
resource contention and synchronization.
