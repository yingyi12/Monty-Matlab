% Your code here

sigObj1 = TimeSignalClass;
sigObj1.signalName = 'P';
sigObj1.description = 'Power of XYZ, Sensor ABC';
sigObj1.time = linspace(0,10,1001); 
sigObj1.timeUnit = 's';
sigObj1.data = sin(sigObj1.time);
sigObj1.dataUnit = 'W';

sigObj2 = sigObj1;
sigObj2.signalName = 'different name';

isequal(sigObj1.signalName,sigObj2.signalName)