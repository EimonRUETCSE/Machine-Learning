function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
%prediction=zeros(size(X,2),1);
p_derivative=zeros(size(X,2),1);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

  % prediction_1= (((X*theta)-y).*X(:,1));
  %p_derivative_1=(sum(prediction_1)*alpha)/m;
  %prediction_2= (((X*theta)-y).*X(:,2));
  %p_derivative_2=(sum(prediction_2)*alpha)/m;
  % prediction_3= (((X*theta)-y).*X(:,3));
 % p_derivative_3=(sum(prediction_3)*alpha)/m;
  
  for i=1:size(X,2)
      prediction= (((X*theta)-y).*X(:,i));
  p_derivative(i)=(sum(prediction)*alpha)/m;
  
  end
  
   for i=1:size(X,2)
   theta(i)=theta(i)-p_derivative(i);
   end
   
    % theta(1)=theta(1)-p_derivative_1;
    % theta(2)=theta(2)-p_derivative_2;
    % theta(3)=theta(3)-p_derivative_3;
     
     
     fprintf('I=%d, theta_1= %f,theta_2= %f ,theta_3= %f\n',iter,theta(1),theta(2),theta(3));









    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
