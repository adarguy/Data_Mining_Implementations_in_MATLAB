graphics_toolkit ("gnuplot");

X=[2 2.441;
   3 3.441;
   1.6 3.04;
   2.1 3.56;
   1.41, 5.30;
   1.23 5.61;
   2.7 -0.77;
   3.88 0.43;
   4.4 0.05;
   3.55 -0.75;
   4.02 -1.06;
   4.7 -0.77;
   3.25 2.28]; %last point is the noise red point
   
y=[+1; +1; +1; +1; +1; +1; -1; -1; -1; -1; -1; -1; -1];

%plot points
clf;
hold on
for k=1:n
  if (y(k)==1)
    plot( X(k,1), X(k,2), 'b')
  else
    plot( X(k,1), X(k,2), 'r')
  endif
end;


n=rows(X);
m=columns(X)+1;

X=[ones(n,1) X];

H=eye(m); H(1,1)=0;
H=2*[H zeros(m,n); 
     zeros(n,m) zeros(n,n)];
     
C=1;     
q = C*[zeros(1,m) ones(1,n)]';
   
A_in = [y.*X   eye(n)]
A_lb = ones(n,1);

lb = [-Inf*ones(1,m)  zeros(1,n)]';

% qp (w0, H,  q,  A,  b, lb, ub, A_lb, A_in, A_ub)
p=qp ([],  H, q, [], [], lb, [], A_lb, A_in,   []);

w=p(1:m);
ksi=p(m+1:m+n);

objective_function = (1/2)*(w'*w) + C*ones(1,n)*ksi;
margin=1/sqrt(w'*w);

%plot line
b=-w(1)/w(3); a=-w(2)/w(3);
fplot(@(L)a*L+b,[0,7]);

hold off

