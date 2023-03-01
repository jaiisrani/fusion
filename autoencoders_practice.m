%% practising autoencoders %%
% build the dataset with features along rows %

% dataset %

X = abalone_dataset; % features along rows, datapoints along columns

% build and train (simultaneously) the autoencoder with various parameters %

         % autoenc_trained = trainAutoencoder(X); % the simple way. Or else:
autoenc_trained = trainAutoencoder(X, 4, ...
    'MaxEpochs', 400, ...
    'EncoderTransferFunction', 'satlin', ...
    'DecoderTransferFunction', 'purelin', ... % linear transfer function for decoder
    'L2WeightRegularization',0.004,...
    'SparsityRegularization',4,...
    'SparsityProportion',0.15);
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

view(autoenc);
         % view(stackednet);

% make predictions using the trained autoencoder %

XReconstructed = predict(autoenc_trained, X);

% compute errors in predicted dataset wrt original dataset %

mseError = mse(X - XReconstructed);