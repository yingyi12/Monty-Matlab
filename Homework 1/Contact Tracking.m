% Data struct from previous exercise
dataStruct;

% 1) Create container mapping contactMap
% 2) Save all user IDs that need to be tracked in userIdToTrack
data = struct2table(dataStruct)
keys = data.User_ID
values = data.Contact_ID
contactMap = containers.Map(keys,values);
track = find(data.Infection == true);
userIdToTrack = unique(cell2mat(data.Contact_ID(track)));

userIdToTrack = setdiff(userIdToTrack,userIdToTrack(track))
userIdToTrack = transpose(userIdToTrack) 