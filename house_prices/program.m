%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = csvread('data/dataset.csv');

% Store first row of labels in row vector
feature_labels = data(1, :);

% Remove first row of feature labels
data(1, :) = [];

% Break data into training/testing segments
test_data_size = size(data, 1) / 10;
test_data = data(1:test_data_size, :);
data(1:test_data_size, :) = [];

% Separate feautures, and labels out of data
X = data(:, 1:38);
y = data(:, 39);
m = length(y);

fprintf('Normalizing features...\n');

[X mu sigma] = featureNormalize(X);

%% ================ Part 2: Cost and Gradient Descent ================

% Add column of ones to X
X = [ones(m, 1) X];

% Initialize fitting parameters
theta = zeros(39, 1);

% Some gradient descent settings
iterations = 1500;
alpha = 0.1;

fprintf('Running Gradient Descent...\n');

% Run Gradient Descent
theta = gradientDescent(X, y, theta, alpha, iterations);
fprintf('Thetas found by Gradient Descent:\n');
fprintf('%f\n', theta);

%% ================ Part 3: Run Algorithm on Testing Data ================

fprintf('Running Algorithm on Testing Data...\n');

% Separate feautures, and labels out of testing data
test_data_X = test_data(:, 1:38);
test_data_y = test_data(:, 39);
m = length(test_data_y);

% Normalize testing features
test_data_X = (test_data_X - mu) ./ sigma;
test_data_X = [ones(m, 1) test_data_X];

% Predict Housing Prices for test_data
hypothesis_data_Y = test_data_X * theta;

% Display accuracy between y and hypothesis
accuracy = corr(test_data_y, hypothesis_data_Y);
fprintf('Accuracy of Learning Algorithm: %f\n', accuracy);

