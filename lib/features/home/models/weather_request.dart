class WeatherRequest {
  final double latitude;
  final double longitude;

  WeatherRequest({required this.latitude, required this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'lat': latitude,
      'lon': longitude,
      'units': 'metric', // TODO: Receber unidade de medida por parametro
    };
  }
}
