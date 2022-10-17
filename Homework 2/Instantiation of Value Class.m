% Create object sigObj1 belonging to TimeSignalClass
% Change its default values according to the problem description
% Copy sigObj1 to a variable called sigObj2 and change the second object's signal name
% Analyze your code's the memory usage
sigObj1 = TimeSignalClass();
sigObj1.signalName = 'P';
sigObj1.description = 'Power of XYZ, Sensor ABC';
sigObj1.time = linspace(0,10,1001); 
sigObj1.timeUnit = 's';
sigObj1.data = sin(sigObj1.time);
sigObj1.dataUnit = 'W';

sigObj2 = sigObj1;
sigObj2.signalName = 'This object has a different name';

whos