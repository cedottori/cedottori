function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
newTheta  = theta;

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    J        = computeCostMulti(X, y, newTheta);
    
    # update theta
    lastTheta=newTheta
    for j = 1:length(theta)
      
        hypothesis    = X*lastTheta;
        subtraction   = hypothesis-y;
        multiply      = subtraction.*X(:,j); # multiplies by vector of values
        newTheta(j,1) = lastTheta(j,1)-(alpha*((1/m)*(sum(multiply))));
      
    endfor
    lastTheta=newTheta;
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = J;


    % ============================================================
end

theta = lastTheta

end
