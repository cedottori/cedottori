function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
%theta = test_theta
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% multiply theta by X
results1      = X*theta % should be theta'*X
hypothesis    = sigmoid(results1)

term_cost     = (-y.*(log(hypothesis))) - ((1-y).*(log(1-hypothesis)))

summation     = (sum(term_cost)/m)

J = summation

% GRADIENT PART
for j = 1:length(theta)
      
    subtraction   = hypothesis-y;
    multiply      = subtraction.*X(:,j); # multiplies by vector of values
    grad(j,1)     = sum(multiply)/m;
      
endfor


% =============================================================

end
