# Linux Distributions with Inverted List

Manage a file of Linux distributions with **unique names** using inverted list:

- `BuscarDistribucion`: search by name and return file position or -1.
- `AltaDistribucion`: add a new distribution, reusing free space if available.
- `BajaDistribucion`: logical deletion using inverted list to mark freed space.
- Demonstrates **control of uniqueness**, **space reuse**, and **logical deletion**.
