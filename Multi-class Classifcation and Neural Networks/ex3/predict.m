function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
a_1=X;
for i=1:2
    eval(['a_' num2str(i) '=[ones(m, 1) a_' num2str(i) '];']);
    eval(['Theta_t_' num2str(i) '=transpose(Theta' num2str(i) ');']);
    eval(['z_' num2str(i+1) '=a_' num2str(i) '*Theta_t_' num2str(i) ';']);
    eval(['a_' num2str(i+1) '=sigmoid(z_' num2str(i+1) ');']);
end

%a_1 = [ones(m, 1) a_1];
%Theta1_t=Theta1';
%z_2=a_1*Theta1_t;
%a_2=sigmoid(z_2);

%Theta2_t=Theta2';
%a_2=[ones(m,1) a_2];
%z_3=a_2*Theta2_t;
%a_3=sigmoid(z_3);

[temp_max,I]=max(a_3,[],2);
p=I;






% =========================================================================


end
