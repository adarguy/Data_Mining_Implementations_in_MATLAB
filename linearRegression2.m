X=[
3	0.2	;
1	0.3	;
4	0.5	;
2	0.7	;
0	1	;
1	1.2	;
1	1.7	;
6	0.2	;
7	0.3	;
6	0.7	;
3	1.1	;
2	1.5	;
4	1.7	;
2	1.9	;
];

y=[
0;
0;
0;
0;
0;
0;
0;
1;
1;
1;
1;
1;
1;
1
];

X = X'
y = y'

w=[0.1;	0.1; 0.1];
eta = 0.1;              %Chose eta so that the error curve is decreasing
n = length(y);

plotpv(X,y)
net = perceptron;
net = train(net,X,y);
plotpv(X,y);
plotpc(net.IW{1},net.b{1});

XX = repmat(con2seq(X),1,3);
TT = repmat(con2seq(y),1,3);
net = adapt(net,XX,TT);
plotpc(net.IW{1},net.b{1});
