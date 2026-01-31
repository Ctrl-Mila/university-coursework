# Recital Management System

Object-Oriented Programming exercise.

This project models the management of musical recitals organized by a producer.
There are two types of recitals: occasional events and tours.

## Description
- Every recital has a band name and a list of songs to be performed.
- An occasional event includes a reason (benefit event, TV show or private show),
  a contractor name and the event day.
- A tour includes a tour name and a list of dates (city and day) where the band will perform.

## Implemented Features
- Add songs to a recital
- Perform a recital, printing messages according to its type
- Calculate the cost of a recital depending on its category

## Classes
- `Recital`: abstract base class for all recitals
- `Evento`: represents an occasional event
- `Gira`: represents a tour with multiple dates
- `Fecha`: represents a tour date (city and day)
- `Ejercicio3`: main program that tests the system
