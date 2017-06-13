%% ================= Feature Engineering =================

fprintf('Loading data...\n');

% Load training data
data = csvread('data/train.csv');

% Remove feature labels
data = data(2:size(data, 1),:);

% Split data into features and classifications
% Start features from column 2 to remove passenger ids
train_X = data(:, 2:(size(data, 2) - 1));
train_y = data(:, size(data, 2));

% Add column of 1s for intercept term
train_X = [ones(size(train_X, 1), 1) train_X];

%% ================= Regularized Logistic Regression =================

% Initialize fitting parameters
theta = zeros(size(train_X, 2), 1);

% Set regularization parameter to 1
lambda = 70;

% Set number of iterations of Gradient Descent
iterations = 400;

options = optimset('GradObj', 'on', 'MaxIter', iterations);

fprintf('Running Gradient Descent...\n');

% Optimize using fminunc
[theta, J, exit_flag] = ...
    fminunc(@(t)(cost_function_reg(t, train_X, train_y, lambda)), theta, options);

p = predict(theta, train_X);

fprintf('Training Accuracy: %f\n', mean(double(p == train_y)) * 100);

test_data = csvread('data/test.csv');

% Cache passenger ids for later
passenger_ids = test_data(2:size(test_data, 1), 1);

% Remove feature labels and passenger ids
test_data = test_data(2:size(test_data, 1), 2:size(test_data, 2));

% Add column of 1s for intercept term
test_data = [ones(size(test_data, 1), 1) test_data];

% Predict survival of test examples
p = predict(theta, test_data);

% Add passenger ids back to p
p = [passenger_ids p];

% Write predictions to csv file
csvwrite('data/predictions.csv', p);

fprintf('Predictions for testing data are stored in data/predictions.csv!');

