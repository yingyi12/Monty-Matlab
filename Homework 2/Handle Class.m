% Fill in code for the handle class 'TimeSignalClass'

classdef TimeSignalClass < handle
    
    properties
        time
        timeUnit
        data
        dataUnit
        description
        signalName
    end
    
    methods
        function obj = TimeSignalClass()
            obj.time = [];
            obj.data = [];
            obj.timeUnit =  char.empty;
            obj.dataUnit = char.empty;
            obj.description =  char.empty;
            obj.signalName =  char.empty;
        end
    end
end