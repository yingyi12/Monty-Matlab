% Complete the following template according to this exercise's problem description
classdef Data < handle
    
    properties (SetObservable,AbortSet)
        TimeVector;
        DataMatrix;
        
    end

    methods 
       
        function importData (obj,fileName)
            S = load(fileName, '-ascii')
            obj.TimeVector = S(:,1);
            obj.DataMatrix = S(:,2:end);
        end
        
        function exportData (obj,fileName)
            S(:,1) = obj.TimeVector;
            [~,m] = size(obj.DataMatrix)
            S(:,2:(m+1)) = obj.DataMatrix;
            save(fileName,'S','-ascii')
        end
        
    end
end