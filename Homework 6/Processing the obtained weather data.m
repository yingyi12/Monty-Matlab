WeatherData = getWeatherDataGMT;
% convert the temperature in Fahrenheit to temperature in °Celsius
TemperatureC = (WeatherData.TemperatureF-32)/(9/5);