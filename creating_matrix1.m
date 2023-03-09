% Building the dataset, i.e., a matrix of dimension (NumFeatures, NumPoints ...
% ... where NumFeatures is the number of features, and represented along ...
% ... rows of the matrix, and NumPoints is the number of data points, ...
% ... and represented along the columns of the matrix)


% Training dataset

training_data = zeros(3, 3000);
for i = 1 : 1 : 3000
    training_data(:, i) = [1.*(i/3000)^2 2.*(i/3000)^2 3.*(i/3000)^2];
end

% Testing dataset

testing_data = zeros(3, 1);
testing_data(:, 1) = [0.20, 0.55, 0.75]; % corresponding to i=1500

save("datasets.mat", "training_data", "testing_data");