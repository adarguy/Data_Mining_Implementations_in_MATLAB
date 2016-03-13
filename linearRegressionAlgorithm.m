filename = 'regdata.csv';
M = csvread(filename);

M(:,1) = M(:,1) - mean(M(:,1)/std(M(:,1) ))
M(:,2) = M(:,2) - mean(M(:,2)/std(M(:,2) ))
M(:,3) = M(:,3) - mean(M(:,3)/std(M(:,3) ))

X=[1 1;
   1 2];
y=[1.5; 2];
w=[2; 2];
kappa = .13;
n = length(y);
E = [];
for t=1:10
  w = w + kappa*(1/n)*((y-X*w)'*X)';
  error = (1/(2*n))*sum((y-X*w).^2);
  E = [E error];
end;

plot(E);