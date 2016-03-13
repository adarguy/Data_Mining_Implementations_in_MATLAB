
X=[1 2;
   2 1; 
   3 4;
   4 2];
   
y=[+1; -1; +1; -1];

n=rows(X);
m=columns(X)+1;

X=[ones(n,1) X];

H=eye(m); H(1,1)=0;
A_in=y.*X;
A_lb=ones(n,1);

% qp (w0, H,  q,  A,  b, lb, ub, A_lb, A_in, A_ub)
w=qp ([],  H, [], [], [], [], [], A_lb, A_in,   [])

