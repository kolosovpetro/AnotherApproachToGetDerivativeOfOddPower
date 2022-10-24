(* ::Package:: *)

BeginPackage["AlternativeDerivativeMathematicaPackage`"]

A::usage= "A[n, k] returns the real coefficient A of non-negative integers n, k such that n <= k. 
See https://kolosovpetro.github.io/pdf/AStudyOnDynamicEquations.pdf."

f::usage= "f[x, y, z] returns the polynomial."
g::usage= "g[x, y] returns exponential function."
DividedDifferenceFbyX::usage = "Divided difference of f by X"
DividedDifferenceFbyZ::usage = "Divided difference of f by Z"

Begin["`Private`"]

Unprotect[Power];
Power[0|0., 0|0.] = 1;
Protect[Power];

A[n_, k_] := 0;
A[n_, k_] := (2k + 1) * Binomial[2k, k] * Sum[A[n, j] * Binomial[j, 2k + 1] * (-1)^(j - 1) / (j - k) * BernoulliB[2j - 2k], {j, 2k + 1, n}] /; 0 <= k < n;
A[n_, k_] := (2n + 1) * Binomial[2n, n] /; k == n;

f[x_, y_, z_] := Sum[Sum[A[y, r] * k^r * (x - k)^r, {r, 0, y}], {k, 1, z}];
g[x_, y_] := x ^ (2*y + 1);
DividedDifferenceFbyX[x_, y_, z_, d_] := (f[x + d, y, z] - f[x, y, z]) / d;
DividedDifferenceFbyZ[x_, y_, z_, d_] := (f[x, y, z+d] - f[x, y, z]) / d;

End[ ]

EndPackage[ ]










