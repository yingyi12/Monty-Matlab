function [layers, options] = specify_network()
% Your code here
layers = [sequenceInputLayer(9)
lstmLayer(15,'OutputMode','last') 
dropoutLayer 
reluLayer 
fullyConnectedLayer(2)
softmaxLayer 
classificationLayer];

options = trainingOptions('adam', 'MaxEpochs',15, 'MiniBatchSize',64, 'Verbose',0, 'GradientThreshold',1);



end

