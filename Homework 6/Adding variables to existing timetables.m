WeatherData = getWeatherDataGMT;
TemperatureC = convertFtoC(WeatherData.TemperatureF);
WeatherData = addvars(WeatherData,TemperatureC);