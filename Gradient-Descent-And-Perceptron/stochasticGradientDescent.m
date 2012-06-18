% Jun Xie
% Implementation for Stochastic Gradient Descent

function [theta_new, theta] = stochasticGradientDescent(training_features, training_values, feature_number, theta_vec )

training_number = length(training_features);
% The step size
alpha = 1/training_number;
precision = 1e-4;
theta_old = theta_vec;
flag = 1;
k = 1;

while flag
  % Stochastic gradient descent - loop over one training set at a time
  for i=1:training_number
    h_theta = training_features(i, :) * theta_old;
    theta(k, :) = theta_old';
    h_theta_v = h_theta * ones(1, feature_number);
    y_v = training_values(i,:) * ones(1, feature_number);
    theta_new = theta_old - alpha * (h_theta_v - y_v)*training_features(i,:).';
    if sum(abs(theta_new - theta_old)) < precision
    flag = 0;
    end
    theta_old = theta_new;
    k = k + 1;
  end
end
