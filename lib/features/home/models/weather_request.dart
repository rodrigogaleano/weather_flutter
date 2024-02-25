class WeatherRequest {
  final int? count;
  final String? cityName;
  final double? latitude;
  final double? longitude;

  WeatherRequest({
    this.count,
    this.cityName,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    final request = {
      'units': 'metric', // TODO: Receber unidade de medida por parametro
      'q': cityName,
      'lat': latitude,
      'lon': longitude,
    };

    if (count != null) {
      request.addAll({
        'cnt': count,
      });
    }

    return request;
  }
}
