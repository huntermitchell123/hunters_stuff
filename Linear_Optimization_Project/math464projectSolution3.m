% Hunter Mitchell - 5/1/20
% Math 464 Project

%
% This file is based on a mixed-integer program of the form
%
%    min    f(x)=c'x
%    s.t.   A * x <= b
%           Ae * x = be
%           lb <= x <= ub
%           x(I) is integer
%


m=30
k=300

% We have the objective vector
c=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];

% Inequality (upper bound) constraints
A=[1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
   0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0
   0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0
   0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0
   1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0
   0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0
   0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0
   0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0
   k 11 23 16 11 k 7 12 23 7 k 21 16 12 21 k -1
   -k -11 -23 -16 -11 -k -7 -12 -23 -7 -k -21 -16 -12 -21 k -1];
b=[1;1;1;1;1;1;1;1;m;-m];

% Equality constraints
Ae=[1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0];
be=[1;1];

% Box constraints on some variables
lb=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
ub=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 inf];

% The variables that are restricted to integer values
I=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];

% We request that the results be displayed to us
dflag=true;

% Call the function
[xstar,zstar]=mip(c,A,b,Ae,be,lb,ub,I,dflag);
