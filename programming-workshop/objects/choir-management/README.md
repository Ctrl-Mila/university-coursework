# Choir Management System

Object-Oriented Programming exercise.

This project models a music school that organizes different types of choirs
to participate in events.

## Description
- Each choir has a name, a director and a group of singers (choristers).
- The director has a name, DNI, age and years of experience.
- Each chorister has a name, DNI, age and a fundamental tone.

There are two types of choirs:
- **Semicircular choir**: singers are placed side by side.
- **Row-based choir**: singers are organized in rows of equal size.

## Implemented Features
- Add singers to a choir according to its structure
- Check if a choir is complete
- Check if a choir is well formed:
  - Semicircular choir: singers are ordered from highest to lowest tone
  - Row-based choir: all singers in a row share the same tone, and the first
    singer of each row is ordered from highest to lowest tone
- Display complete information about the choir, its director and its singers

## Classes
- `Coro`: abstract base class for choirs
- `Semicircular`: represents a semicircular choir
- `Hileras`: represents a choir organized in rows
- `Persona`: base class for Corista and Director
- `Director`: represents the choir director
- `Corista`: represents a singer
- `Ejercicio4`: main program that tests the system
