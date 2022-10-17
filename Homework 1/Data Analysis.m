% Struct called dataStruct from previous exercise
dataStruct;

% 1) Calculate average age of all users
% 2) Calculate average number of contacts of all users
% 3) Determine risk group

data = struct2table(dataStruct);
averageAge = mean(data.Age,'all')

cont = cellfun(@numel,data.Contact_ID);
averageContact = sum(cont)/numel(cont)

riskgroup = cat(1, find(data.Age>60), find(data.Preexisting_Conditions==true))
risk = unique( riskgroup );
riskUserId = transpose(data.User_ID(risk));
