WeatherData = ReadProcessDefineTimeZone;
vars = WeatherData.Properties.VariableNames;
sp = stackedplot(WeatherData,vars([3,9,8]));