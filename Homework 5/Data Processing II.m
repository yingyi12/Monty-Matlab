function [XTrain, YTrain, XTest, YTest] = load_dataset(filenames_xtrain, filenames_xtest, filename_ytrain, filename_ytest)
% You can use the functions from previous tasks: 

%   data=load_file(filename)
%   filename        name of a text file to be imported
%   data            double array containing the content of the text file

%   stacked_data=load_group(filenames)
%   filenames       names of text files to be imported
%   stacked_data    multidimentional double array containing the data of the text files

%   data_cell=convert_to_cell(stacked_data)
%   stacked_data    multidimentional double array containing the data of the text files
%   data_cell       cell array containing the reordered data of stacked_data

% Your code here
stacked_data_XTrain=load_group(filenames_xtrain);
stacked_data_YTrain=load_file(filename_ytrain);
stacked_data_XTest=load_group(filenames_xtest);
stacked_data_Ytest=load_file(filename_ytest);

XTrain = convert_to_cell(stacked_data_XTrain);
YTrain = categorical(stacked_data_YTrain);
XTest = convert_to_cell(stacked_data_XTest);
YTest = categorical(stacked_data_Ytest);



end

