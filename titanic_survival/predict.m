function p = predict(theta, X)
%   PREDICT Predict whether the label is 0 or 1 using learned logistic
%   regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

% Number of training examples
m = size(X, 1);

p = zeros(m, 1);

% p is a vector of 0s and 1s depending on threshold
% value of 0.5 through sigmoid function
p = sigmoid(X * theta) >= 0.5;

% =========================================================================


end
