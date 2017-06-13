% FEATURE_ENGINEERING removes features from data that don't contribute signal
function [data] = feature_engineering(data)

% Remove Passenger Id
data(:, 1) = [];

% Remove Passenger Name
data(:, 4) = [];

% Change male/female to 1/0
data(:, 5) = (data(:, 5) == 'male')(:, 1);

end
