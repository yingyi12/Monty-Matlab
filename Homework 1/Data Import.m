% 1) Import data from 'CoronaTrackingData.xlsx'.
% 2) Convert table columns to correct format.
% 3) Convert table to struct array.
data = readtable('CoronaTrackingData.xlsx');

data.Infection = cellfun(@(x) strcmp(x,'yes'), data.Infection,'un',0);
data.Preexisting_Conditions = cellfun(@(x) strcmp(x,'yes'), data.Preexisting_Conditions,'un',0);
data.Contact_ID = cellfun(@(x) (str2num(x)),data.Contact_ID,'un',0 )

dataStruct = table2struct(data)