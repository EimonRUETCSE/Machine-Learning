function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

 
 
   
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
  
    prediction_1= (((X*theta)-y).*X(:,1));
  p_derivative_1=(sum(prediction_1)*alpha)/m;
  prediction_2= (((X*theta)-y).*X(:,2));
  p_derivative_2=(sum(prediction_2)*alpha)/m;
  
   
     theta(1)=theta(1)-p_derivative_1;
     theta(2)=theta(2)-p_derivative_2;
     
     fprintf('I=%d,J=%d\n theta_1= %f,theta_2= %f\n',iter,j, theta(1),theta(2));
    
     
   
   % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
end


end
