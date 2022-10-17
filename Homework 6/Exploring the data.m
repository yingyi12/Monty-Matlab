WeatherData = ReadToVisualize;

[maxHumidity,maxHumidity_index] = max(WeatherData.Humidity);
timeMaxHumidity = WeatherData.Timestamps(maxHumidity_index);

[maxLightIntensity,maxLightIntensity_index] = max(WeatherData.LightIntensity);
timeMaxLightIntensity = WeatherData.Timestamps(maxLightIntensity_index);

[maxTemperature,maxTemperature_index] = max(WeatherData.TemperatureC);
timeMaxTemperature = WeatherData.Timestamps(maxTemperature_index);