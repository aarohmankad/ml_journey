function [J, grad] = cost_function_reg(theta, X, y, lambda)
%   COST_FUNCTION_REG Compute cost and gradient for logistic regression with regularization
%   J = COST_FUNCTION_REG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

 % number of training examples
m = length(y);

J = 0;
grad = zeros(size(theta));

% hypothesis vector
h = sigmoid(X * theta);

% unregularized portion of cost fn.
unregularized = (1 / m) * (-y' * log(h) - (1 - y)' * log(1 - h));

% Set theta(1) to 0 to prevent regularizing intecept term
theta(1) = 0;
% regularization portion of cost fn.
regularized = (lambda / (2 * m)) * (theta' * theta);

J = unregularized + regularized;

% Gradient vector per theta
grad = (1 / m) * (X' * (h - y)) + (lambda / m) * theta;

% =============================================================

end
