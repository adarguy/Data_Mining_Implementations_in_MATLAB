% See https://www.gnu.org/software/octave/doc/interpreter/Quadratic-Programming.html

X=[1 2;
   2 1; 
   3 4;
   4 2];
   
y=[+1; -1; +1; -1];

n=rows(X);

H=(y*y').*(X*X')
q=-ones(n,1);

A=y';
b=[0];

lb=zeros(n,1);

% qp (a0, H,  q,  A,  b, lb, ub)
a=qp ([],  H,  q,  A,  b, lb, []) 

