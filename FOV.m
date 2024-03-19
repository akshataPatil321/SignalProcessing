% Akshata Patil
% Function computes the FOV of a satellite 
% The result gives the footprint of a satellite (coverage) and the angle
% User needs to input the altitude at which satellite is present
clc
clear all 
close all
% Computing LEO coverage:
LEO_alt = 2000;
[coverage_LEO, theta_LEO] = FOVm(LEO_alt);

% Computing MEO coverage:
MEO_alt = 20000;
[coverage_MEO, theta_MEO] = FOVm(MEO_alt);

% Computing GEO coverage:
GEO_alt = 35786;
[coverage_GEO, theta_GEO] = FOVm(GEO_alt);

function [coverage, theta] = FOVm(alt)
% Radius Of Earth:
r = 6371;
theta = 2 * atand(r/(r+ alt));
% From the center of the Earth:
half_footprint = r * (alt/(r + alt));
phi = 2 * atan(half_footprint/r);
coverage = r * phi;
end