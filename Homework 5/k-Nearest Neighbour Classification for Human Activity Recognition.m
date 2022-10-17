% Perform the following steps
%   1) Import text files
%   2) Train kNN model
%   3) Classify XTest
%   4) Calculate accuracy
%   5) Visualize results

%   You can use the function from the previous task: data=load_file(filename)
%   filename        name of a text file to be imported
%   data            double array containing the content of the text file
XTrain = load_file('XTrain.txt');
YTrain = load_file('YTrain.txt');
XTest = load_file('XTest.txt');
YTest = load_file('YTest.txt');
mdl = fitcknn(XTrain,YTrain,'NumNeighbors',1);
predictions = predict(mdl,XTest);
rloss = resubLoss(mdl);
a = numel(find((predictions-YTest)==0));
b = numel(YTest);
accuracy = a/b*100
c = confusionchart(YTest,predictions);

