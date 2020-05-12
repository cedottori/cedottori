function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta)-1

% You need to return the following variables correctly 
%theta = test_theta
J = 0;
grad = zeros(size(theta));
%theta = initial_theta
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

% lambda     
summation_lambda = (lambda/(2*m)) * (sum(theta(2:n).^2))

J = summation + summation_lambda

% GRADIENT PART
for j = 1:length(theta)
      
    subtraction   = hypothesis-y;
    multiply      = subtraction.*X(:,j); # multiplies by vector of values
    grad(j,1)     = sum(multiply)/m;
    
    if (j>1)
      grad(j,1) = grad(j,1) + (lambda/m)*(theta(j,1))    
    endif
      
endfor

end
