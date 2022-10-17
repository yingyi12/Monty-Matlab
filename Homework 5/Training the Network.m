% You can use all functions that were implemented in previous tasks: 

%   data=load_file(filename)
%   filename        name of a text file to be imported
%   data            double array containing the content of the text file

%   stacked_data=load_group(filenames)
%   filenames       names of text files to be imported
%   stacked_data    multidimentional double array containing the data of the text files

%   data_cell=convert_to_cell(stacked_data)
%   stacked_data    multidimentional double array containing the data of the text files
%   data_cell       cell array containing the reordered data of stacked_data

%   [XTrain, YTrain, XTest, YTest] = load_dataset(filenames_xtrain, filenames_xtest, filename_ytrain, filename_ytest)
%   filenames       names of files containing training and test data
%   XTrain/YTrain   training data    
%   XTest/YTest     test data

%   [layers, options] = specify_network()
%   layers          architecture of the network
%   options         training options for the network

% Your code here
filenames_xtrain = {'total_acc_x_train.txt'; 'total_acc_y_train.txt'; 'total_acc_z_train.txt'; ...
                    'body_acc_x_train.txt'; 'body_acc_y_train.txt'; 'body_acc_z_train.txt'; ...
                    'body_gyro_x_train.txt'; 'body_gyro_y_train.txt'; 'body_gyro_z_train.txt'};
               
filenames_xtest = {'total_acc_x_test.txt'; 'total_acc_y_test.txt'; 'total_acc_z_test.txt'; ...
                   'body_acc_x_test.txt'; 'body_acc_y_test.txt'; 'body_acc_z_test.txt'; ...
                   'body_gyro_x_test.txt'; 'body_gyro_y_test.txt'; 'body_gyro_z_test.txt'};
              
filename_ytrain = 'y_train.txt';
filename_ytest = 'y_test.txt';
[XTrain, YTrain, XTest, YTest] = load_dataset(filenames_xtrain, filenames_xtest, filename_ytrain, filename_ytest);
[layers, options] = specify_network();
 net = trainNetwork(XTrain, YTrain,layers,options);
 predictions = classify(net,XTest);
accuracy = sum(double(predictions) == double(YTest))/numel(YTest)*100;
c = confusionchart(YTest,predictions)

