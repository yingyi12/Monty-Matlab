WeatherData = getWeatherDataGMT;
TemperatureC = convertFtoC(WeatherData.TemperatureF);
addTempC(WeatherData,TemperatureC);
WeatherData.Timestamps.TimeZone = '+00:00';
zone = timezones('America');
WeatherData.Timestamps.TimeZone = 'America/New_York';