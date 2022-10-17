% Callback for data import.
% obj is an object of class TmpImport.
function cbImport(obj)
fileName = uigetfile
obj.Data.importData(fileName)

end