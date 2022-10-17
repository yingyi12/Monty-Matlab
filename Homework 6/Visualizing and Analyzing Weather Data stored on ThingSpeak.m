% read data from the public ThingSpeak Channel with the ID 12397. Request the data as described in the task.
WeatherData = thingSpeakRead(12397,'DateRange',[datetime(2020,5,10,4,0,0),datetime(2020,5,11,4,0,0)],'OutputFormat','timetable');