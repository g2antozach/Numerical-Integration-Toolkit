# Numerical Integration Utility (MATLAB)

This repository contains a MATLAB implementation of composite numerical integration methods for single and double integrals. This project was developed as part of the Numerical Analysis curriculum at the **Aristotle University of Thessaloniki (AUTh)**.

## Features
* **Composite Trapezoidal Rule**: Approximates integrals by partitioning the interval into $n$ subintervals. 
* **Composite Simpson's 1/3 Rule**: Provides higher precision using quadratic approximations (requires even $n$). 
* **Double Integration**: A modular wrapper that computes $\iint f(x,y) \, dx \, dy$ over rectangular domains by nested application of the above rules.
  
## Usage
To calculate a double integral, use the `doubleint` function:
```matlab
f = @(x,y) x + y.^3;
doubleint(f, 0, 4, 1, 3, 4, 2)
