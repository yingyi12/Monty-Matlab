% Create the class 'FrequencySignalClass'
classdef FrequencySignalClass<SignalClass
   
    properties
        frequency;
        frequencyUnit;
    end
    methods
        function obj=FrequencySignalClass()
            obj=obj@SignalClass;
            obj.frequency=[];
            obj.frequencyUnit=[];
        end
    end
end  