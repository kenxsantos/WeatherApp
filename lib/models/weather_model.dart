class WeatherModel {
  String? country;
  String? countryName;
  double? latitude;
  double? longitude;
  String? weatherDescription;
  double? temperature;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  double? windSpeed;
  int? windDeg;
  int? visibility;
  String? sunrise;
  String? sunset;
  int? timezone;

  WeatherModel({
    required this.country,
    required this.countryName,
    required this.latitude,
    required this.longitude,
    required this.weatherDescription,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.sunrise,
    required this.sunset,
    required this.timezone,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    country = json['sys']['country'];
    countryName = json['name'];
    latitude = (json['coord']['lat'] as num).toDouble();
    longitude = (json['coord']['lon'] as num).toDouble();
    weatherDescription = json['weather'][0]['description'];
    temperature = (json['main']['temp'] as num).toDouble();
    feelsLike = (json['main']['feels_like'] as num).toDouble();
    tempMin = (json['main']['temp_min'] as num).toDouble();
    tempMax = (json['main']['temp_max'] as num).toDouble();
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    visibility = json['visibility'];
    windSpeed = (json['wind']['speed'] as num).toDouble();
    windDeg = json['wind']['deg'];
    sunrise =
        DateTime.fromMillisecondsSinceEpoch(
          json['sys']['sunrise'] * 1000,
          isUtc: true,
        ).add(Duration(seconds: json['timezone'])).toString();
    sunset =
        DateTime.fromMillisecondsSinceEpoch(
          json['sys']['sunset'] * 1000,
          isUtc: true,
        ).add(Duration(seconds: json['timezone'])).toString();
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sys'] = <String, dynamic>{};
    data['coord'] = <String, dynamic>{};
    data['weather'] = <Map<String, dynamic>>[];
    data['main'] = <String, dynamic>{};
    data['wind'] = <String, dynamic>{};

    data['sys']['country'] = country;
    data['name'] = countryName;
    data['coord']['lat'] = latitude;
    data['coord']['lon'] = longitude;
    data['weather'].add(<String, dynamic>{'description': weatherDescription});
    data['main']['temp'] = temperature;
    data['main']['feels_like'] = feelsLike;
    data['main']['temp_min'] = tempMin;
    data['main']['temp_max'] = tempMax;
    data['main']['pressure'] = pressure;
    data['main']['humidity'] = humidity;
    data['visibility'] = visibility;
    data['wind']['speed'] = windSpeed;
    data['wind']['deg'] = windDeg;
    data['sys']['sunrise'] = sunrise;
    data['sys']['sunset'] = sunset;
    data['timezone'] = timezone;

    return data;
  }
}
