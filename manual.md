## Overview
The program is based on MATLAB scripts run consecutively by the script *main.m*.
It loads the data from the input folder and writes results to the output folder.
Basing on the measurement of velocity, force and mass it optimizes a static friction model of the device.

## Workflow
Data from the paths specified in the first paragraph of *main.m* is first
loaded to the workspace ( *acquisition.m* ) and then conditioned for further
computations ( *conditioning.m* ). In *extraction.m* values such as friction force,
acceleration and distance travelled are computed basing on the input.
Script *optimization.m* adjusts coefficients of the friction model ( *friction_model.m* )
to experimental data and writes them to */output/coeffs_for_friction_model.mat*.
*visualization.m* creates and saves comprehensive plots to /output in two formats: .fig and .png.

## Adjustments
Any code that is prone to change in the first place is put on the top of each script
for the user to interact. If any part of *main.m* cannot be run (lack of required packages,
MATLAB version compatibility issues), input directory contains workspace instances
from previous steps. They can be loaded in *main.m* by uncommenting lines put in each section.

## Requirements
The scripts were written in MATLAB 2020a and use the following packages:
* Signal toolbox (for *butter()* and *filter()* )
* Optimization toolbox (for *lsqcurvefit()* )
