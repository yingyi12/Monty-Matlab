function cbUpdate(obj)
% Update table data
obj.Table.RowName = obj.Data.TimeVector
obj.Table.Data = obj.Data.DataMatrix

% Update axis
plot(obj.Data.TimeVector,obj.Data.DataMatrix)

end