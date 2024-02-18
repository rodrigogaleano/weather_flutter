class WeatherRequest {
  final String? cityName;
  final double? latitude;
  final double? longitude;

  WeatherRequest({
    this.cityName,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    if (cityName != null) {
      return {
        'q': cityName,
        'units': 'metric', // TODO: Receber unidade de medida por parametro
      };
    }

    return {
      'lat': latitude,
      'lon': longitude,
      'units': 'metric', // TODO: Receber unidade de medida por parametro
    };
  }
}
