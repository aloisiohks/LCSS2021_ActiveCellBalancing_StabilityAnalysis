# LCSS2021_ActiveCellBalancing_StabilityAnalysis


[![DOI](https://zenodo.org/badge/410101214.svg)](https://zenodo.org/badge/latestdoi/410101214)

This repository contains the Matlab Simulink files used in the following paper 

<a href="https://ieeexplore.ieee.org/document/9488286">M. S. Trimboli, A. K. de Souza and M. A. Xavier, "Stability and Control Analysis for Series-Input/Parallel-Output Cell Balancing System for Electric Vehicle Battery Packs," in IEEE Control Systems Letters, vol. 6, pp. 1388-1393, 2022, doi: 10.1109/LCSYS.2021.3097875.</a>

The simulation does not account the DC-DC converter dynamics because the goal of the paper above is to demonstrate closed-loop stability of the PID based active cell balancing architectire under different scenarios. If you would like to contribute to this simulink model by adding the DC-DC converters and other features, let me know.

Issues to be fixed:
- Istring is considered to be constant throught the simulation, It would be interesting to be able to use dynamic current profiles, such as UDDS profiles. That will be fixed at some point. You're welcome to help with that. 
- When the simulation is running, some warning messages about algebraic loops pops up on the console but I don't know how to fix that yet. 
