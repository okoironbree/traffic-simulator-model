# Dublin Traffic Simulation Model

A MATLAB-based simulation modelling traffic flow and congestion 
patterns, using a Nagel–Schreckenberg cellular automaton approach, 
built as a foundation for a future Dublin road network model.

## Overview
This project applies mathematical and computational modelling to 
simulate real-world traffic congestion behaviour. It was built 
independently, outside of coursework, in my own time, driven by an 
interest in applying engineering methods to real-world urban 
problems. I plan to continue expanding it into a full interactive 
website, time permitting alongside my coursework.

## How it works
The model simulates a single-lane, looped road using four simple 
rules governing vehicle acceleration, deceleration, randomised 
braking, and movement. Despite the simplicity of these rules, 
realistic "phantom jams" emerge naturally from vehicle interactions — 
this version serves as a proof of concept before scaling up to a 
larger, multi-lane Dublin network.

## Problems faced
Getting the simulation to redraw and update each car's position 
every timestep, rather than generating all 50 vehicles as static, 
separate instances

## Future plans
- Incorporate real traffic data (e.g. from Dublin City Council's 
open data portal or TII)
- Extend the model to a multi-lane, geographically mapped road network
- Build out into a full interactive website to make traffic data 
more visual and accessible for public use

## Tech used
MATLAB

## Author
Brigid Okoiron — Second Year Engineering with Management, 
Trinity College Dublin
