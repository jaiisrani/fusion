%% practising autoencoders %%
% build the dataset with features along rows %

load training_data_and_labels.mat training_data;

% dataset %

X = transpose(training_data); % features along rows, datapoints along columns
X_train = X(:, 1:500000);

% build and train (simultaneously) the autoencoder with various parameters %

          %autoenc_trained = trainAutoencoder(X); % the simple way. Or else:
autoenc_trained = trainAutoencoder(X_train, 5, ... 
    'MaxEpochs', 200, ...
    'EncoderTransferFunction', 'satlin', ...
    'DecoderTransferFunction', 'purelin', ... % linear transfer function for decoder
    'L2WeightRegularization',10^(-6),...
    'SparsityRegularization',0.004,...
    'SparsityProportion',0.4);
         % features = encode(autoenc_trained,X); % X need not be training data
         % Y = decode(autoenc_trained, features); % So Y is the ...
         % ... reconstructed of input data X on the trained autoencoder
         % softnet = trainSoftmaxLayer(features,T); Note that you need ...
         % ... classes for training SoftMax layer, whereas for autoencoder, ...
         % ... you don't. Features and data points are enough for the ...
         % ... latter. There comes the difference bw supervised and ...
         % ... unsupervised learning.
         % stackednet = stack(autoenc,softnet);
         
         % Extra: training a SoftMax layer:
                    % [X,T] = iris_dataset; % it has features, data, classes
                    % net = trainSoftmaxLayer(X,T); % train the softmax layer
                    % Y = net(X); % make predictions using the layersoftmax layer 
                    % plotconfusion(T,Y);

% view the autoencoder %

%view(autoenc_trained);
         % view(stackednet);

% loading the testing dataset

X_test = X(:, 500000:end);%testing_data;
         
% make predictions using the trained autoencoder %

XReconstructed = predict(autoenc_trained, X_test);

% compute errors in predicted dataset wrt original dataset %

mseError = mse(X_test - XReconstructed);

% plotting the predicted trajectory points
figure;
plot3(XReconstructed(1, :), XReconstructed(2, :), XReconstructed(3, :));
figure;
plot3(X_test(1, :), X_test(2, :), X_test(3, :));