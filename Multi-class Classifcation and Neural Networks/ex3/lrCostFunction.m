function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

t_y=y';
temp=X*theta;

temp_1= -t_y*log(sigmoid(temp));

temp_2=(1-t_y)*log(1-sigmoid(temp));

% for regularization %
reg= lambda/(2*m);

t=zeros((size(X,2)-1),1);

t= power(theta(2:size(X,2)),2);

J=((temp_1-temp_2)/m)+ reg*sum(t);


% =============================================================

temp_X=X(:,1);
t_x=temp_X';
grad(1)= (t_x*(sigmoid(temp)-y))/m;

temp_X_Rest=X(:,2:size(X,2));
t_x=temp_X_Rest';
temp_t=theta(2:size(theta,1));


grad(2:size(X,2))=(((t_x*(sigmoid(temp)-y))/m)+((lambda/m).*temp_t));








% =============================================================

grad = grad(:);

end
