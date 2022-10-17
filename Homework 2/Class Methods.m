% Fill in code for the class 'TimeSignalClass' so that it meets the requirements specified in the problem statement
classdef TimeSignalClass<SignalClass
    properties
        time;
        timeUnit;
    end
    
    methods
        % Constructor
        function  obj = TimeSignalClass()
            obj.time=[];
            obj.timeUnit='';
            obj.data=[];
            obj.dataUnit='';
            obj.description='';
            obj.signalName='';
        end
        
        % Import function
        function importFileData(obj, fullFileName)
            measurementStruct = load(fullFileName);
            
            obj.signalName  = measurementStruct.SignalName;
            obj.description = measurementStruct.Comment;
            
            obj.data     = measurementStruct.(obj.signalName);
            obj.dataUnit = measurementStruct.([obj.signalName '_Unit']);
            
            obj.time     = measurementStruct.([obj.signalName '_t']);
            obj.timeUnit = measurementStruct.([obj.signalName '_t_Unit']);
        end
        
        % Resample function
        function resample(obj,newTimeVector)
           newSignalData = interp1(obj.time, obj.data, newTimeVector); 
           obj.data = newSignalData;
           obj.time = newTimeVector;
        end
        
    end
end