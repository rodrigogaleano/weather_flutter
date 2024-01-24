class ApiHost {
  ApiHost._();

  static String get baseURL {
    return 'https://api.openweathermap.org/data/2.5/weather';
  }

  static Map<String, String> get defaultQueryParams {
    return {
      'units': 'metric',
      'appid': '602dcffff671d09fbb0b505f983e09d6',
    };
  }
}
