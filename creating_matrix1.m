% Building the dataset, i.e., a matrix of dimension (NumFeatures, NumPoints ...
% ... where NumFeatures is the number of features, and represented along ...
% ... rows of the matrix, and NumPoints is the number of data points, ...
% ... and represented along the columns of the matrix)


% Training dataset

training_data = zeros(3, 3000);
for i = 1 : 1 : 3000
    training_data(:, i) = [1.*i/3000 2.*i/3000 3.*i/3000];
end

% Testing dataset

testing_data = zeros(3, 1);
testing_data(:, 1) = [0.2, 0.4, 0.8];

save("datasets.mat", "training_data", "testing_data");