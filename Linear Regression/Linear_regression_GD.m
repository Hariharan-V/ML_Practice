%%%%%Linear Regression Using Closed Form%%%%%%%%
A = importdata('./Admission_Predict_Ver1.1.csv');
A = A.data;
X = A(:,(1:8));

X_t = transpose(X);
Y = A(:,9);
Xt_X = X_t*X;
disp("Linear Regression Using Closed Form")
tic
W_perf = inv(Xt_X)*X_t*Y;
toc
 disp("Error = "+norm(Y-X*W_perf,2))
%%%%%Linear Regression Using Gradient Descent%%%%%%%%
disp("Linear Regression Using Gradient Descent")
W = zeros(8,1);

slope = 2*X_t*Y-2*Xt_X*W;
N = 0.001;
tic
while norm(slope-zeros(8,1))>.1
    W = W - N*slope;
    slope = 2*X_t*Y-2*Xt_X*W;
   if slope==Inf
       break;
   end
end
toc
disp("Error = "+norm(Y-X*W_perf,2))
%%%%%Linear Regression Using Stochastic Gradient Descent%%%%%%%%
disp("Linear Regression Using Stochastic Gradient Descent")
A = A(randperm(size(A, 1)), :);%%shuffle dataset
X = A(:,(1:8));
Y = A(:,9);
slope = 0;
N = 0.001;
tic
[row,column] = size(X);
while norm(slope-zeros(8,1))>.1
    W = W - N*slope;
    n = unidrnd(column);
    slope = 2*transpose(X(n,:))*Y(n)-2*transpose(X(n,:))*X(n,:)*W;%%pick random data points to calculate gradient
   if slope==Inf
       break;
   end
end
toc
disp("Error = "+norm(Y-X*W_perf,2))

